function [tm quit trialRecords eyeData gaze frameDropCorner station] ...
    = runRealTimeLoop(tm, window, ifi, stimSpecs, startingStimSpecInd, phaseData, stimManager, ...
    targetOptions, distractorOptions, requestOptions, interTrialLuminance, interTrialPrecision, ...
    station, manual,timingCheckPct,textLabel,rn,subID,stimID,protocolStr,ptbVersion,ratrixVersion,trialLabel,msAirpuff, ...
    originalPriority, verbose, eyeTracker, frameDropCorner,trialRecords)

% =====================================================================================================================
%   show movie following mario's 'ProgrammingTips' for the OpenGL version of PTB
%   http://www.kyb.tuebingen.mpg.de/bu/people/kleinerm/ptbosx/ptbdocu-1.0.5MK4R1.html
%   except we drop frames (~1 per 45mins at 100Hz) if we preload all textures as he recommends, so we make and load them each frame

% high level important settings -- should move all to stimManager
filtMode = 0;               %how to compute the pixel values when the texture is drawn scaled
%                           %0 = Nearest neighbour filtering, 1 = Bilinear filtering (default, and BAD)

framesPerUpdate = 1;        %set number of monitor refreshes for each one of your refreshes

labelFrames = 1;            %print a frame ID on each frame (makes frame calculation slow!)

Screen('Preference', 'TextRenderer', 0);  % consider moving to station.startPTB
Screen('Preference', 'TextAntiAliasing', 0); % consider moving to station.startPTB

if ismac
    %http://psychtoolbox.org/wikka.php?wakka=FaqPerformanceTuning1
    %Screen('DrawText'): This is fast and low-quality on MS-Windows and beautiful but slow on OS/X.
    %also not good enough on asus mobo w/8600
    
    %setting textrenderer and textantialiasing to 0 not good enough
    labelFrames=0;
end

dontclear = 2;              %will be passed to flip
%                           %0 = flip will set framebuffer to background (slow, but other options fail on some gfx cards, like the integrated gfx on our asus mobos?)
%                           %1 = flip will leave the buffer as is ("incremental drawing" - but unclear if it copies the buffer just drawn into the buffer you're about to draw to, or if it is from a frame before that...)
%                           %2 = flip does nothing, buffer state undefined (you must draw into each pixel if you care) - fastest
% =====================================================================================================================

trialInd=length(trialRecords);
expertCache=[];
ports=logical(0*readPorts(station));
lastPorts=ports;
lastRequestPorts=ports;
playRequestSoundLoop=false;
% allRequestOptions=requestOptions;

requestRewardStarted=false;
requestRewardStartLogged=false;
requestRewardDone=false;
requestRewardDurLogged=false;
requestRewardOpenCmdDone=false;

rewardCurrentlyOn=false;
msRewardOwed=0;
msRequestRewardOwed=0;
msAirpuffOwed=0;
airpuffOn=false;
lastAirpuffTime=[];
msRewardSound=0;
msPenaltySound=0;
lastRewardTime=[];

quit=false;
responseOptions = union(targetOptions, distractorOptions);
done=0;
eyeData=[];
gaze=[];
soundNames=getSoundNames(getSoundManager(tm));

% although we load our phase-specific data from phaseInd, we record into phaseRecords using phaseNum b/c we might repeat phases!
% each phaseRecord should save the phaseInd and phaseInd
% edf: did you mean "and stimSpecInd"?
phaseInd = startingStimSpecInd; % which phase we are on (index for stimSpecs and phaseData)
phaseNum = 0; % increasing counter for each phase that we visit (may not match phaseInd if we repeat phases) - start at 0 b/c we increment during updatePhase
updatePhase = 1; % are we starting a new phase?

lastI = 0;
isRequesting=0;
allowKeyboard=true;

lastSoundsLooped={};
totalEyeDataInd=1;
doFramePulse=1;

doValves=0*ports;
newValveState=doValves;
doPuff=false;

% =========================================================================

timestamps.loopStart=0;
timestamps.phaseUpdated=0;
timestamps.frameDrawn=0;
timestamps.frameDropCornerDrawn=0;
timestamps.textDrawn=0;
timestamps.drawingFinished=0;
timestamps.when=0;
timestamps.prePulses=0;
timestamps.postFlipPulse=0;
timestamps.missesRecorded=0;
timestamps.eyeTrackerDone=0;
timestamps.kbCheckDone=0;
timestamps.keyboardDone=0;
timestamps.enteringPhaseLogic=0;
timestamps.phaseLogicDone=0;
timestamps.rewardDone=0;
timestamps.serverCommDone=0;
timestamps.phaseRecordsDone=0;
timestamps.loopEnd=0;
timestamps.prevPostFlipPulse=0;
timestamps.vbl=0;
timestamps.ft=0;
timestamps.missed=0;
timestamps.lastFrameTime=0;

timestamps.logicGotSounds=0;
timestamps.logicSoundsDone=0;
timestamps.logicFramesDone=0;
timestamps.logicPortsDone=0;
timestamps.logicRequestingDone=0;

timestamps.kbOverhead=0;
timestamps.kbInit=0;
timestamps.kbKDown=0;

% =========================================================================

responseDetails.numMisses=0;
responseDetails.numApparentMisses=0;

responseDetails.numUnsavedMisses=0;
responseDetails.numUnsavedApparentMisses=0;

responseDetails.misses=[];
responseDetails.apparentMisses=[];

responseDetails.afterMissTimes=[];
responseDetails.afterApparentMissTimes=[];

responseDetails.missIFIs=[];
responseDetails.apparentMissIFIs=[];

responseDetails.missTimestamps=timestamps;
responseDetails.apparentMissTimestamps=timestamps;

responseDetails.numDetailedDrops=1000;

responseDetails.nominalIFI=ifi;
responseDetails.tries={};
responseDetails.times={};
responseDetails.durs={};
% responseDetails.requestRewardDone=false;
resposneDetails.requestRewardPorts=[];
responseDetails.requestRewardStartTime=[];
responseDetails.requestRewardDurationActual=[];

responseDetails.startTime=[];

% =========================================================================

phaseRecordAllocChunkSize = 1;
[phaseRecords(1:length(stimSpecs)).responseDetails]= deal(responseDetails);
[phaseRecords(1:length(stimSpecs)).response]=deal('none');

[phaseRecords(1:length(stimSpecs)).proposedRewardDurationMSorUL] = deal(0);
[phaseRecords(1:length(stimSpecs)).proposedAirpuffDuration] = deal(0);
[phaseRecords(1:length(stimSpecs)).actualRewardDurationMSorUL] = deal(0);
[phaseRecords(1:length(stimSpecs)).actualAirpuffDuration] = deal(0);

[phaseRecords(1:length(stimSpecs)).valveErrorDetails]=deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToOpenValves]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToCloseValveRecd]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToCloseValves]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToRewardCompleted]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToRewardCompletelyDone]= deal([]);
[phaseRecords(1:length(stimSpecs)).primingValveErrorDetails]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToOpenPrimingValves]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToClosePrimingValveRecd]= deal([]);
[phaseRecords(1:length(stimSpecs)).latencyToClosePrimingValves]= deal([]);
[phaseRecords(1:length(stimSpecs)).actualPrimingDuration]= deal([]);

