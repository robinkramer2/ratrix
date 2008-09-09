function out=extractDetailFields(sm,basicRecords,trialRecords)

%ok, trialRecords could just be the stimDetails, determined by this class's
%calcStim.  but you might want to do some processing that is sensitive to
%the combination of stimDetails and trialRecord values outside of stimDetails.

%basicRecords is most things outside of stimDetails (already processed into our format), but trialRecords is more complete

if ~all(strcmp({trialRecords.trialManagerClass},'nAFC'))
    error('only works for nAFC trial manager')
end

try
    stimDetails=[trialRecords.stimDetails];
    temp=[stimDetails.HFdetails];
    out.HFdetailsPctCorrectionTrials=ensureScalar({temp.pctCorrectionTrials});
    out.HFdetailsCorrectionTrial=ensureScalar({temp.correctionTrial});
    out.HFdetailsContrasts=ensureEqualLengthVects({temp.contrasts});
    out.HFdetailsXPosPcts=ensureEqualLengthVects({temp.xPosPcts});

    temp=[stimDetails.SDdetails];
    out.SDdetailsPctCorrectionTrials=ensureScalar({temp.pctCorrectionTrials});
    out.SDdetailsCorrectionTrial=ensureScalar({temp.correctionTrial});
    out.SDdetailsLeftAmplitude=ensureScalar({temp.leftAmplitude});
    out.SDdetailsRightAmplitude=ensureScalar({temp.rightAmplitude});

    out.HFtargetPorts=ensureScalar({stimDetails.HFtargetPorts});
    out.SDtargetPorts=ensureScalar({stimDetails.SDtargetPorts});
    out.HFdistractorPorts=ensureScalar({stimDetails.HFdistractorPorts});
    out.SDdistractorPorts=ensureScalar({stimDetails.SDdistractorPorts});

    if size(out.HFdetailsXPosPcts,1)==size(out.HFdetailsContrasts,1)
        if size(out.HFdetailsContrasts,1)>1
            [junk inds]=sort(out.HFdetailsXPosPcts);
            sz=size(out.HFdetailsContrasts);
            inds=sub2ind(sz,inds,repmat(1:sz(2),sz(1),1));
            temp=out.HFdetailsContrasts(inds);
            [junk inds]=max(temp);
            [answers cols]=find(repmat(max(temp),size(temp,1),1)==temp);
            targetIsRight=logical(answers-1);
            if ~all(cols==1:size(temp,2))
                error('nonunique answer')
            end
        else
            if ~any(out.HFdetailsXPosPcts==.5)
                targetIsRight=out.HFdetailsXPosPcts>.5;
            else
                error('XPosPct at .5')
            end
        end
    else
        size(out.HFdetailsXPosPcts,1)
        size(out.HFdetailsContrasts,1)
        error('dims of HFdetailsContrasts and HFdetailsXPosPcts don''t match')
    end
    checkTargs(targetIsRight,out.HFtargetPorts,out.HFdistractorPorts,basicRecords.numPorts);

    if ~any(out.SDdetailsLeftAmplitude==out.SDdetailsRightAmplitude)
        targetIsRight=out.SDdetailsLeftAmplitude<out.SDdetailsRightAmplitude;
    else
        error('left and right amplitude are equal')
    end
    checkTargs(targetIsRight,out.SDtargetPorts,out.SDdistractorPorts,basicRecords.numPorts);

    out.HFisCorrection=ensureScalar({stimDetails.HFisCorrection});
    out.SDisCorrection=ensureScalar({stimDetails.SDisCorrection});

    if ~all(out.HFisCorrection==out.HFdetailsCorrectionTrial) ||...
            ~all(out.SDisCorrection==out.SDdetailsCorrectionTrial)
        error('SD or HF isCorrection doesn''t match detailsCorrectionTrial')
    end

    out.currentModality=ensureScalar({stimDetails.currentModality});

    if ~all(arrayfun(@checkAnswers,out.currentModality,out.HFtargetPorts,out.HFdistractorPorts,out.SDtargetPorts,out.SDdistractorPorts,basicRecords.targetPorts,basicRecords.distractorPorts))
        error('inconsistent record')
    end

    out.isCorrection=nan*ones(1,length(trialRecords));
    out.isCorrection(out.currentModality==0)=out.HFisCorrection(out.currentModality==0);
    out.isCorrection(out.currentModality==1)=out.SDisCorrection(out.currentModality==1);
    if any(isnan(out.isCorrection))
        error('not all isCorrections assigned')
    end

    out.blockingLength=ensureScalar({stimDetails.blockingLength});
    out.isBlocking=ensureScalar({stimDetails.isBlocking});
    out.currentModalityTrialNum=ensureScalar({stimDetails.currentModalityTrialNum});

    out.modalitySwitchMethod=ensureTypedVector({stimDetails.modalitySwitchMethod},'char');
    out.modalitySwitchType=ensureTypedVector({stimDetails.modalitySwitchType},'char');
catch ex
    ex
    class(ex)
    if ismember(ex.identifier,{'MATLAB:nonExistentField','MATLAB:catenate:structFieldBad'}) %dan's early crossModal records just looked like pure audio or pure video without information on the unattended stimulus -- field names were different and change between audio and visual ones within a session+step without warning
        out=struct; %official way to bail
    elseif ismember(ex.identifier,{'MATLAB:nonStrucReference'}) %this occurs if we are sent zero trials in the input when we try to look past the first struct level down (which doesn't exist) -- eg   [stimDetails.HFdetails]
        out=struct; %bail again
    else
        rethrow(ex);
    end
end

verifyAllFieldsNCols(out,length(trialRecords));
end

function out=checkAnswers(modality,HFtarg,HFdistr,SDtarg,SDdistr,targs,distrs)
if isscalar(targs) && isscalar(distrs)
    targ=targs{1};
    distr=distrs{1};
else
    error('only works with scalar targs and distrs')
end
switch modality
    case 0
        if targ==HFtarg && distr==HFdistr
            %pass
        else
            error('HF targ or distr mismatch')
        end
    case 1
        if targ==SDtarg && distr==SDdistr
            %pass
        else
            error('SD targ or distr mismatch')
        end
    otherwise
        modality
        error('unrecognized modality')
end
out=true;
end

function checkTargs(targetIsRight,targetPorts,distractorPorts,numPorts)
%assumes left port is lowest num, right is highest.  how verify this or make it dynamic?
if numPorts<2
    error('requires at least 2 ports')
end

targets(targetIsRight)=max(1:numPorts);
targets(~targetIsRight)=min(1:numPorts);
if ~all(targets==targetPorts)
    error('bad targets')
end
distractors(targetIsRight)=min(1:numPorts);
distractors(~targetIsRight)=max(1:numPorts);
if ~all(distractors==distractorPorts)
    error('bad distractors')
end
end