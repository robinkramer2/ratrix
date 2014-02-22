function r = setProtocolGoToBlack(r,subjIDs)

if ~isa(r,'ratrix')
    error('need a ratrix')
end

if ~all(ismember(subjIDs,getSubjectIDs(r)))
    error('not all those subject IDs are in that ratrix')
end

sm=makeStandardSoundManager();

rewardSizeULorMS          =80;
requestRewardSizeULorMS   =0;
requestMode               ='first';
msPenalty                 =3500;       %consider changing this also in future
fractionOpenTimeSoundIsOn =1;
fractionPenaltySoundIsOn  =1;
scalar                    =1;
msAirpuff                 =msPenalty;


switch subjIDs{1}
<<<<<<< HEAD
   
<<<<<<< HEAD
<<<<<<< HEAD
    case 'bfly1.5att' 
=======
   case 'g62b.5lt'           
>>>>>>> c369f66013c9a93701349978e7267f76ffb2d0ac
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 150; 
       msPenalty               =3500;
=======
>>>>>>> d8bf1ba75d15b4065af4c76ac6f8605b2b9d5612

=======
    
        case 'g62b9tt'     %started 2/22/14  
       requestRewardSizeULorMS = 20;
       rewardSizeULorMS        = 160;
        msPenalty               =3500;
        case 'g62h2tt'     %started 2/22/14  
       requestRewardSizeULorMS = 20;
       rewardSizeULorMS        = 160;
        msPenalty               =3500;
        
        case 'g62h2lt'     %started 2/22/14  
       requestRewardSizeULorMS = 20;
       rewardSizeULorMS        = 160;
        msPenalty               =3500;
>>>>>>> 2c8276b925b0b61e2dc16f536662df9c49435805
       
       case 'g6w5rt'     %started 2/17/14  
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 160;
        msPenalty               =3500;
        
       case 'g62b8tt'     %started 2/17/14  
       requestRewardSizeULorMS = 0;
       rewardSizeULorMS        = 160;
        msPenalty               =3500;
        
%      case 'g54a11rt'   %retired 1/4/14
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 100;  
  
%      case 'g54bb2' % Switched from GTS 12/19/13
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 70;

       
%      case 'g625ln' % Switched from GTS 12/19/13
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 130;
%        msPenalty               =3500;
       
%      case 'g54b8tt' %retired 1/4/14
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 50;   


%       case 'g62b3rt'           %switched to HvV_center 1/4/14
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 85; 
       

%  case 'g62c.2rt'           %switched to HvV_center 1/30/14 
%        requestRewardSizeULorMS = 0;
%        rewardSizeULorMS        = 90; 
%        msPenalty               =3500;

       
            
    otherwise
        warning('unrecognized mouse, using defaults')
end;     



noRequest = constantReinforcement(rewardSizeULorMS,requestRewardSizeULorMS,requestMode,msPenalty,fractionOpenTimeSoundIsOn,fractionPenaltySoundIsOn,scalar,msAirpuff);

percentCorrectionTrials = .5;

maxWidth  = 1920;
maxHeight = 1080;

[w,h] = rat(maxWidth/maxHeight);
textureSize = 10*[w,h];
zoom = [maxWidth maxHeight]./textureSize;

svnRev = {'svn://132.239.158.177/projects/ratrix/trunk'};
svnCheckMode = 'session';

interTrialLuminance = .5;

stim.gain = 0.7 * ones(2,1);
stim.targetDistance = 455 * ones(1,2);
stim.timeoutSecs = 10;
stim.slow = [40; 80]; % 10 * ones(2,1);
stim.slowSecs = 1;
stim.positional = true;
stim.cue = true;
stim.soundClue = false;

pixPerCycs             = [300]; %*10^9;
targetOrientations     = [-1 1]*pi/4;
distractorOrientations = []; %-targetOrientations;
mean                   = .5;
radius                 = .085;
contrast               = 1;
thresh                 = .00005;
yPosPct                = .5;
stim.stim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,contrast,thresh,yPosPct,maxWidth,maxHeight,zoom,interTrialLuminance);
%stim.stim = orientedGabors(pixPerCycs,targetOrientations,distractorOrientations,mean,radius,[-1 1]  ,thresh,yPosPct,maxWidth,maxHeight,zoom,interTrialLuminance,'none', 'normalizeDiagonal');


stim.stim='flip';
%stim.stim=nan;
stim.dms.targetLatency = .5;
stim.dms.cueLatency = 0;
stim.dms.cueDuration = inf;
stim.dms = [];

 ballSM = setReinfAssocSecs(trail(stim,maxWidth,maxHeight,zoom,interTrialLuminance),1);
 %change stim to stay on for 1 sec after
 
ballTM = ball(percentCorrectionTrials,sm,noRequest);
ts1 = trainingStep(ballTM, ballSM, repeatIndefinitely(), noTimeOff(), svnRev, svnCheckMode); %ball

p=protocol('mouse',{ts1});

stepNum=uint8(1);
subj=getSubjectFromID(r,subjIDs{1});
[subj r]=setProtocolAndStep(subj,p,true,false,true,stepNum,r,'call to setProtocolMouse','edf');
end