[phaseRecords(1:length(stimSpecs)).containedManualPokes]= deal([]);
[phaseRecords(1:length(stimSpecs)).leftWithManualPokingOn]= deal([]);
[phaseRecords(1:length(stimSpecs)).containedAPause]= deal([]);
[phaseRecords(1:length(stimSpecs)).didHumanResponse]= deal([]);
[phaseRecords(1:length(stimSpecs)).containedForcedRewards]= deal([]);
[phaseRecords(1:length(stimSpecs)).didStochasticResponse]= deal([]);

% =========================================================================

if ~isempty(rn)
    constants = getConstants(rn);
end

if strcmp(getRewardMethod(station),'serverPump')
    if isempty(rn) || ~isa(rn,'rnet')
        error('need an rnet for station with rewardMethod of serverPump')
    end
end

[keyIsDown,secs,keyCode]=KbCheck; %load mex files into ram + preallocate return vars
GetSecs;
Screen('Screens');

if window>0
    standardFontSize=11;
    oldFontSize = Screen('TextSize',window,standardFontSize);
    [normBoundsRect, offsetBoundsRect]= Screen('TextBounds', window, 'TEST');
end

%KbName('UnifyKeyNames'); %does not appear to choose keynamesosx on windows - KbName('KeyNamesOSX') comes back wrong

%consider using RestrictKeysForKbCheck for speedup of KbCheck

KbConstants.allKeys=KbName('KeyNames');
KbConstants.allKeys=lower(cellfun(@char,KbConstants.allKeys,'UniformOutput',false));
KbConstants.controlKeys=find(cellfun(@(x) ~isempty(x),strfind(KbConstants.allKeys,'control')));
KbConstants.shiftKeys=find(cellfun(@(x) ~isempty(x),strfind(KbConstants.allKeys,'shift')));
KbConstants.kKey=KbName('k');
KbConstants.pKey=KbName('p');
KbConstants.qKey=KbName('q');
KbConstants.mKey=KbName('m');
KbConstants.aKey=KbName('a');
KbConstants.rKey=KbName('r');
KbConstants.tKey=KbName('t');
KbConstants.fKey=KbName('f');
KbConstants.atKeys=find(cellfun(@(x) ~isempty(x),strfind(KbConstants.allKeys,'@')));
KbConstants.asciiOne=double('1');
KbConstants.portKeys={};
for i=1:length(ports)
    KbConstants.portKeys{i}=find(strncmp(char(KbConstants.asciiOne+i-1),KbConstants.allKeys,1));
end
KbConstants.numKeys={};
for i=1:10
    KbConstants.numKeys{i}=find(strncmp(char(KbConstants.asciiOne+i-1),KbConstants.allKeys,1));
end

priorityLevel=MaxPriority('GetSecs','KbCheck');

Priority(priorityLevel);

% =========================================================================

if ~isempty(eyeTracker)
    perTrialSyncing=false; %could pass this in if we ever decide to use it; now we don't
    if perTrialSyncing && isa(eyeTracker,'eyeLinkTracker')
        status=Eyelink('message','SYNCTIME');
        if status~=0
            error('message error, status: %g',status)
        end
    end
    
    framesPerAllocationChunk=getFramesPerAllocationChunk(eyeTracker);
    
    % dont do this initialize-time preallocation b/c we will dynamically allocate every frame depending on the number of samples retrieved
    %     if isa(eyeTracker,'eyeLinkTracker')
    %         eyeData=nan(framesPerAllocationChunk,40);
    %         gaze=nan(framesPerAllocationChunk,2);
    %     else
    %         error('no other methods')
    %     end
