function [stimulus,updateSM,resolutionIndex,out,LUT,scaleFactor,type,targetPorts,distractorPorts,details,interTrialLuminance,text,indexPulses] =...
    calcStim(stimulus,trialManagerClass,resolutions,displaySize,LUTbits,responsePorts,totalPorts,trialRecords)
% see ratrixPath\documentation\stimManager.calcStim.txt for argument specification (applies to calcStims of all stimManagers)
% 1/3/0/09 - trialRecords now includes THIS trial
indexPulses=[];
LUTbits
displaySize
[LUT stimulus updateSM]=getLUT(stimulus,LUTbits);
[resolutionIndex height width hz]=chooseLargestResForHzsDepthRatio(resolutions,[100 60],32,getMaxWidth(stimulus),getMaxHeight(stimulus));

if isnan(resolutionIndex)
    resolutionIndex=1;
end

scaleFactor = getScaleFactor(stimulus);
interTrialLuminance = getInterTrialLuminance(stimulus);

details.pctCorrectionTrials=.5; % need to change this to be passed in from trial manager
if ~isempty(trialRecords) && length(trialRecords)>=2
    lastRec=trialRecords(end-1);
else
    lastRec=[];
end
[targetPorts distractorPorts details]=assignPorts(details,lastRec,responsePorts,trialManagerClass);
switch trialManagerClass
    case 'freeDrinks'
        type='static';
    case 'nAFC'
        type={'trigger',true};
    case 'autopilot'
        type='static';
    otherwise
        error('unsupported trialManagerClass');
end

numFreqs=length(stimulus.pixPerCycs);
details.pixPerCyc=stimulus.pixPerCycs(ceil(rand*numFreqs));

numTargs=length(stimulus.targetOrientations);
details.orientations = stimulus.targetOrientations(ceil(rand(length(targetPorts),1)*numTargs));

numDistrs=length(stimulus.distractorOrientations);
if numDistrs>0
    numGabors=length(targetPorts)+length(distractorPorts);
    details.orientations = [details.orientations; stimulus.distractorOrientations(ceil(rand(length(distractorPorts),1)*numDistrs))];
    distractorLocs=distractorPorts;
else
    numGabors=length(targetPorts);
    distractorLocs=[];
end
details.phases=rand(numGabors,1)*2*pi;

xPosPcts = [linspace(0,1,totalPorts+2)]';
xPosPcts = xPosPcts(2:end-1);
details.xPosPcts = xPosPcts([targetPorts'; distractorLocs']);

details.contrast=stimulus.contrasts(ceil(rand*length(stimulus.contrasts))); % pick a random contrast from list

params = [repmat([stimulus.radius details.pixPerCyc],numGabors,1) details.phases details.orientations repmat([details.contrast stimulus.thresh],numGabors,1) details.xPosPcts repmat([stimulus.yPosPct],numGabors,1)];
out(:,:,1)=computeGabors(params,stimulus.mean,min(width,getMaxWidth(stimulus)),min(height,getMaxHeight(stimulus)),stimulus.waveform, stimulus.normalizedSizeMethod,0);
if iscell(type) && strcmp(type{1},'trigger')
    out(:,:,2)=stimulus.mean;
end

if strcmp(trialManagerClass,'nAFC') && details.correctionTrial
    text='correction trial!';
else
    text=sprintf('pixPerCyc: %g',details.pixPerCyc);
end

end % end function