end

% =========================================================================

didAPause=0;
didManual=false;
paused=0;
pressingM=0;
pressingP=0;
framesSinceKbInput = 0;
shiftDown=false;
ctrlDown=false;
atDown=false;
kDown=false;
portsDown=false(1,length(ports));
pNum=0;

trialRecords(trialInd).response='none'; %initialize
analogOutput=[];
startTime=0;
logIt=true;
lookForChange=false;

if ~isempty(tm.datanet)
    datanet_constants = getConstants(tm.datanet);
    commands.cmd = datanet_constants.stimToDataCommands.S_TIMESTAMP_CMD;
    [trialData, gotAck] = sendCommandAndWaitForAck(tm.datanet, getCon(tm.datanet), commands);
end

% =========================================================================
% do first frame and  any stimulus onset synched actions
% make sure everything after this point is preallocated
% efficiency is crticial from now on

if window>0
    % draw interTrialLuminance first
    interTrialTex=Screen('MakeTexture', window, interTrialLuminance,0,0,interTrialPrecision); %need floatprecision=0 for remotedesktop
    Screen('DrawTexture', window, interTrialTex,phaseData{end}.destRect, [], filtMode);
    [timestamps.vbl sos startTime]=Screen('Flip',window);
end

timestamps.lastFrameTime=GetSecs;
timestamps.missesRecorded       = timestamps.lastFrameTime;
timestamps.eyeTrackerDone       = timestamps.lastFrameTime;
timestamps.kbCheckDone          = timestamps.lastFrameTime;
timestamps.keyboardDone         = timestamps.lastFrameTime;
timestamps.enteringPhaseLogic   = timestamps.lastFrameTime;
timestamps.phaseLogicDone       = timestamps.lastFrameTime;
timestamps.rewardDone           = timestamps.lastFrameTime;
timestamps.serverCommDone       = timestamps.lastFrameTime;
timestamps.phaseRecordsDone     = timestamps.lastFrameTime;
timestamps.loopEnd              = timestamps.lastFrameTime;
timestamps.prevPostFlipPulse    = timestamps.lastFrameTime;

%show stim -- be careful in this realtime loop!
while ~done && ~quit;
    timestamps.loopStart=GetSecs;
    
    xOrigTextPos = 10;
    xTextPos=xOrigTextPos;
    yTextPos = 20;
    
    if updatePhase == 1
        
        startTime=GetSecs(); % startTime is now per-phase instead of per trial, since corresponding times in responseDetails are also per-phase
        phaseNum=phaseNum+1;
        if phaseNum>length(phaseRecords)
            
            nextPhaseRecordNum=length(phaseRecords)+1;
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).responseDetails]= deal(responseDetails);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).response]=deal('none');
            
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).proposedRewardDurationMSorUL] = deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).proposedAirpuffDuration] = deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).actualRewardDurationMSorUL] = deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).actualAirpuffDuration] = deal([]);
            
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).valveErrorDetails]=deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToOpenValves]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToCloseValveRecd]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToCloseValves]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToRewardCompleted]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToRewardCompletelyDone]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).primingValveErrorDetails]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToOpenPrimingValves]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToClosePrimingValveRecd]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).latencyToClosePrimingValves]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).actualPrimingDuration]= deal([]);
            
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).containedManualPokes]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).leftWithManualPokingOn]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).containedAPause]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).didHumanResponse]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).containedForcedRewards]= deal([]);
            [phaseRecords(nextPhaseRecordNum:nextPhaseRecordNum+phaseRecordAllocChunkSize).didStochasticResponse]= deal([]);
        end
        
        i=0;
        frameIndex=0;
        frameNum=1;
        phaseStartTime=GetSecs;
        firstVBLofPhase=timestamps.vbl;
       
        didPulse=0;
        didValves=0;
        arrowKeyDown=false;
%         allowKeyboard=false;
        
        %         puffStarted=0;
        %         puffDone=false;
        
        currentValveState=getValves(station); % cant do verifyClosed here because it might be open from a reward from previous phase
        serverValveChange=false;
        serverValveStates=false;
        didStochasticResponse=false;
        didHumanResponse=false;
        
        % =========================================================================
        phase = phaseData{phaseInd};
        floatprecision = phase.floatprecision;
        frameIndexed = phase.frameIndexed;
        loop = phase.loop;
        trigger = phase.trigger;
        timeIndexed = phase.timeIndexed;
        indexedFrames = phase.indexedFrames;
        timedFrames = phase.timedFrames;
        strategy = phase.strategy;
        
        destRect = phase.destRect;
        textures = phase.textures;
        
        % =========================================================================
        spec = stimSpecs{phaseInd};
        stim = getStim(spec);
        transitionCriterion = getTransitions(spec);
        framesUntilTransition = getFramesUntilTransition(spec);
        
        % =========================================================================
        phaseType = getPhaseType(spec);
        if isempty(phaseType)
            % not correct or error, do nothing
        elseif ismember(phaseType,{'correct','error'})
            [rm rewardSizeULorMS requestRewardSizeULorMS msPenalty msPuff msRewardSound msPenaltySound updateRM] =...
                calcReinforcement(getReinforcementManager(tm),trialRecords, []);
            
            if updateRM
                tm=setReinforcementManager(tm,rm);
            end
            
            if strcmp(phaseType,'correct')
                
%                 dispStr=sprintf('increasing msRewardOwed by %d during phaseNum %d\n',rewardSizeULorMS,phaseNum);
%                 disp(dispStr);
                msRewardOwed=msRewardOwed+rewardSizeULorMS;
                doRequestReward=false; % doing a normal reward, not a request reward now
                
                if window>0
                    if isempty(framesUntilTransition)
                        framesUntilTransition = ceil((rewardSizeULorMS/1000)/ifi);
                    end
                elseif strcmp(tm.displayMethod,'LED')
                    if isempty(framesUntilTransition)
                        framesUntilTransition=ceil(getHz(spec)*rewardSizeULorMS/1000);
                        if isscalar(squeeze(stim))
                            stim=stim*ones(framesUntilTransition,1); %need to lengthen the stim cuz rewards are currently timed based on frames
                        else
                            size(stim)
                            error('stim wasn''t scalar')
                        end
                    else
                        framesUntilTransition
                        error('LED needs framesUntilTransition empty for reward')
                    end
                else
                    error('huh?')
                end
                phaseRecords(phaseNum).proposedRewardDurationMSorUL = rewardSizeULorMS;
                
            elseif strcmp(phaseType,'error')
                
                % should we update msAirpuffOwed with the msPuff value?
                % msAirpuffOwed = msAirpuffOwed + msPuff;
                
                if window>0
                    numErrorFrames=ceil((msPenalty/1000)/ifi);
                elseif strcmp(tm.displayMethod,'LED')
                    numErrorFrames=ceil(getHz(spec)*msPenalty/1000);
                else
                    error('huh?')
                end
                
                if isempty(stim)
                    [stim errorScale] = errorStim(stimManager,numErrorFrames);
                    
                    if window>0
                        [floatprecision stim] = determineColorPrecision(tm, stim, strategy);
                        textures = cacheTextures(tm,strategy,stim,window,floatprecision);
                        destRect=Screen('Rect',window);
                    elseif strcmp(tm.displayMethod,'LED')
                        floatprecision=[];
                    else
                        error('huh?')
                    end
                end
                
                if isempty(framesUntilTransition)
                    framesUntilTransition = numErrorFrames;
                elseif strcmp(tm.displayMethod,'LED')
                    error('LED needs framesUntilTransition empty for error')
                end
            end
        else
            phaseType
            error('unrecognized phase type')
        end
        
        % =========================================================================
        
        if ~isempty(getStartFrame(spec))
            i=getStartFrame(spec);
        end
        
        if ischar(strategy) && strcmp(strategy,'cache')
            numFramesInStim = size(stim)-i;
        elseif timeIndexed
            if timedFrames(end)==0
                numFramesInStim = Inf; % hold last frame, so even in 'cache' mode we are okay
            else
                numFramesInStim = sum(timedFrames);
            end
        else
            numFramesInStim = Inf;
        end
        
        % we might need to do if isempty(framesUntilTransition) && strategy is 'cache', then set a framesUntilTransition==size(stim,3)
        
        stepsInPhase = 0;
        isFinalPhase = getIsFinalPhase(spec);
        stochasticDistribution = getStochasticDistribution(spec);
        
        % =========================================================================
        
        phaseRecords(phaseNum).dynamicDetails={};
        phaseRecords(phaseNum).loop = loop;
        phaseRecords(phaseNum).trigger = trigger;
        phaseRecords(phaseNum).strategy = strategy;
        phaseRecords(phaseNum).stochasticProbability = stochasticDistribution;
        phaseRecords(phaseNum).timeoutLengthInFrames = framesUntilTransition;
        phaseRecords(phaseNum).floatprecision = floatprecision;
        % phaseRecords(phaseNum).stim=stim;
        phaseRecords(phaseNum).phaseType = phaseType;
        
        phaseRecords(phaseNum).responseDetails.startTime = startTime;
        
        updatePhase = 0;
        
        % =========================================================================
        if strcmp(tm.displayMethod,'LED')
            station=stopPTB(station); %should handle this better -- LED setting is trialManager specific, so other training steps will expect ptb to still exist
            %would prefer to never startPTB until a trialManager needs it,and then start it at the proper res the first time
            %trialManager.doTrial should startPTB if it wants one and there isn't one, and stop it if there is one and it doesn't want it
            %note that ifi is not coming in empty on the first trial and the leftover value from the screen is misleading, need to fix...
  
            [phaseRecords analogOutput outputsamplesOK] = LEDphase(tm,phaseInd,analogOutput,phaseRecords,spec,interTrialLuminance,stim,frameIndexed,indexedFrames,loop,trigger,timeIndexed,timedFrames,station);
        end 
    end % fininshed with phaseUpdate
    
    timestamps.phaseUpdated=GetSecs;
    doFramePulse=true;
    
    if window>0
        
        if ~paused
            
            scheduledFrameNum=ceil((GetSecs-firstVBLofPhase)/(framesPerUpdate*ifi)); %could include pessimism about the time it will take to get from here to the flip and how much advance notice flip needs
            % this will surely have drift errors...
            % note this does not take pausing into account -- edf thinks we should get rid of pausing
            
            switch strategy
                case {'textureCache','noCache'}
                    [tm frameIndex i done doFramePulse didPulse] ...
                        = updateFrameIndexUsingTextureCache(tm, frameIndexed, loop, trigger, timeIndexed, frameIndex, indexedFrames, size(stim,3), isRequesting, ...
                        i, frameNum, timedFrames, responseOptions, done, doFramePulse, didPulse, scheduledFrameNum);
                    switch strategy
                        case 'textureCache'
                            drawFrameUsingTextureCache(tm, window, i, frameNum, size(stim,3), lastI, dontclear, textures(i), destRect, ...
                                filtMode, labelFrames, xOrigTextPos, yTextPos);
                        case 'noCache'
                            drawFrameUsingTextureCache(tm, window, i, frameNum, size(stim,3), lastI, dontclear, squeeze(stim(:,:,i)), destRect, ...
                                filtMode, labelFrames, xOrigTextPos, yTextPos,strategy,floatprecision);
                    end
                case 'expert'
                    % i=i+1; % 11/7/08 - this needs to happen first because i starts at 0
                    [doFramePulse expertCache dynamicDetails textLabel i] ...
                        = drawExpertFrame(stimManager,stim,i,phaseStartTime,window,textLabel,...
                        floatprecision,destRect,filtMode,expertCache,ifi,scheduledFrameNum,tm.dropFrames);
                    if ~isempty(dynamicDetails)
                        phaseRecords(phaseNum).dynamicDetails{end+1}=dynamicDetails; % dynamicDetails better specify what frame it is b/c the record will not save empty details
                    end
                otherwise
                    error('unrecognized strategy')
            end
            
            timestamps.frameDrawn=GetSecs;
            
            if frameDropCorner.on
                Screen('FillRect', window, frameDropCorner.seq(frameDropCorner.ind), frameDropCorner.rect);
                frameDropCorner.ind=frameDropCorner.ind+1;
                if frameDropCorner.ind>length(frameDropCorner.seq)
                    frameDropCorner.ind=1;
                end
            end
            
            timestamps.frameDropCornerDrawn=GetSecs;
            
            %text commands are supposed to be last for performance reasons
            if manual
                didManual=1;
            end
            if window>=0
                xTextPos = drawText(tm, window, labelFrames, subID, xOrigTextPos, yTextPos, normBoundsRect, stimID, protocolStr, ...
                    textLabel, trialLabel, i, frameNum, manual, didManual, didAPause, ptbVersion, ratrixVersion,phaseRecords(phaseNum).responseDetails.numMisses, phaseRecords(phaseNum).responseDetails.numApparentMisses, phaseInd, getStimType(spec));
            end
            
            timestamps.textDrawn=GetSecs;
            
        else
            %do we need to copy previous screen?
            %Screen('CopyWindow', window, window);
            if window>=0
                Screen('FillRect',window)
                Screen('DrawText',window,'paused (k+p to toggle)',xTextPos,yTextPos,100*ones(1,3));
            end
        end
        
        timestamps = flipFrameAndDoPulse(tm, window, dontclear, framesPerUpdate, ifi, paused, doFramePulse,station,timestamps);
        lastI=i;
        
        [phaseRecords(phaseNum).responseDetails timestamps] = ...
            saveMissedFrameData(tm, phaseRecords(phaseNum).responseDetails, frameNum, timingCheckPct, ifi, timestamps);
        
        timestamps.missesRecorded=GetSecs;
    else
        
        if ~isempty(analogOutput) || window<=0 || strcmp(tm.displayMethod,'LED')
            phaseRecords(phaseNum).LEDintermediateTimestamp=GetSecs; %need to preallocate
            phaseRecords(phaseNum).intermediateSampsOutput=get(analogOutput,'SamplesOutput'); %need to preallocate
            
            if ~isempty(framesUntilTransition)
                %framesUntilTransition is calculated off of the screen's ifi which is not correct when using LED
                framesUntilTransition=stepsInPhase+2; %prevent handlePhasedTrialLogic from tripping to next phase
            end
            
            %note this logic is related to updateFrameIndexUsingTextureCache
            if ~loop && (get(analogOutput,'SamplesOutput')>=length(data) || ~outputsamplesOK)
                if isempty(responseOptions)
                    done=1;
                end
                if ~isempty(framesUntilTransition)
                    framesUntilTransition=stepsInPhase+1; %cause handlePhasedTrialLogic to trip to next phase
                end
            end
        end
        
    end
    
    % =========================================================================
    
    if ~isempty(eyeTracker)
        if ~checkRecording(eyeTracker)
            sca
            error('lost tracker connection!')
        end
        
        % change to get multiple samples (as many as are available)
        [gazes samples] = getSamples(eyeTracker);
        numEyeTrackerSamples = size(samples,1);
        
        % allocate space in gaze and eyeData - based on numEyeTrackerSamples (this will happen every frame)
        % see if this causes framedrops...
        if totalEyeDataInd>length(eyeData) % should always be true (totalEyeDataInd=end+1)
            %  allocateMore
            newEnd=length(eyeData)+ numEyeTrackerSamples;
            %             disp(sprintf('did allocation to eyeTrack data; up to %d samples enabled',newEnd))
            eyeData(end+1:newEnd,:)=nan;
            gaze(end+1:newEnd,:)=nan;
        end
        
        gaze(totalEyeDataInd:totalEyeDataInd+numEyeTrackerSamples-1,:) = gazes;
        eyeData(totalEyeDataInd:totalEyeDataInd+numEyeTrackerSamples-1,:) = samples;
        % [gaze(totalEyeDataInd,:) eyeData(totalEyeDataInd,:)]=getSample(eyeTracker);
        
        totalEyeDataInd = totalEyeDataInd + numEyeTrackerSamples;
        
    end
    
    timestamps.eyeTrackerDone=GetSecs;
    
    % =========================================================================
    % all trial logic follows
    
    if ~paused
        ports=readPorts(station);
    end
    doValves=0*ports;
    doPuff=false;
    
    [keyIsDown,secs,keyCode]=KbCheck; % do this check outside of function to save function call overhead
    timestamps.kbCheckDone=GetSecs;
    
    if keyIsDown && allowKeyboard
        [didAPause paused done phaseRecords(phaseNum).response doValves ports didValves didHumanResponse manual ...
            doPuff pressingM pressingP,timestamps.kbOverhead,timestamps.kbInit,timestamps.kbKDown,allowKeyboard] ...
            = handleKeyboard(tm, keyCode, didAPause, paused, done, phaseRecords(phaseNum).response, doValves, ports, didValves, didHumanResponse, ...
            manual, doPuff, pressingM, pressingP, originalPriority, priorityLevel, KbConstants, allowKeyboard);
    else
        % require a break between keyboard inputs
        allowKeyboard=true;
    end
    
    timestamps.keyboardDone=GetSecs;
    
    % do stochastic port hits after keyboard so that wont happen if another port already triggered
    if ~paused
        if ~isempty(stochasticDistribution) && ~any(ports)
            for j=1:2:length(stochasticDistribution)
                if rand<stochasticDistribution{j}
                    ports(stochasticDistribution{j+1}) = 1;
                    didStochasticResponse=true; %edf: shouldn't this only be if one was tripped?
                    break;
                end
            end
        end
    end
    
    if ~paused
        if lookForChange && any(ports~=lastPorts) % end of a response
            phaseRecords(thisResponsePhaseNum).responseDetails.durs{end+1} = GetSecs() - respStart;
            lookForChange=false;
%             dispStr=sprintf('marking end of a response at time %d with dur %d during phaseNum %d\n',GetSecs(),phaseRecords(thisResponsePhaseNum).responseDetails.durs{end},thisResponsePhaseNum);
%             disp(dispStr);
        end

        if any(ports(responseOptions)) || any(ports(requestOptions))
            logIt=true;
        end

        % 1/21/09 - how should we handle tries? - do we count attempts that occur during a phase w/ no port transitions (ie timeout only)?
        if any(ports~=lastPorts) && logIt
            phaseRecords(phaseNum).responseDetails.tries{end+1} = ports;
            phaseRecords(phaseNum).responseDetails.times{end+1} = GetSecs() - startTime;
            respStart = GetSecs();
            playRequestSoundLoop = false;
            logIt=false;
            lookForChange=true;
            thisResponsePhaseNum=phaseNum;
%             dispStr=sprintf('marking start of a response [%d %d %d] at time %d during phaseNum %d\n',ports,respStart,phaseNum);
%             disp(dispStr);
        end

        % if phaseRecords(phaseNum).response got set by keyboard, duplicate response on trial level
        if ~strcmp('none', phaseRecords(phaseNum).response)
            trialRecords(trialInd).response = phaseRecords(phaseNum).response;
        end
    end
    
    timestamps.enteringPhaseLogic=GetSecs;
    
    if ~paused
        [tm done newSpecInd phaseInd updatePhase transitionedByTimeFlag ...
            transitionedByPortFlag phaseRecords(phaseNum).response trialRecords(trialInd).response isRequesting lastSoundsLooped ...
            timestamps.logicGotSounds timestamps.logicSoundsDone timestamps.logicFramesDone timestamps.logicPortsDone timestamps.logicRequestingDone goDirectlyToError] ...
            = handlePhasedTrialLogic(tm, done, ...
            ports, lastPorts, station, phaseInd, transitionCriterion, framesUntilTransition, numFramesInStim, stepsInPhase, isFinalPhase, ...
            phaseRecords(phaseNum).response, trialRecords(trialInd).response, ...
            stimManager, msRewardSound, msPenaltySound, targetOptions, distractorOptions, requestOptions, ...
            playRequestSoundLoop, isRequesting, soundNames, lastSoundsLooped);

        % if goDirectlyToError, then reset newSpecInd to the first error phase in stimSpecs
        if goDirectlyToError
            newSpecInd=find(strcmp(cellfun(@getPhaseType,stimSpecs,'UniformOutput',false),'error'));
        end

    end
    timestamps.phaseLogicDone=GetSecs;
    
    % =========================================================================
    
    % because the target ports = setdiff(responsePorts, lastResponse) which is always empty
    % so we will always have the same empty responsePorts and same nonempty requestPorts
    % we do the repeat-checking in runRealTimeLoop using ~any(ports==lastRequestPorts)
    % should we save lastRequestPorts somewhere in trialRecord so we can load the correct value for the next trial...?
    % edf: i don't follow this comment
    if (any(ports(requestOptions)) && ~any(lastPorts(requestOptions))) && ... % if a request port is triggered
            ((strcmp(getRequestMode(getReinforcementManager(tm)),'nonrepeats') && ~any(ports&lastRequestPorts)) || ... % if non-repeat
            strcmp(getRequestMode(getReinforcementManager(tm)),'all') || ...  % all requests
            ~requestRewardDone) % first request
        
        [rm rewardSizeULorMS requestRewardSizeULorMS msPenalty msPuff msRewardSound msPenaltySound updateRM] =...
            calcReinforcement(getReinforcementManager(tm),trialRecords, []);
        
        doRequestReward=true; % flag so we know if we are doing a request reward or a normal reward
        msRequestRewardOwed = msRequestRewardOwed + requestRewardSizeULorMS;
        dispStr=sprintf('increasing msRequestRewardOwed by %d during phaseNum %d\n',requestRewardSizeULorMS,phaseNum);
        disp(dispStr)
        phaseRecords(phaseNum).responseDetails.requestRewardPorts=ports;
        phaseRecords(phaseNum).responseDetails.requestRewardStartTime=GetSecs();
        requestRewardDone=true;
        if updateRM
            tm=setReinforcementManager(tm,rm);
        end
        lastRequestPorts=ports; % do we even need this?
        playRequestSoundLoop=true;
    end
    
    if ~isempty(lastRewardTime) && rewardCurrentlyOn
        elapsedTime = GetSecs() - lastRewardTime;
        if strcmp(getRewardMethod(station),'localTimed')
            if ~doRequestReward % this was a normal reward, log it
                msRewardOwed = msRewardOwed - elapsedTime*1000.0;
%                 elapsedTime*1000.0
%                 msRewardOwed
%                 msRequestRewardOwed
                phaseRecords(phaseNum).actualRewardDurationMSorUL = phaseRecords(phaseNum).actualRewardDurationMSorUL + elapsedTime*1000.0;
%                 phaseRecords(phaseNum).actualRewardDurationMSorUL
            else % this was a request reward, dont log it
                msRequestRewardOwed = msRequestRewardOwed - elapsedTime*1000.0;
                phaseRecords(phaseNum).responseDetails.requestRewardDurationActual=phaseRecords(phaseNum).responseDetails.requestRewardDurationActual+elapsedTime*1000.0;
            end
        elseif strcmp(getRewardMethod(station),'localPump')
            % in localPump mode, msRewardOwed gets zeroed out after the call to station/doReward
        end
    end
    lastRewardTime = GetSecs();
    
    rStart = msRewardOwed+msRequestRewardOwed > 0.0 && ~rewardCurrentlyOn;
    rStop = msRewardOwed+msRequestRewardOwed <= 0.0 && rewardCurrentlyOn;
    
    if rStop % if stop, then reset owed time to zero
        msRewardOwed=0;
        msRequestRewardOwed=0;
    end
    currentValveStates=getValves(station);
    
    % if any doValves, override this stuff
    % newValveState will be used to keep track of doValves stuff - figure out server-based use later
    if any(doValves~=newValveState)
        switch getRewardMethod(station)
            case 'localTimed'
                [newValveState phaseRecords(phaseNum).valveErrorDetails]=...
                    setAndCheckValves(station,doValves,currentValveStates,phaseRecords(phaseNum).valveErrorDetails,GetSecs,'doValves');
            case 'localPump'
                if any(doValves)
                    primeMLsPerSec=1.0;
                    if window<=0 || strcmp(tm.displayMethod,'LED')
                        ifi
                        error('ifi will not be appropriate here when using LED')
                    else
                        station=doReward(station,primeMLsPerSec*ifi,doValves,true);
                    end
                end
                newValveState=0*doValves; % set newValveStates to 0 because localPump locks the loop while calling doReward
            otherwise
                error('unsupported rewardMethod');
        end
        
    else
        if rStart || rStop
            rewardValves=zeros(1,getNumPorts(station));
            % we give the reward at whatever port is specified by the current phase (weird...fix later?)
            % the default if the current phase does not have a transition port is the requestOptions (input to stimOGL)
            % 1/29/09 - fix, but for now rewardValves is jsut wahtever the current port triggered is (this works for now..)
            if strcmp(class(ports),'double') %happens on osx, why?
                ports=logical(ports);
            end
            rewardValves(ports)=1;
            
            %         if isempty(rewardPorts)
            %             rewardValves(requestOptions) = 1;
            %         else
            %             rewardValves(rewardPorts)=1;
            %         end
            rewardValves=logical(rewardValves);
            
            if length(rewardValves) ~= 3
                error('rewardValves has %d and currentValveStates has %d with port = %d', length(rewardValves), length(currentValveStates), port);
            end
            
            switch getRewardMethod(station)
                case 'localTimed'
                    if rStart
                        rewardCurrentlyOn = true;
                        [currentValveStates phaseRecords(phaseNum).valveErrorDetails]=...
                            setAndCheckValves(station,rewardValves,currentValveStates,phaseRecords(phaseNum).valveErrorDetails,lastRewardTime,'correct reward open');
                    elseif rStop
                        rewardCurrentlyOn = false;
                        [currentValveStates phaseRecords(phaseNum).valveErrorDetails]=...
                            setAndCheckValves(station,zeros(1,getNumPorts(station)),currentValveStates,phaseRecords(phaseNum).valveErrorDetails,lastRewardTime,'correct reward close');
                        % newValveState=doValves|rewardValves; % this shouldnt be used for now...figure out later...
                    else
                        error('has to be either start or stop - should not be here');
                    end
                case 'localPump'
                    if rStart
                        rewardCurrentlyOn=true;
                        station=doReward(station,(msRewardOwed+msRequestRewardOwed)/1000,rewardValves);
                        phaseRecords(phaseNum).actualRewardDurationMSorUL = phaseRecords(phaseNum).actualRewardDurationMSorUL + msRewardOwed;
                        msRewardOwed=0;
                        msRequestRewardOwed=0;
                        requestRewardDone=true;
                    elseif rStop
                        rewardCurrentlyOn=false;
                    end
                case 'serverPump'
                    
                    [currentValveState phaseRecords(phaseNum).valveErrorDetails quit serverValveChange phaseRecords(phaseNum).responseDetails ...
                        requestRewardStartLogged requestRewardDurLogged phaseRecords(phaseNum)] ... 
                        = serverPumpRewards(tm, rn, station, newValveState, currentValveState, phaseRecords(phaseNum).valveErrorDetails, ...
                        startTime, serverValveChange, requestRewardStarted, ...
                        requestRewardStartLogged, rewardValves, requestRewardDone, ...
                        requestRewardDurLogged, phaseRecords(phaseNum).responseDetails, quit, phaseRecords(phaseNum));
                    
                otherwise
                    error('unsupported rewardMethod');
            end
        end
        
    end % end valves
    
    timestamps.rewardDone=GetSecs;
    
    if ~isempty(rn) || strcmp(getRewardMethod(station),'serverPump')
        [done quit phaseRecords(phaseNum).valveErrorDetails serverValveStates serverValveChange ...
            trialRecords(trialInd).response newValveState ...
            requestRewardDone requestRewardOpenCmdDone] ...
            = handleServerCommands(tm, rn, done, quit, requestRewardStarted, ...
            requestRewardStartLogged, requestRewardOpenCmdDone, ...
            requestRewardDone, station, ports, serverValveStates, doValves, ...
            trialRecords(trialInd).response);
    elseif isempty(rn) && strcmp(getRewardMethod(station),'serverPump')
        error('need a rnet for serverPump')
    end
    
    timestamps.serverCommDone=GetSecs;
    
    % =========================================================================
    
    if ~isempty(lastAirpuffTime) && airpuffOn
        elapsedTime = GetSecs() - lastAirpuffTime;
        msAirpuffOwed = msAirpuffOwed - elapsedTime*1000.0;
        phaseRecords(phaseNum).actualAirpuffDuration = phaseRecords(phaseNum).actualAirpuffDuration + elapsedTime*1000.0;
    end
    
    aStart = msAirpuffOwed > 0 && ~airpuffOn;
    aStop = msAirpuffOwed <= 0 && airpuffOn; % msAirpuffOwed<=0 also catches doPuff==false, and will stop airpuff when k+a is lifted
    if aStart || doPuff
        setPuff(station, true);
        airpuffOn = true;
    elseif aStop
        doPuff = false;
        airpuffOn = false;
        setPuff(station, false);
    end
    lastAirpuffTime = GetSecs();
    
    % =========================================================================
    
    if updatePhase
        phaseRecords(phaseNum).transitionedByPortResponse = transitionedByPortFlag;
        phaseRecords(phaseNum).transitionedByTimeout = transitionedByTimeFlag;
        phaseRecords(phaseNum).containedManualPokes = didManual;
        phaseRecords(phaseNum).leftWithManualPokingOn = manual;
        phaseRecords(phaseNum).containedAPause = didAPause;
        phaseRecords(phaseNum).containedForcedRewards = didValves;
        phaseRecords(phaseNum).didHumanResponse = didHumanResponse;
        phaseRecords(phaseNum).didStochasticResponse = didStochasticResponse;
        
        phaseRecords(phaseNum).responseDetails.totalFrames = frameNum;
%         allowKeyboard=false;
        % how do we only clear the textures from THIS phase (since all textures for all phases are precached....)
        % close all textures from this phase if in non-expert mode
        %         if ~strcmp(strategy,'expert')
        %             Screen('Close');
        %         else
        %             expertCleanUp(stimManager);
        %         end
    end
    
    timestamps.phaseRecordsDone=GetSecs;
    
    if ~paused
        stepsInPhase = stepsInPhase + 1; % moved from handlePhasedTrialLogic to prevent copy on write
        lastPorts=ports;

        phaseInd = newSpecInd;
        frameNum = frameNum + 1;
        framesSinceKbInput = framesSinceKbInput + 1;
    end
    
    timestamps.loopEnd=GetSecs;
end

trialRecords(trialInd).phaseRecords=phaseRecords;
% per-trial records, collected from per-phase stuff
trialRecords(trialInd).containedAPause=any([phaseRecords.containedAPause]);
trialRecords(trialInd).didHumanResponse=any([phaseRecords.didHumanResponse]);
trialRecords(trialInd).containedForcedRewards=any([phaseRecords.containedForcedRewards]);
trialRecords(trialInd).didStochasticResponse=any([phaseRecords.didStochasticResponse]);
trialRecords(trialInd).containedManualPokes=didManual;
trialRecords(trialInd).leftWithManualPokingOn=manual;

if doFramePulse
    % do 3 pulses b/c the analysis expects a 2-pulse signal followed by a single-pulse signal
    framePulse(station);
    framePulse(station);
    framePulse(station);
end

if ~isempty(analogOutput)
    evts=showdaqevents(analogOutput);
    if ~isempty(evts)
        evts
    end
    
    stop(analogOutput);
    delete(analogOutput); %should pass back to caller and preserve for next trial so intertrial works and can avoid contruction costs
end

Screen('Close'); %leaving off second argument closes all textures but leaves windows open
Priority(originalPriority);

end % end function
