clear all
close all

pathname = 'I:\compiled behavior\';
datapathname = 'G:\Behavior data 12-24-13+\';


n=1;
files(n).subj = 'g62b1lt';
files(n).expt = '052014';
files(n).topox =  '052014 g62b1lt\g62b1lt_run1_topox_fstop11_exp50msmaps.mat';
files(n).topoxdata = '052014 G62b.1LT Passive Viewing\g62b1lt_run1_topox_fstop11_exp50ms\g62b1lt_run1_topox_fstop11_exp50ms';
files(n).topoy = '052014 g62b1lt\g62b1lt_run2_topoy_fstop11_exp50msmaps.mat';
files(n).topoydata = '052014 G62b.1LT Passive Viewing\g62b1lt_run2_topoy_fstop11_exp50ms\g62b1lt_run2_topoy_fstop11_exp50ms';
files(n).behav = '052014 g62b1lt\62b.1lt_run1_hvv_vertical_behav data.mat';
files(n).behavdata = '052014 G62b.1LT HvV_vertical behavior\62b.1lt_run1_hvv_vertical_fstop11_exp50ms\62b.1lt_run1_hvv_vertical_fstop11_exp50ms';
files(n).grating = '052014 g62b1lt\g62b1lt_run4_widefieldgratings_fstop11_exp50msmaps.mat';
files(n).gratingdata = '052014 G62b.1LT Passive Viewing\g62b1lt_run4_widefieldgratings_fstop11_exp50ms\g62b1lt_run4_widefieldgratings_fstop11_exp50ms';
files(n).loom = '052014 g62b1lt\g62b1lt_run3_looming_fstop11_exp50msmaps.mat';
files(n).loomdata = '052014 G62b.1LT Passive Viewing\g62b1lt_run3_looming_fstop11_exp50ms\g62b1lt_run3_looming_fstop11_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';


n=n+1;
files(n).subj = 'g62b4ln';
files(n).expt = '051914';
files(n).topox =  '051914 g62b4ln\G62b4-LN_run1_topoX_50ms_exp_F_11maps.mat';
files(n).topoxdata = '051914 G62b4-LN passive viewing\G62b4-LN_run1_topoX_50ms_exp_F_11\G62b4-LN_run1_topoX_50ms_exp_F_11';
files(n).topoy = '051914 g62b4ln\G62b4-LN_run2_topoY_50ms_exp_F_11maps.mat';
files(n).topoydata = '051914 G62b4-LN passive viewing\G62b4-LN_run2_topoY_50ms_exp_F_11\G62b4-LN_run2_topoY_50ms_exp_F_11';
files(n).behav = '051914 g62b4ln\G62b4-ln_GTS_behaviobehav data.mat';
files(n).behavdata = '051914 G62b4-LN GTS behavior\G62b4-ln_GTS_behavior_50ms_Fstop_11\G62b4-ln_GTS_behavior_50ms_Fstop_11';
files(n).grating = '';
files(n).gratingdata = '';
files(n).loom = '';
files(n).loomdata = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

% n=n+1;
% files(n).subj = 'g62g4lt';
% files(n).expt = '051814';
% files(n).topox =  '';
% files(n).topoxdata = '';
% files(n).topoy = '';
% files(n).topoydata = '';
% files(n).behav = '051814 g62g4lt\g62g,4lt_run1_hvvcenter_behav data.mat';
% files(n).behavdata = '051814 g62g.4lt HvV Center behavior\g62g,4lt_run1_hvvcenter_fstop11_exp50ms\g62g,4lt_run1_hvvcenter_fstop11_exp50ms';
% files(n).grating = '';
% files(n).gratingdata = '';
% files(n).loom = '';
% files(n).loomdata = '';
% files(n).monitor = 'vert';
% files(n).task = 'HvV_center';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'poor behavior session no passive viewing';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '051714';
files(n).topox =  '051714 g62b8tt\g62B.8tt_run1_topox_fstop11_exp50msmaps.mat';
files(n).topoxdata = '051714 G62B.8TT Passive Viewing\g62B.8tt_run1_topox_fstop11_exp50ms\g62B.8tt_run1_topox_fstop11_exp50ms';
files(n).topoy = '051714 g62b8tt\g62B.8tt_run2_topoy_fstop11_exp50msmaps.mat';
files(n).topoydata = '051714 G62B.8TT Passive Viewing\g62B.8tt_run2_topoy_fstop11_exp50ms\g62B.8tt_run2_topoy_fstop11_exp50ms';
files(n).behav = '051714 g62b8tt\g62B.8TT_run1_hvv_center_behav data.mat';
files(n).behavdata = '051714 G62B.8TT HvV_center Behavior\g62B.8TT_run1_hvv_center_fstop11_exp50ms\g62B.8TT_run1_hvv_center_fstop11_exp50ms';
files(n).grating = '051714 g62b8tt\g62B.8tt_run4_widefieldgratings_fstop11_exp50msmaps.mat';
files(n).gratingdata = '051714 G62B.8TT Passive Viewing\g62B.8tt_run4_widefieldgratings_fstop11_exp50ms\g62B.8tt_run4_widefieldgratings_fstop11_exp50ms';
files(n).loom = '051714 g62b8tt\g62B.8tt_run3_looming_fstop11_exp50msmaps.mat';
files(n).loomdata = '051714 G62B.8TT Passive Viewing\g62B.8tt_run3_looming_fstop11_exp50ms\g62B.8tt_run3_looming_fstop11_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '051714';
files(n).topox =  '51714 g62b3rt\g62b,3rt_run1_topox_fstop11_exp50msmaps.mat';
files(n).topoxdata = '051714 G62B.3RT Passive Viewing\g62b,3rt_run1_topox_fstop11_exp50ms\g62b,3rt_run1_topox_fstop11_exp50ms';
files(n).topoy = '051714 g62b3rt\g62b,3rt_run2_topoy_fstop11_exp50msmaps.mat';
files(n).topoydata = '051714 G62B.3RT Passive Viewing\g62b,3rt_run2_topoy_fstop11_exp50ms\g62b,3rt_run2_topoy_fstop11_exp50ms';
files(n).behav = '051714 G62B.3RT HvV_vertical Behavior\g62b.3rt_run1_hvv_vertical_behav data.mat';
files(n).behavdata = '051714 G62B.3RT HvV_vertical Behavior\g62b.3rt_run1_hvv_vertical_fstop11_exp50ms';
files(n).grating = '';
files(n).gratingdata = '051714 G62B.3RT Passive Viewing\g62b,3rt_run4_widefieldgratings_fstop11_exp50ms\';
files(n).loom = '051714 g62b3rt\g62b,3rt_run3_looming_fstop11_exp50msmaps.mat';
files(n).loomdata = '051714 G62B.3RT Passive Viewing\g62b,3rt_run3_looming_fstop11_exp50ms\g62b,3rt_run3_looming_fstop11_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good behavior session'; %froze at end when attempted to quit?????????

n=n+1;
files(n).subj = 'g628lt';
files(n).expt = '051714';
files(n).topox =  '051714 g628lt\g62.8_run1_topox_fstop11_exp50msmaps.mat';
files(n).topoxdata = '051714 G62.8 Passive Viewing\g62.8_run1_topox_fstop11_exp50ms\g62.8_run1_topox_fstop11_exp50ms';
files(n).topoy = '051714 g628lt\g62.8_run2_topoy_fstop11_exp50msmaps.mat';
files(n).topoydata = '051714 G62.8 Passive Viewing\g62.8_run2_topoy_fstop11_exp50ms\g62.8_run2_topoy_fstop11_exp50ms';
files(n).behav = '051714 g628lt\g62.8_run2_gts_behav data.mat';
files(n).behavdata = '051714 G62.8 GTS Behavior\g62.8_run2_gts_fstop11_exp50ms\g62.8_run2_gts_fstop11_exp50ms';
files(n).grating = '051714 g628lt\g62.8_run4_widefieldgratings_fstop11_exp50msmaps.mat';
files(n).gratingdata = '051714 G62.8 Passive Viewing\g62.8_run4_widefieldgratings_fstop11_exp50ms\g62.8_run4_widefieldgratings_fstop11_exp50ms';
files(n).loom = '051714 g628lt\g62.8_run3_looming_fstop11_exp50msmaps.mat';
files(n).loomdata = '051714 G62.8 Passive Viewing\g62.8_run3_looming_fstop11_exp50ms\g62.8_run3_looming_fstop11_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

n=n+1;
files(n).subj = 'g62g4lt';
files(n).expt = '051614';
files(n).topox =  '051614 g62g4lt\g62g,4LT_run1_topox_fstop11_exp50msmaps.mat';
files(n).topoxdata = '051614 G62G.4LT Passive Viewing\g62g,4LT_run1_topox_fstop11_exp50ms\g62g,4LT_run1_topox_fstop11_exp50ms';
files(n).topoy = '051614 g62g4lt\g62g,4LT_run2_topoy_fstop11_exp50msmaps.mat';
files(n).topoydata = '051614 G62G.4LT Passive Viewing\g62g,4LT_run2_topoy_fstop11_exp50ms\g62g,4LT_run2_topoy_fstop11_exp50ms';
files(n).behav = '051614 g62g4lt\g62g,4lt_run1_hvv_center_behav data.mat';
files(n).behavdata = '051614 G62G.4LT HvV Behavior\g62g,4lt_run1_hvv_center_fstop11_exp50ms\g62g,4lt_run1_hvv_center_fstop11_exp50ms';
files(n).grating = '051614 g62g4lt\g62g,4LT_run4_widefieldgratings_fstop11_exp50msmaps.mat';
files(n).gratingdata = '051614 G62G.4LT Passive Viewing\g62g,4LT_run4_widefieldgratings_fstop11_exp50ms\g62g,4LT_run4_widefieldgratings_fstop11_exp50ms';
files(n).loom = '051614 g62g4lt\g62g,4LT_run3_looming_fstop11_exp50msmaps.mat';
files(n).loomdata = '051614 G62G.4LT Passive Viewing\g62g,4LT_run3_looming_fstop11_exp50ms\g62g,4LT_run3_looming_fstop11_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

n=n+1;
files(n).subj = 'g62c2rt';
files(n).expt = '051614';
files(n).topox =  '051614 g62c2rt\G62c2-rt_run3_topoX_landscape_50ms_F_8maps.mat';
files(n).topoxdata = '051614 G62c2-rt passive viewing\G62c2-rt_run3_topoX_landscape_50ms_F_8\G62c2-rt_run3_topoX_landscape_50ms_F_8';
files(n).topoy = '51614 g62c2rt\G62c2-rt_run4_topoY_landscape_50ms_F_8maps.mat';
files(n).topoydata = '051614 G62c2-rt passive viewing\G62c2-rt_run4_topoY_landscape_50ms_F_8\G62c2-rt_run4_topoY_landscape_50ms_F_8';
files(n).behav = '051614 g62c2rt\G62c-rt_run1_HvV_center_behavior_behav data.mat';
files(n).behavdata = '051614 G62c2-rt HvV_center Behavior\G62c-rt_run1_HvV_center_behavior_50msexp_Fstop_8\G62c-rt_run1_HvV_center_behavior_50msexp_Fstop_8';
files(n).grating = '';
files(n).gratingdata = '';
files(n).loom = '';
files(n).loomdata = '';
files(n).monitor = 'land';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

n=n+1;
files(n).subj = 'g62c2rt';
files(n).expt = '051614';
files(n).topox =  '051614 g62c2rt\G62c2-rt_run1_topox_50ms_F_8maps.mat';
files(n).topoxdata = '051614 G62c2-rt passive viewing\G62c2-rt_run1_topox_50ms_F_8\G62c2-rt_run1_topox_50ms_F_8';
files(n).topoy = '051614 g62c2rt\G62c2-rt_run2_topoY_50ms_F_8maps.mat';
files(n).topoydata = '051614 G62c2-rt passive viewing\G62c2-rt_run2_topoY_50ms_F_8\G62c2-rt_run2_topoY_50ms_F_8';
files(n).behav = '051614 g62c2rt\G62c-rt_run1_HvV_center_behavior_behav data.mat';
files(n).behavdata = '051614 G62c2-rt HvV_center Behavior\G62c-rt_run1_HvV_center_behavior_50msexp_Fstop_8\G62c-rt_run1_HvV_center_behavior_50msexp_Fstop_8';
files(n).grating = '';
files(n).gratingdata = '';
files(n).loom = '';
files(n).loomdata = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '051614';
files(n).topox =  '051614 g62b8tt\g62b.8tt_run7_topoxlandscape_fstop11_exp50msmaps.mat';
files(n).topoxdata = '051614 G62B.8TT Passive Viewing\g62b.8tt_run7_topoxlandscape_fstop11_exp50ms\g62b.8tt_run7_topoxlandscape_fstop11_exp50ms';
files(n).topoy = '051614 g62b8tt\g62b.8tt_run8_topoylandscape_fstop11_exp50msmaps.mat';
files(n).topoydata = '051614 G62B.8TT Passive Viewing\g62b.8tt_run8_topoylandscape_fstop11_exp50ms\g62b.8tt_run8_topoylandscape_fstop11_exp50ms';
files(n).behav = ''; %no analysis multi tiff
files(n).behavdata = '051614 G62b8-TT HvV_center Behavior\G62B8-TT_run1_HvV_center_behavior_50ms_F_11\G62B8-TT_run1_HvV_center_behavior_50ms_F_11';
files(n).grating = '';
files(n).gratingdata = '';
files(n).loom = '';
files(n).loomdata = '';
files(n).monitor = 'land';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'no behavorial analysis; multi tiff format';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '051614';
files(n).topox =  '051614 g62b8tt\g62b.8tt_run3_topox_fstop11_exp50msmaps.mat';
files(n).topoxdata = '051614 G62B.8TT Passive Viewing\g62b.8tt_run3_topox_fstop11_exp50ms\g62b.8tt_run3_topox_fstop11_exp50ms';
files(n).topoy = '051614 g62b8tt\g62b.8tt_run4_topoy_fstop11_exp50msmaps.mat';
files(n).topoydata = '051614 G62B.8TT Passive Viewing\g62b.8tt_run4_topoy_fstop11_exp50ms\g62b.8tt_run4_topoy_fstop11_exp50ms';
files(n).behav = ''; %no behavior in analysis multi tiff
files(n).behavdata = '051614 G62b8-TT HvV_center Behavior\G62B8-TT_run1_HvV_center_behavior_50ms_F_11\G62B8-TT_run1_HvV_center_behavior_50ms_F_11';
files(n).grating = '051614 g62b8tt\g62b.8tt_run6_widefieldgratings_fstop11_exp50msmaps.mat';
files(n).gratingdata = '051614 G62B.8TT Passive Viewing\g62b.8tt_run6_widefieldgratings_fstop11_exp50ms\g62b.8tt_run6_widefieldgratings_fstop11_exp50ms';
files(n).loom = '051614 g62b8tt\g62b.8tt_run5_looming_fstop11_exp50msmaps.mat';
files(n).loomdata = '051614 G62B.8TT Passive Viewing\g62b.8tt_run5_looming_fstop11_exp50ms\g62b.8tt_run5_looming_fstop11_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'no behavorial analysis: data in multi tiff format';

% n=n+1;
% files(n).subj = 'g6w1lt';
% files(n).expt = '051614';
% files(n).topox =  '';%bad dont bother putting in passive MAT files
% files(n).topoxdata = '051614 G6w1LT Passive Viewing\g6w1lt_run2_topox_fstop11_exp50ms\g6w1lt_run2_topox_fstop11_exp50ms';
% files(n).topoy = '';
% files(n).topoydata = '051614 G6w1LT Passive Viewing\g6w1lt_run3_topoy_fstop11_exp50ms\g6w1lt_run3_topoy_fstop11_exp50ms';
% files(n).behav = '051614 g6w1lt\g6w1lt_run1_gts_behav data.mat';
% files(n).behavdata = '051614 g6w1LT GTS behavior\g6w1lt_run1_gts_fstop11_exp50ms\g6w1lt_run1_gts_fstop11_exp50ms';
% files(n).grating = '';
% files(n).gratingdata = '051614 G6w1LT Passive Viewing\g6w1lt_run5_widefieldgratings_fstop11_exp50ms\g6w1lt_run5_widefieldgratings_fstop11_exp50ms';
% files(n).loom = '';
% files(n).loomdata = '051614 G6w1LT Passive Viewing\g6w1lt_run4_looming_fstop11_exp50ms\g6w1lt_run4_looming_fstop11_exp50ms';
% files(n).monitor = 'vert';
% files(n).task = 'GTS';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'lightblock cone tipped during passive viewing';

n=n+1;
files(n).subj = 'g628lt';
files(n).expt = '051514';
files(n).topox =  '051514 g628lt\g62b.5lt_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoxdata = '051514 G628 LT Passive Viewing\g62.8lt_run1_topox_fstop5.6_exp50ms_misnamedfilesasG62B.5lt\g62b.5lt_run1_topox_fstop5.6_exp50ms';
files(n).topoy = '051514 g628lt\g62b.5lt_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).topoydata = '051514 G628 LT Passive Viewing\g62.8lt_run2_topoy_fstop5.6_exp50ms_misnamedfilesasG62B.5lt\g62b.5lt_run2_topoy_fstop5.6_exp50ms';
files(n).behav = '051514 g628lt\g628lt_run1_gts_fbehav data.mat';
files(n).behavdata = '051515 G628-LT GTS behavior\g628lt_run1_gts_fstop5.6_exp50ms\g628lt_run1_gts_fstop5.6_exp50ms';
files(n).grating = '051514 g628lt\g62b.5lt_run4_widefieldgratings_fstop5.6_exp50msmaps.mat';
files(n).gratingdata = '051514 G628 LT Passive Viewing\g62.8lt_run4_widefieldgratings_fstop5.6_exp50ms_misnamedfilesasG62B.5lt\g62b.5lt_run4_widefieldgratings_fstop5.6_exp50ms';
files(n).loom = '051514 g628lt\g62b.5lt_run3_looming_fstop5.6_exp50msmaps.mat';
files(n).loomdata = '051514 G628 LT Passive Viewing\g62.8lt_run3_looming_fstop5.6_exp50ms_misnamedfilesasG62B.5lt\g62b.5lt_run3_looming_fstop5.6_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session'; %mislabled files as g62b.5 good run though


n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '051514';
files(n).topox =  '051514 g62b3rt\g62b.3rt_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoxdata = '051514 G62b.3RT Passive Viewing\g62b.3rt_run1_topox_fstop5.6_exp50ms\g62b.3rt_run1_topox_fstop5.6_exp50ms';
files(n).topoy = '051514 g62b3rt\g62b.3rt_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).topoydata = '051514 G62b.3RT Passive Viewing\g62b.3rt_run2_topoy_fstop5.6_exp50ms\g62b.3rt_run2_topoy_fstop5.6_exp50ms';
files(n).behav = '051514 g62b3rt\g62b.3rt_run1_HvV_vertical_fbehav data.mat';
files(n).behavdata = '051514 G62b.3 RT HvV Behavior\g62b.3rt_run1_HvV_vertical_fstop5.6_exp50ms\g62b.3rt_run1_HvV_vertical_fstop5.6_exp50ms';
files(n).grating = '051514 g62b3rt\g62b.3rt_run4_widefieldgratings_fstop5.6_exp50msmaps.mat';
files(n).gratingdata = '051514 G62b.3RT Passive Viewing\g62b.3rt_run4_widefieldgratings_fstop5.6_exp50ms\g62b.3rt_run4_widefieldgratings_fstop5.6_exp50ms';
files(n).loom = '051514 g62b3rt\g62b.3rt_run3_looming_fstop5.6_exp50msmaps.mat';
files(n).loomdata = '051514 G62b.3RT Passive Viewing\g62b.3rt_run3_looming_fstop5.6_exp50ms\g62b.3rt_run3_looming_fstop5.6_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

n=n+1;
files(n).subj = 'g62h1tt';
files(n).expt = '051414';
files(n).topox =  '051414 g62h1tt\g62h.1tt_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoxdata = '051414 G62H.1 TT Passive Viewing\g62h.1tt_run1_topox_fstop5.6_exp50ms\g62h.1tt_run1_topox_fstop5.6_exp50ms';
files(n).topoy = '051414 g62h1tt\g62h.1tt_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).topoydata = '051414 G62H.1 TT Passive Viewing\g62h.1tt_run2_topoy_fstop5.6_exp50ms\g62h.1tt_run2_topoy_fstop5.6_exp50ms';
files(n).behav = '';%combineTiff couldnt analyze behavior ??
files(n).behavdata = '051414 G62H.1TT HvV_center Behavior\g62h.1tt_run1_HvV_center_fstop5.6_exp50ms\g62h.1tt_run1_HvV_center_fstop5.6_exp50ms';
files(n).grating = '';
files(n).gratingdata = '';
files(n).loom = '051414 g62h1tt\g62h.1tt_run3_looming_fstop5.6_exp50msmaps.mat';
files(n).loomdata = '051414 G62H.1 TT Passive Viewing\g62h.1tt_run3_looming_fstop5.6_exp50ms\g62h.1tt_run3_looming_fstop5.6_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session; combineTiff couldnt analyze behavior';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '051414';
files(n).topox =  '051414 g62b7lt\g62b.7lt_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoxdata = '051414 G62B.7LT Passive Viewing\g62b.7lt_run1_topox_fstop5.6_exp50ms\g62b.7lt_run1_topox_fstop5.6_exp50ms';
files(n).topoy = '051414 g62b7lt\g62b.7lt_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).topoydata = '051414 G62B.7LT Passive Viewing\g62b.7lt_run2_topoy_fstop5.6_exp50ms\g62b.7lt_run2_topoy_fstop5.6_exp50ms';
files(n).behav = '051414 g62b7lt\g62b.7lt_run1_hvV_centerbehav data.mat';
files(n).behavdata = '051414 g62B.7LT HvV_center Behavior\g62b.7lt_run1_hvV_center_fstop5.6_exp50\g62b.7lt_run1_hvV_center_fstop5.6_exp50';
files(n).grating = '051414 g62b7l\g62b.7lt_run4_widefieldgratings_fstop5.6_exp50msmaps.mat';
files(n).gratingdata = '051414 G62B.7LT Passive Viewing\g62b.7lt_run4_widefieldgratings_fstop5.6_exp50ms\g62b.7lt_run4_widefieldgratings_fstop5.6_exp50ms';
files(n).loom = '051414 g62b7lt\g62b.7lt_run3_looming_fstop5.6_exp50msmaps.mat';
files(n).loomdata = '051414 G62B.7LT Passive Viewing\g62b.7lt_run3_looming_fstop5.6_exp50ms\g62b.7lt_run3_looming_fstop5.6_exp50ms';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';

% n=n+1;
% files(n).subj = 'g6w1lt';
% files(n).expt = '050814';
% files(n).topox =  '050814 g6w1lt\g6w1lt_run1_topox_fstop5.6_exp50ms_maps.mat';
% files(n).topoxdata = '050814 G6w1LT Passive Viewing\g6w1lt_run1_topox_fstop5.6_exp50ms\g6w1lt_run1_topox_fstop5.6_exp50ms';
% files(n).topoy = '050814 g6w1lt/g6w1lt_run1_topoy_fstop5.6_exp50ms_maps.mat';
% files(n).topoydata = '050814 G6w1LT Passive Viewing\g6w1lt_run2_topoy_fstop5.6_exp50ms\g6w1lt_run1_topox_fstop5.6_exp50ms';
% files(n).behav = '';
% files(n).behavdata = '050814 G6W1 LT GTS Behavior\g6W1LT_run1_GTS_fstop5.6_exp50ms\g6W1LT_run1_GTS_fstop5.6_exp50ms';
% files(n).grating = '';
% files(n).gratingdata = '';
% files(n).loom = '050814 g6w1lt\g6w1lt_run3_looming_fstop5.6_exp50ms_maps.mat';
% files(n).loomdata = '050814 G6w1LT Passive Viewing\g6w1lt_run3_looming_fstop5.6_exp50ms\g6w1lt_run3_looming_fstop5.6_exp50ms';
% files(n).monitor = 'vert';
% files(n).task = 'GTS';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'movement artifact - BAD';

% n=n+1;
% files(n).subj = 'G62b5lt';
% files(n).expt = '050814';
% files(n).topox =  '';
% files(n).topoxdata = '';
% files(n).topoy = '';
% files(n).topoydata = '';
% files(n).behav = '';
% files(n).behavdata = '050814 G62B.5 LT GTS Behavior\g62B.5LT_run1_gts_fstop5.6_exp50ms\g62B.5LT_run1_gts_fstop5.6_exp50ms';
% files(n).grating = '';
% files(n).gratingdata = '';
% files(n).loom = '';
% files(n).loomdata = '';
% files(n).monitor = 'vert';
% files(n).task = 'GTS';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'no passive viewing, poor behavior run';

% n=n+1;
% files(n).subj = 'g62c2rt';
% files(n).expt = '050814';
% files(n).topox =  '050814 g62c2rt\g62c.2rt_run1_topox_fstop5.6_exp50msmaps.mat';
% files(n).topoxdata = '050814 G62C.2RT Passive Viewing\g62c.2rt_run1_topox_fstop5.6_exp50ms\g62c.2rt_run1_topox_fstop5.6_exp50ms';
% files(n).topoy = '050814 g62c2rt\g62c.2rt_run2_topoy_fstop5.6_exp50msmaps.mat';
% files(n).topoydata = '050814 G62C.2RT Passive Viewing\g62c.2rt_run2_topoy_fstop5.6_exp50ms\g62c.2rt_run2_topoy_fstop5.6_exp50ms';
% files(n).behav = '';
% files(n).behavdata = '';
% files(n).grating = '050814 g62c2rt\g62c.2rt_run4_widefieldgratings_fstop5.6_exp50ms_maps.mat';
% files(n).gratingdata = '050814 G62C.2RT Passive Viewing\g62c.2rt_run4_widefieldgratings_fstop5.6_exp50ms\g62c.2rt_run4_widefieldgratings_fstop5.6_exp50ms';
% files(n).loom = 'g62c.2rt_run3_looming_fstop5.6_exp50ms_maps.mat';
% files(n).loomdata = '050814 G62C.2RT Passive Viewing\g62c.2rt_run3_looming_fstop5.6_exp50ms';
% files(n).monitor = 'vert';
% files(n).task = 'HvV_center';
% files(n).label = 'camk2 gc6';
% files(n).notes = 'bad behavior session - green led LEFT ON'; %readTiff behavior analysis failed


n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '050814';
files(n).topox =  '050814 g62b3rt\G62b3-rt_run1_topoX_50ms_Fstop_8_maps.mat';
files(n).topoy = '050814 g62b3rt\G62b3-rt_run2_topoY_50ms_Fstop_8_maps.mat';
files(n).behav = '050814 g62b3rt\G62B3-RT_run1_HvV_behavibehav data.mat';
files(n).grating = '050814 g62b3rt\G62b3-rt_run4_widefieldgratings_50ms_Fstop_8_maps.mat';
files(n).loom = '050814 g62b3rt\G62b3-rt_run3_looming_50ms_Fstop_8_maps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050814 G62b3-RT passive veiwing\G62b3-rt_run1_topoX_50ms_Fstop_8\G62b3-rt_run1_topoX_50ms_Fstop_8';
files(n).topoydata = '050814 G62b3-RT passive veiwing\G62b3-rt_run2_topoY_50ms_Fstop_8\G62b3-rt_run2_topoY_50ms_Fstop_8';
files(n).behavdata = '050814 G62b3-rt HvV behavior\G62B3-RT_run1_HvV_behavior_50ms_Fstop_8\G62B3-RT_run1_HvV_behavior_50ms_Fstop_8';
files(n).gratingdata = '050814 G62b3-RT passive veiwing\G62b3-rt_run4_widefieldgratings_50ms_Fstop_8\G62b3-rt_run4_widefieldgratings_50ms_Fstop_8';
files(n).loomdata = '050814 G62b3-RT passive veiwing\G62b3-rt_run3_looming_50ms_Fstop_8\G62b3-rt_run3_looming_50ms_Fstop_8';

n=n+1;
files(n).subj = 'g62b1lt';
files(n).expt = '050814';
files(n).topox =  '050814 g62b1lt\G62B1-LT_run1_topoX_50ms_Fstop5_6_maps.mat';
files(n).topoy = '050814 g62b1lt\G62B1-LT_run2_topoY_50ms_Fstop5_6_maps.mat';
files(n).behav = '050814 g62b1lt\G62B1-LT_run1_HvV_behaviobehav data.mat';
files(n).grating = '050814 g62b1lt\G62B1-LT_run4_widefield_gratings_50ms_Fstop5_g_maps.mat';
files(n).loom = '050814 g62b1lt\G62B1-LT_run3_looming_50ms_Fstop5_g_maps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050814 G62B1-LT passive viewing\G62B1-LT_run1_topoX_50ms_Fstop5_g\G62B1-LT_run1_topoX_50ms_Fstop5_6';
files(n).topoydata = '050814 G62B1-LT passive viewing\G62B1-LT_run2_topoY_50ms_Fstop5_g\G62B1-LT_run2_topoY_50ms_Fstop5_6';
files(n).gratingdata = '050814 G62B1-LT passive viewing\G62B1-LT_run4_widefield_gratings_50ms_Fstop5_g\G62B1-LT_run4_widefield_gratings_50ms_Fstop5_g';
files(n).loomdata = '050814 G62B1-LT passive viewing\G62B1-LT_run3_looming_50ms_Fstop5_g\G62B1-LT_run3_looming_50ms_Fstop5_g';
files(n).behavdata = '050814 G62B1-LT HvV Behavior\G62B1-LT_run1_HvV_behavior_50ms_Fstop5_6\G62B1-LT_run1_HvV_behavior_50ms_Fstop5_6';

n=n+1;
files(n).subj = 'g62h1tt';
files(n).expt = '050614';
files(n).topox =  '050614 g62h1tt\g62h.1tt_run1_topox_fstop5.6_exp50ms_maps.mat';
files(n).topoy = '050614 g62h1tt\g62h.1tt_run2_topoy_fstop5.6_exp50ms_maps.mat';
files(n).behav = '050614 g62h1tt\g62h.1tt_run1_HvV_center_fbehav data.mat'; 
files(n).grating = '050614 g62h1tt\g62h.1tt_run4_widefieldgratings_fstop5.6_exp50ms_maps.mat';
files(n).loom = '050614 g62h1tt\g62h.1tt_run3_looming_fstop5.6_exp50ms_maps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050614 G62h.1TT Passive Viewing\g62h.1tt_run1_topox_fstop5.6_exp50ms\g62h.1tt_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '050614 G62h.1TT Passive Viewing\g62h.1tt_run2_topoy_fstop5.6_exp50ms\g62h.1tt_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '050614 G62h.1TT Passive Viewing\g62h.1tt_run4_widefieldgratings_fstop5.6_exp50ms\g62h.1tt_run4_widefieldgratings_fstop5.6_exp50ms';
files(n).loomdata = '050614 G62h.1TT Passive Viewing\g62h.1tt_run3_looming_fstop5.6_exp50ms\g62h.1tt_run3_looming_fstop5.6_exp50ms';
files(n).behavdata = '050614 G62H.1TT HvV Center Behavior\g62h.1tt_run1_HvV_center_fstop5.6_exp50ms\g62h.1tt_run1_HvV_center_fstop5.6_exp50ms';


n=n+1;
files(n).subj = 'g62b1lt';
files(n).expt = '050614';
files(n).topox =  '050614 g62b1lt\g62b.1LT_run1_topox_fstop5.6_exp50ms_maps.mat';
files(n).topoy = '050614 g62b1lt\g62b.1LT_run2_topoy_fstop5.6_exp50ms_maps.mat';
files(n).behav = '050614 g62b1lt\G62B.1LT_run1_HvV_Vertical_fbehav data.mat';
files(n).grating = '050614 g62b1lt\g62b.1LT_run4_widefieldgratings_fstop5.6_exp50ms_maps.mat';
files(n).loom = '050614 g62b1lt\g62b.1LT_run3_looming_fstop5.6_exp50ms_maps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050614 G62B.1 LT Passive Viewing\g62b.1LT_run1_topox_fstop5.6_exp50ms\g62b.1LT_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '050614 G62B.1 LT Passive Viewing\g62b.1LT_run2_topoy_fstop5.6_exp50ms\g62b.1LT_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '050614 G62B.1 LT Passive Viewing\g62b.1LT_run4_widefieldgratings_fstop5.6_exp50ms\g62b.1LT_run4_widefieldgratings_fstop5.6_exp50ms';
files(n).loomdata = '050614 G62B.1 LT Passive Viewing\g62b.1LT_run3_looming_fstop5.6_exp50ms\g62b.1LT_run3_looming_fstop5.6_exp50ms';
files(n).behavdata = '050614 G62B.1 LT HvV_Vertical Behavior\G62B.1LT_run1_HvV_Vertical_fstop5.6_exp50ms\G62B.1LT_run1_HvV_Vertical_fstop5.6_exp50ms';


n=n+1;
files(n).subj = 'g62c2rt';
files(n).expt = '050414';
files(n).topox =  '050414 g62c2rt\G62C2-RT_run1_topoX_50ms_F_8maps.mat';
files(n).topoy = '050414 g62c2rt\G62C2-RT_run2_topoY_50ms_F_8maps.mat';
files(n).behav = '050414 g62c2rt\G62C2-RT_run2_HvV_center_behavior_5behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session'; % light block hat tiped towards end of session (after ~frame14200)
files(n).topoxdata = '050414 G62C2-RT passive viewing\G62C2-RT_run1_topoX_50ms_F_8\G62C2-RT_run1_topoX_50ms_F_8';
files(n).topoydata = '050414 G62C2-RT passive viewing\G62C2-RT_run2_topoY_50ms_F_8\G62C2-RT_run2_topoY_50ms_F_8';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '050414 G62C2_RT HvV_center Behavior\G62C2-RT_run2_HvV_center_behavior_50ms_exp_fstop_8\G62C2-RT_run2_HvV_center_behavior_50ms_exp_fstop_8';

n=n+1;
files(n).subj = 'g62g4lt';
files(n).expt = '050414';
files(n).topox =  '050414 g62g4lt\g62g.4lt_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoy = '050414 g62g4lt\g62g.4lt_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).behav = '050414 g62g4lt\g62g.4ln_run1_HvV_center_fbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050414 G62g.4LT Passive Viewing\g62g.4lt_run1_topox_fstop5.6_exp50ms\g62g.4lt_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '050414 G62g.4LT Passive Viewing\g62g.4lt_run2_topoy_fstop5.6_exp50ms\g62g.4lt_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '050414 G62G.4 LT HvV_center behavior\g62g.4ln_run1_HvV_center_fstop5.6_exp50ms\g62g.4ln_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g6w1lt';
files(n).expt = '050414';
files(n).topox =  '050414 g6w1lt\G6W1-LT_run1_topoX_50ms_F5_6maps.mat';
files(n).topoy = '050414 g6w1lt\G6W1-LT_run2_topoY_50ms_F5_6maps.mat';
files(n).behav = '050414 g6w1lt\G6W1-LT_run1_GTS_behavior_5behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'wfs1 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050414 G6W1-LT passive viewing\G6W1-LT_run1_topoX_50ms_F5_6\G6W1-LT_run1_topoX_50ms_F5_6';
files(n).topoydata = '050414 G6W1-LT passive viewing\G6W1-LT_run2_topoY_50ms_F5_6\G6W1-LT_run2_topoY_50ms_F5_6';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '050414 G6W1-LT GTS behavior\G6W1-LT_run1_GTS_behavior_50msexp_fstop5_6\G6W1-LT_run1_GTS_behavior_50msexp_fstop5_6';

n=n+1;
files(n).subj = 'g62b5lt';
files(n).expt = '050314';
files(n).topox =  '050314 g62b5lt\G62b5-lt_run1_topoX_50ms_f-8maps.mat';
files(n).topoy = '050314 g62b5lt\G62b5-lt_run2_topoY_50ms_f-8maps.mat';
files(n).behav = '050314 g62b5lt\G62B5-LT_run1_GTS_behavior_behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050314 G62b5-lt passive viewing\G62b5-lt_run1_topoX_50ms_f-8\G62b5-lt_run1_topoX_50ms_f-8';
files(n).topoydata = '050314 G62b5-lt passive viewing\G62b5-lt_run2_topoY_50ms_f-8\G62b5-lt_run2_topoY_50ms_f-8';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '050314 G62B5-LT GTS behavior\G62B5-LT_run1_GTS_behavior_50msexp_Fstop-8\G62B5-LT_run1_GTS_behavior_50msexp_Fstop-8';

n=n+1;
files(n).subj = 'g62b4ln';
files(n).expt = '050314';
files(n).topox =  '050314 g62b4ln\G62B4-LN_run1_topoX_50ms_F_8maps.mat';
files(n).topoy = '050314 g62b4ln\G62B4-LN_run2_topoY_50ms_F_8maps.mat';
files(n).behav = '050314 g62b4ln\G62B4-LN_run1_GTS_behavior_5behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050314 G62b4-LN passive viewing\G62B4-LN_run1_topoX_50ms_F_8\G62B4-LN_run1_topoX_50ms_F_8';
files(n).topoydata = '050314 G62b4-LN passive viewing\G62B4-LN_run2_topoY_50ms_F_8\G62B4-LN_run2_topoY_50ms_F_8';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '050314 G62b4-LN_ GTS behavior\G62B4-LN_run1_GTS_behavior_50ms_exp_fstop_8\G62B4-LN_run1_GTS_behavior_50ms_exp_fstop_8';

n=n+1;
files(n).subj = 'g62b1lt';
files(n).expt = '050214';
files(n).topox =  '050214 g62b1lt\g62B.1LT_run1_topox_fstpo5.6_exp50msmaps.mat';
files(n).topoy = '050214 g62b1lt\g62b.1lt_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).behav = '050214 g62b1lt\g62b.1lt_run1_HvV_vertical_fbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '050214 G62B.1 LT Passive Viewing\g62B.1LT_run1_topox_fstpo5.6_exp50ms\g62B.1LT_run1_topox_fstpo5.6_exp50ms';
files(n).topoydata = '050214 G62B.1 LT Passive Viewing\g62b.1lt_run2_topoy_fstop5.6_exp50ms\g62b.1lt_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '050214 G62b.1 LT HvV_vertical behavior\g62b.1lt_run1_HvV_vertical_fstop5.6_exp50ms\g62b.7lt_run1_HvV_vertical_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '042914';
files(n).topox =  '042914 g62b7lt\g62b.7lt_run1_topox_vert_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042914 g62b7lt\g62b.7lt_run2_topoy_vert_fstop5.6_exp50msmaps.mat';
files(n).behav = '042914 g62b7lt\g62b.7lt_run1_hvv_center_fbehav data.mat';
files(n).grating = '042914 g62b7lt\g62b.7lt_run4_widefieldgratings_vert_fstop5.6_exp50msmaps.mat';
files(n).loom = '042914 g62b7lt\g62b.7lt_run3_looming_vert_fstop5.6_exp50msmaps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042914 G62B.7 LT Passive Viewing\g62b.7lt_run1_topox_vert_fstop5.6_exp50ms\g62b.7lt_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '042914 G62B.7 LT Passive Viewing\g62b.7lt_run2_topoy_vert_fstop5.6_exp50ms\g62b.7lt_run2_topoy_vert_fstop5.6_exp50ms';
files(n).gratingdata = '042914 G62B.7 LT Passive Viewing\g62b.7lt_run4_widefieldgratings_vert_fstop5.6_exp50ms\g62b.7lt_run4_widefieldgratings_vert_fstop5.6_exp50ms';
files(n).loomdata = '042914 G62B.7 LT Passive Viewing\g62b.7lt_run3_looming_vert_fstop5.6_exp50ms\g62b.7lt_run3_looming_vert_fstop5.6_exp50ms';
files(n).behavdata = '042914 G62B.7 LT Behavior HvV Center\g62b.7lt_run1_hvv_center_fstop5.6_exp50ms\g62b.7lt_run1_hvv_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '042914';
files(n).topox =  '042914 g62b7lt\g62b.7lt_run5_topox_horiz_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042914 g62b7lt\g62b.7lt_run6_topoy_horiz_fstop5.6_exp50msmaps.mat';
files(n).behav = '042914 g62b7lt\g62b.7lt_run1_hvv_center_fbehav data.mat';
files(n).grating = '042914 g62b7lt\g62b.7lt_run7_widefieldgratings_horiz_fstop5.6_exp50msmaps.mat';
files(n).loom = '';
files(n).monitor = 'land';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042914 G62B.7 LT Passive Viewing\g62b.7lt_run5_topox_horiz_fstop5.6_exp50ms\g62b.7lt_run5_topox_horiz_fstop5.6_exp50ms';
files(n).topoydata = '042914 G62B.7 LT Passive Viewing\g62b.7lt_run6_topoy_horiz_fstop5.6_exp50ms\g62b.7lt_run6_topoy_horiz_fstop5.6_exp50ms';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '042914 G62B.7 LT Behavior HvV Center\g62b.7lt_run1_hvv_center_fstop5.6_exp50ms\g62b.7lt_run1_hvv_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62h1tt';
files(n).expt = '042414';
files(n).topox =  '042414 g62h1tt\G62H1TT_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042414 g62h1tt\G62H1TT_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).behav = '042414 g62h1tt\G62h.1tt_run1_HvV_center_fbehav data.mat';
files(n).grating = '042414 g62h1tt\G62H1TT_run3_gratingsSFTF_fstop5.6_exp50msmaps.mat';
files(n).loom = '042414 g62h1tt\G62H1TT_run4_looming_fstop5.6_exp50msmaps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042414 G62H.1TT Passive Viewing\G62H1TT_run1_topox_fstop5.6_exp50ms\G62H1TT_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '042414 G62H.1TT Passive Viewing\G62H1TT_run2_topoy_fstop5.6_exp50ms\G62H1TT_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '042414 G62H.1TT Passive Viewing\G62H1TT_run3_gratingsSFTF_fstop5.6_exp50ms\G62H1TT_run3_gratingsSFTF_fstop5.6_exp50ms';
files(n).loomdata = '042414 G62H.1TT Passive Viewing\G62H1TT_run4_looming_fstop5.6_exp50ms\G62H1TT_run4_looming_fstop5.6_exp50ms';
files(n).behavdata = '042414 g62h.1tt HvV_center behavior\G62h.1tt_run1_HvV_center_fstop5.6_exp50ms\G62h.1tt_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62h1tt';
files(n).expt = '042414';
files(n).topox =  '042414 g62h1tt\G62H1TT_run5_topox_landscape_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042414 g62h1tt\G62H1TT_run6_topoy_landscape_fstop5.6_exp50msmaps.mat';
files(n).behav = '042414 g62h1tt\G62h.1tt_run1_HvV_center_fbehav data.mat';
files(n).grating = '042414 g62h1tt\G62H1TT_run7_gratingsSFTF_landscape_fstop5.6_exp50msmaps.mat';
files(n).loom = '042414 g62h1tt\G62H1TT_run8_looming_landscape_fstop5.6_exp50msmaps.mat';
files(n).monitor = 'land';
files(n).task = '';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042414 G62H.1TT Passive Viewing\G62H1TT_run5_topox_landscape_fstop5.6_exp50ms\G62H1TT_run5_topox_landscape_fstop5.6_exp50ms';
files(n).topoydata = '042414 G62H.1TT Passive Viewing\G62H1TT_run6_topoy_landscape_fstop5.6_exp50ms\G62H1TT_run6_topoy_landscape_fstop5.6_exp50ms';
files(n).gratingdata = '042414 G62H.1TT Passive Viewing\G62H1TT_run7_gratingsSFTF_landscape_fstop5.6_exp50ms\G62H1TT_run7_gratingsSFTF_landscape_fstop5.6_exp50ms';
files(n).loomdata = '042414 G62H.1TT Passive Viewing\G62H1TT_run8_looming_landscape_fstop5.6_exp50ms\G62H1TT_run8_looming_landscape_fstop5.6_exp50ms';
files(n).behavdata = '042414 g62h.1tt HvV_center behavior\G62h.1tt_run1_HvV_center_fstop5.6_exp50ms\G62h.1tt_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '042414';
files(n).topox =  '042414 g62b8tt\G62b.8TT_run1_topox_fstop5.6_exp50msmaps.mat'; %green led off for topox (works ok still)
files(n).topoy = '042414 g62b8tt\G62b.8TT_run2_topoy_fstop5.6_exp50msmaps.mat'; %shadow in green channel for topoy
files(n).behav = '042414 g62b8tt\g62B.8TT_run1_HvV_center_fbehav data.mat';%shadow in green channel for looming
files(n).grating = '042414 g62b8tt\G62b.8TT_run4_widefieldfgratings_fstop5.6_exp50msmaps.mat';
files(n).loom = '042414 g62b8tt\G62b.8TT_run3_looming_fstop5.6_exp50msmaps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session; '; % light block hat tiped towards end of session (after ~frame1300)
files(n).topoxdata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run1_topox_fstop5.6_exp50ms\G62b.8TT_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run2_topoy_fstop5.6_exp50ms\G62b.8TT_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run4_widefieldfgratings_fstop5.6_exp50ms\G62b.8TT_run4_widefieldfgratings_fstop5.6_exp50ms';
files(n).loomdata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run3_looming_fstop5.6_exp50ms\G62b.8TT_run3_looming_fstop5.6_exp50ms';
files(n).behavdata = '042414 G62b.8TT HvV_center Behavior\g62B.8TT_run1_HvV_center_fstop5.6_exp50ms_lightblockconetipperatendoftrial\g62B.8TT_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '042414';
files(n).topox =  '042414 g62b8tt\G62b.8TT_run5_topox_horizontal_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042414 g62b8tt\G62b.8TT_run6_topoy_horizontal_fstop5.6_exp50msmaps.mat';
files(n).behav = '042414 g62b8tt\g62B.8TT_run1_HvV_center_fbehav data.mat';
files(n).grating = '';
files(n).loom = '042414 g62b8tt\G62b.8TT_run7_looming_horizontal_fstop5.6_exp50msmaps.mat';
files(n).monitor = 'land';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session'; % light block hat tiped towards end of session (after ~frame1300)
files(n).topoxdata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run5_topox_horizontal_fstop5.6_exp50ms\G62b.8TT_run5_topox_horizontal_fstop5.6_exp50ms';
files(n).topoydata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run6_topoy_horizontal_fstop5.6_exp50ms\G62b.8TT_run6_topoy_horizontal_fstop5.6_exp50ms';
files(n).gratingdata = '';
files(n).loomdata = '042414 G62B.8TT Passive Viewing\G62b.8TT_run7_looming_horizontal_fstop5.6_exp50ms\G62b.8TT_run7_looming_horizontal_fstop5.6_exp50ms';
files(n).behavdata = '042414 G62b.8TT HvV_center Behavior\g62B.8TT_run1_HvV_center_fstop5.6_exp50ms_lightblockconetipperatendoftrial\g62B.8TT_run1_HvV_center_fstop5.6_exp50ms';


n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '042414';
files(n).topox =  '042414 g62b7lt\G62B.7LT_run1_topox_vertical_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042414 g62b7lt\G62B.7LT_run2_topoy_vertical_fstop5.6_exp50msmaps.mat';
files(n).behav = '042414 g62b7lt\G62B.7LT_run1_HvV_center_fbehav data.mat';
files(n).grating = '042414 g62b7lt\G62B.7LT_run3_widefieldgratings_vertical_fstop5.6_exp50msmaps.mat';
files(n).loom = '042414 g62b7lt\G62B.7LT_run4_looming__vertical_fstop5.6_exp50maps.mat';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run1_topox_vertical_fstop5.6_exp50ms\G62B.7LT_run1_topox_vertical_fstop5.6_exp50ms';
files(n).topoydata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run2_topoy_vertical_fstop5.6_exp50ms\G62B.7LT_run2_topoy_vertical_fstop5.6_exp50ms';
files(n).gratingdata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run3_widefieldgratings_vertical_fstop5.6_exp50ms\G62B.7LT_run3_widefieldgratings_vertical_fstop5.6_exp50ms';
files(n).loomdata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run4_looming__vertical_fstop5.6_exp50\G62B.7LT_run4_looming__vertical_fstop5.6_exp50';
files(n).behavdata = '042414 G62B.7LT HvV_center Behavior\G62B.7LT_run1_HvV_center_fstop5.6_exp50ms\G62B.7LT_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '042414';
files(n).topox =  '042414 g62b7lt\G62B.7LT_run6_topox_horizontal_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042414 g62b7lt\G62B.7LT_run7_topoy_horizontal_fstop5.6_exp50msmaps.mat';
files(n).behav = '042414 g62b7lt\G62B.7LT_run1_HvV_center_fbehav data.mat';
files(n).grating = '';
files(n).loom = '042414 g62b7lt\G62B.7LT_run5_looming_horizontal_fstop5.6_exp50msmaps.mat';
files(n).monitor = 'land';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run6_topox_horizontal_fstop5.6_exp50ms\G62B.7LT_run6_topox_horizontal_fstop5.6_exp50ms';
files(n).topoydata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run7_topoy_horizontal_fstop5.6_exp50ms\G62B.7LT_run7_topoy_horizontal_fstop5.6_exp50ms';
files(n).gratingdata = '';
files(n).loomdata = '042414 G62B.7LT Passive Viewing\G62B.7LT_run5_looming_horizontal_fstop5.6_exp50ms\G62B.7LT_run5_looming_horizontal_fstop5.6_exp50ms';
files(n).behavdata = '042414 G62B.7LT HvV_center Behavior\G62B.7LT_run1_HvV_center_fstop5.6_exp50ms\G62B.7LT_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '042214';
files(n).topox =  '042214 g62b7lt\G62B.7LT_run1_topox_fstop5.6_exp50msmaps.mat';
files(n).topoy = '042214 g62b7lt\G62B.7LT_run2_topoy_fstop5.6_exp50msmaps.mat';
files(n).behav = '042214 g62b7lt\G62b7lt_run1_HvV_center_fbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session'; %behavior only 9999 images
files(n).topoxdata = '042214 G62B.7LT Passive Viewing\G62B.7LT_run1_topox_fstop5.6_exp50ms\G62B.7lt_run1_topox_fstop5.6_exp50ms';
files(n).topoydata = '042214 G62B.7LT Passive Viewing\G62B.7LT_run2_topoy_fstop5.6_exp50ms\G62B.7LT_run2_topoy_fstop5.6_exp50ms';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '042214 g62b.7 LT HvV_center_behavior\G62b7lt_run1_HvV_center_fstop5.6_exp50ms_only9999images\G62b7lt_run1_HvV_center_fstop5.6_exp50ms';

n=n+1;
files(n).subj = 'g62g4lt';
files(n).expt = '042114';
files(n).topox =  '042114 g62g4lt\g62g.4lt_run1_topoxmaps.mat'; %topoX reverse
files(n).topoy = '042114 g62g4lt\g62g.4lt_run2_topoymaps.mat';
files(n).behav = '042114 g62g4lt\g62g.4lt_run1_HvV_center_5behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session - no topoX?'; % topo x map is reversed (ran topox-rev?)
files(n).topoxdata = '042114 G26g.4_lt Passive Viewing\g62g.4lt_run1_topox\G26g.4lt_run1_topox';
files(n).topoydata = '042114 G26g.4_lt Passive Viewing\g62g.4lt_run2_topoy\g62g.4lt_run2_topoy';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '042114 g62g.4-lt HvV_center behavior\g62g.4lt_run1_HvV_center_50msexp_5.6fstop\g62g.4lt_run1_HvV_center_50msexp_5.6fstop';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '042114';
files(n).topox =  '042114 g62b8tt\G62B8TT_run1_Topox+50msExp_5.6fstopmaps.mat';
files(n).topoy = '042114 g62b8tt\G62B8TT_run2_Topoy_50msExp_5.6fstopmaps.mat';
files(n).behav = '042114 g62b8tt\G62B8TT_run1_HvV_center_behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '042114 G62B8-tt Passive Viewing\G62B8TT_run1_Topox+50msExp_5.6fstop\G62B8TT_run1_Topox+50msExp_5.6fstopcallPsychStim';
files(n).topoydata = '042114 G62B8-tt Passive Viewing\G62B8TT_run2_Topoy_50msExp_5.6fstop\G62B8TT_run2_Topoy_50msExp_5.6fstop';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '042114 G62B8-TT HvV_center Behavior\G62B8TT_run1_HvV_center_50msexp_5.6fstp';

n=n+1;
files(n).subj = 'g62g4lt';
files(n).expt = '041814';
files(n).topox =  '041814 g62g4lt\G62G4-LT_run1_topoX_50ms_F5.6maps.mat';
files(n).topoy = '041814 g62g4lt\G62G4-LT_run2_topoY_50ms_F5.6maps.mat';
files(n).behav = '041814 g62g4lt\041814_G62G4-LT_run1_HvV_center_50ms_F5.6_shabehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session'; %poor performance
files(n).topoxdata = '041814 g62g4-lt PASSIVE VIEWING\G62G4-LT_run1_topoX_50ms_F5.6\G62G4-LT_run1_topoX_50ms';
files(n).topoydata = '041814 g62g4-lt PASSIVE VIEWING\G62G4-LT_run2_topoY_50ms_F5.6\G62G4-LT_run2_topoY_50ms';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '041814 G62G.4-LT HvV_center behavior\041814_G62G4-LT_run1_HvV_center_50ms_F5.6_shadowGreenChannel\041814_G62G4-LT_run1_HvV_center_50ms_F5.6_shadowGreenChannel';

n=n+1;
files(n).subj = 'g62b8tt';
files(n).expt = '041814';
files(n).topox =  '041814 g62b8tt\G62B8tt_run1_topoX_50ms_F5.6maps.mat';
files(n).topoy = '041814 g62b8tt\G62B8tt_run2_topoY_50ms_F5.6maps.mat';
files(n).behav = '041814 g62b8tt\G62B.8-TT_run1_HvV_center_5behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '041814 G62B8tt passive viewing\G62B8tt_run1_topoX_50ms_F5.6\G62B8tt_run1_topoX_50ms';
files(n).topoydata = '041814 G62B8tt passive viewing\G62B8tt_run2_topoY_50ms_F5.6\G62B8tt_run2_topoY_50ms';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '041814 G62B.8-tt HvV_center Behavior\G62B.8-TT_run1_HvV_center_50msexp_5.6Fstop\G62B.8-TT_run1_HvV_center_50msexp_5.6Fstop';

n=n+1;
files(n).subj = 'g62c2rt';
files(n).expt = '031114';
files(n).topox =  '031114 g62c2rt\G62C.2-RT_run1_topoX_F_4_50msexpmaps.mat';
files(n).topoy = '031114 g62c2rt\G62C.2-RT_run2_topoY_F_4_50msexpmaps.mat';
files(n).behav = '031114 g62c2rt\G62C.2-RT_run1_HvV_center_behavbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '031114 G62C.2-RT passive viewing\G62C.2-RT_run1_topoX_F_4_50msexp\G62C.2-RT_run1_topoX_F_4_50msexp';
files(n).topoydata = '031114 G62C.2-RT passive viewing\G62C.2-RT_run2_topoY_F_4_50msexp\G62C.2-RT_run2_topoY_F_4_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '031114 G62C.2-RT HvV_center Behavior\G62C.2-RT_run1_HvV_center_behavior_F_4_50msexp\G62C.2-RT_run1_HvV_center_behavior_F_4_50msexp';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '031114';
files(n).topox =  '031114 g62b7lt\G62B.7-LT_run1_topoX_F_4_50msexpmaps.mat';
files(n).topoy = '031114 g62b7lt\G62B.7-LT_run2_topoY_F_4_50msexpmaps.mat';
files(n).behav = '031114 g62b7lt\G62B.7-LT_run1_HvV_center_behaviorbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '031114 G62B.7-LT passive viewing\G62B.7-LT_run1_topoX_F_4_50msexp\G62B.7-LT_run1_topoX_F_4_50msexp';
files(n).topoydata = '031114 G62B.7-LT passive viewing\G62B.7-LT_run2_topoY_F_4_50msexp\G62B.7-LT_run2_topoY_F_4_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '031114 G62B.7-LT HvV_center Behavior\G62B.7-LT_run1_HvV_center_behavior_Fstop4_50msexp\G62B.7-LT_run1_HvV_center_behavior_Fstop4_50msexp';

n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '031114';
files(n).topox =  '031114 g62b3rt\G62B.3-RT_run1_topoX_F_4_50msexpmaps.mat';
files(n).topoy = '031114 g62b3rt\G62B.3-RT_run2_topoY_F_4_50msexpmaps.mat';
files(n).behav = '031114 g62b3rt\G62B.3-RT_run1_HvV_behavbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '031114 G62B.3-RT passive viewing\G62B.3-RT_run1_topoX_F_4_50msexp\G62B.3-RT_run1_topoX_F_4_50msexp';
files(n).topoydata = '031114 G62B.3-RT passive viewing\G62B.3-RT_run2_topoY_F_4_50msexp\G62B.3-RT_run2_topoY_F_4_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '031114 G62B.3-RT HvV Behavior\G62B.3-RT_run1_HvV_behavior_F_4_50msexp\G62B.3-RT_run1_HvV_behavior_F_4_50msexp';

n=n+1;
files(n).subj = 'g62b1lt';
files(n).expt = '031114';
files(n).topox =  '031114 g62b1lt\G62B.1-LT_run1_topoX_F_5.6_50msexpmaps.mat';
files(n).topoy = '031114 g62b1lt\G62B.1-LT_run2_topoY_F_5.6_50msexpmaps.mat';
files(n).behav = '031114 g62b1lt\G62B.1-LT_run1_HvV_behavior_Fsbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '031114 G62B.1-LT passive viewing\G62B.1-LT_run1_topoX_F_5.6_50msexp\G62B.1-LT_run1_topoX_F_5.6_50msexp';
files(n).topoydata = '031114 G62B.1-LT passive viewing\G62B.1-LT_run2_topoY_F_5.6_50msexp\G62B.1-LT_run2_topoY_F_5.6_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '031114 G62B.1-RT HvV Behavior\G62B.1-LT_run1_HvV_behavior_Fstop_5.6_50msexp\G62B.1-LT_run1_HvV_behavior_Fstop_5.6_50msexp';

n=n+1;
files(n).subj = 'g62b5lt';
files(n).expt = '030614';
files(n).topox =  '030614 g62b5lt\G62B.5-LT_run1_topoX_F_4_50msexpmaps.mat';
files(n).topoy = '030614 g62b5lt\G62B.5-LT_run2_topoY_F_4_50msexpmaps.mat';
files(n).behav = '030614 g62b5lt\G62B.5-LT_run1_GTS_behavbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '030614 G62B.5-LT passive viewing\G62B.5-LT_run1_topoX_F_4_50msexp\G62B.5-LT_run1_topoX_F_4_50msexp';
files(n).topoydata = '030614 G62B.5-LT passive viewing\G62B.5-LT_run2_topoY_F_4_50msexp\G62B.5-LT_run2_topoY_F_4_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030614 G62B.5-LT GTS behavior\G62B.5-LT_run1_GTS_behavior_F_4_50msexp\G62B.5-LT_run1_GTS_behavior_F_4_50msexp';

n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '030614';
files(n).topox =  '030614 g62b3rt\G62B.3-RT_run1_topoX_F_4_50msexpmaps.mat';
files(n).topoy = '030614 g62b3rt\G62B.3-RT_run2_topoY_F_4_50msexpmaps.mat';
files(n).behav = '030614 g62b3rt\G62B.3-RT_run1_HvV_behaviorbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session'; %poor performance
files(n).topoxdata = '030614 G62B.3-RT passive viewing\G62B.3-RT_run1_topoX_F_4_50msexp\G62B.3-RT_run1_topoX_F_4_50msexp';
files(n).topoydata = '030614 G62B.3-RT passive viewing\G62B.3-RT_run2_topoY_F_4_50msexp\G62B.3-RT_run2_topoY_F_4_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030614 G62B.3-RT HvV behavior\G62B.3-RT_run1_HvV_behavior_Fstop4_50msexp\G62B.3-RT_run1_HvV_behavior_Fstop4_50msexp';

n=n+1;
files(n).subj = 'g628lt';
files(n).expt = '030214';
files(n).topox =  '030214 g628lt\G62.8-LT_run1_topoX_Fstop_5.6_50msexpmaps.mat';
files(n).topoy = '030214 g628lt\G62.8-LT_run2_topoY_Fstop_5.6_50msexpmaps.mat';
files(n).behav = '';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'could not analyze behavior imaging session (combine tiffs). good session '; %not sure what problem is (video writer)
files(n).topoxdata = '030214 G62.8-LT passive viewing\G62.8-LT_run1_topoX_Fstop_5.6_50msexp\G62.8-LT_run1_topoX_Fstop_5.6_50msexp';
files(n).topoydata = '030214 G62.8-LT passive viewing\G62.8-LT_run2_topoY_Fstop_5.6_50msexp\G62.8-LT_run2_topoY_Fstop_5.6_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030214 G62.8-LT GTS behavior\G62.8-LT_run1_GTS_behavior_Fstop_5.6_50ms_exposure/G62.8-LT_run1_GTS_behavior_Fstop_5.6_50ms_exposure';


n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '030214';
files(n).topox =  '030214 g62b7lt\030214 G62B.7-LT_run1_topoX_Fstop8_50msexpmaps.mat';
files(n).topoy = '030214 g62b7lt\030214 G62B.7-LT_run2_topoY_Fstop8_50msexpmaps.mat';
files(n).behav = '030214 g62b7lt\G62B.7-LT_run1_HvV_center_behavior_behav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '030214 G62B.7-LT passive viewing\030214 G62B.7-LT_run1_topoX_Fstop8_50msexp\030214 G62B.7-LT_run1_topoX_Fstop8_50msexp';
files(n).topoydata = '030214 G62B.7-LT passive viewing\030214 G62B.7-LT_run2_topoY_Fstop8_50msexp\030214 G62B.7-LT_run2_topoY_Fstop8_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030214 G62B.7-LT HvV_center behavior\G62B.7-LT_run1_HvV_center_behavior_Fstop_8_50msexp\G62B.7-LT_run1_HvV_center_behavior_Fstop_8_50msexp';

n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '030214';
files(n).topox =  '030214 g62b3rt\G62B.3-RT_run4_topoX_F_8_50msexp_hat_fell_off_earliermaps.mat';
files(n).topoy =  '030214 g62b3rt\G62B.3-RT_run3_topoY_F_8_50msexp_hat_fell_off_earliermaps.mat';
files(n).behav = '030214 g62b3rt\G62B.3-RT_run1_HvV_behaviorbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '030214 G62B.3-RT passive viewing\G62B.3-RT_run1_topoX_F_8_50msexp\G62B.3-RT_run1_topoX_F_8_50msexp';
files(n).topoydata = '030214 G62B.3-RT passive viewing\G62B.3-RT_run2_topoY_F_8_50msexp\G62B.3-RT_run2_topoY_F_8_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030214 G62B.3-RT HvV behavior\G62B.3-RT_run1_HvV_behavior_Fstop8_50msexp\G62B.3-RT_run1_HvV_behavior_Fstop8_50msexp';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '030114';
files(n).topox =  '030114 g62b7lt\G62B.7-LT_run1_topoX_Fstop_5.6_50msexpmaps.mat';
files(n).topoy = '030114 g62b7lt\G62B.7-LT_run2_topoY_Fstop_5.6_50msexpmaps.mat';
files(n).behav = '030114 g62b7lt\G62B.7-LT_run1_HvV_center_behavior_Fbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '030114 G62B.7-LT passive veiwing\G62B.7-LT_run1_topoX_Fstop_5.6_50msexp\G62B.7-LT_run1_topoX_Fstop_5.6_50msexp';
files(n).topoydata = '030114 G62B.7-LT passive veiwing\G62B.7-LT_run2_topoY_Fstop_5.6_50msexp\G62B.7-LT_run1_topoY_Fstop_5.6_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030114 G62B.7-LT HvV_center Behavior\G62B.7-LT_run1_HvV_center_behavior_Fstop5.6_50msexp\G62B.7-LT_run1_HvV_center_behavior_Fstop5.6_50msexp';

n=n+1;
files(n).subj = 'g62b5lt';
files(n).expt = '030114';
files(n).topox =  '030114 g62b5lt\G62B.5_LT_run2_topoX_Fstop_8_50msexpmaps.mat';
files(n).topoy = '030114 g62b5lt\G62B.5_LT_run3_topoY_Fstop_8_50msexpmaps.mat';
files(n).behav = '';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'no behavior imaging session'; %camware took a few extra frames (cant analyze)
files(n).topoxdata = '030114 G62B.5-LT passive veiwing\G62B.5_LT_run2_topoX_Fstop_8_50msexp\G62B.5_LT_run2_topoX_Fstop_8_50msexp';
files(n).topoydata = '030114 G62B.5-LT passive veiwing\G62B.5_LT_run3_topoY_Fstop_8_50msexp\G62B.5_LT_run3_topoY_Fstop_8_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030114 G62B.5-LT GTS Behavior (Fstop 8)\G62B.5-LT_run1_GTS_behavior_Fstop_8_50msexp\G62B.5-LT_run1_GTS_behavior_Fstop_8_50msexp';

n=n+1;
files(n).subj = 'g62b4ln';
files(n).expt = '030114';
files(n).topox =  '030114 g62b4ln\G62B.4-LN_run1_TopoX_Fstop_11_30msexpmaps.mat';
files(n).topoy = '030114 g62b4ln\G62B.4-LN_run3_TopoY_Fstop_5.6_30msexpmaps.mat';
files(n).behav = '030114 g62b4ln\G62B.4-LN_run4_GTS_Behavior_topFbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '030114 G62B.4-LN Passive viewing (F-stop diff)\G62B.4-LN_run1_TopoX_Fstop_11_30msexp\G62B.4-LN_run1_TopoX_Fstop_11_30msexp';
files(n).topoydata = '030114 G62B.4-LN Passive viewing (F-stop diff)\G62B.4-LN_run3_TopoY_Fstop_5.6_30msexp\G62B.4-LN_run3_TopoY_Fstop_5.6_30msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030114 G62B.4-LN GTS Behavior (Top Fstop-11)\G62B.4-LN_run4_GTS_Behavior_topFstop-11_30msexp\G62B.4-LN_run4_GTS_Behavior_topFstop-11_30msexp';

n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '030114';
files(n).topox =  '030114 g62b3rt\G62B.3-RT_run1_topoX_Fstop5.6_50msexpmaps.mat';
files(n).topoy = '030114 g62b3rt\G62B.3-RT_run2_topoY_Fstop5.6_50msexpmaps.mat';
files(n).behav = '030114 g62b3rt\G62B.3-RT_run1_HvV_behavior_Fsbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '030114 G62B.3-RT Passive Viewing\G62B.3-RT_run1_topoX_Fstop5.6_50msexp\G62B.3-RT_run1_topoX_Fstop5.6_50msexp';
files(n).topoydata = '030114 G62B.3-RT Passive Viewing\G62B.3-RT_run2_topoY_Fstop5.6_50msexp\G62B.3-RT_run2_topoY_Fstop5.6_50msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '030114 G62B.3-RT HvV Behavior\G62B.3-RT_run1_HvV_behavior_Fstop_5.6_50msexp\G62B.3-RT_run1_HvV_behavior_Fstop_5.6_50msexp';

n=n+1;
files(n).subj = 'g62b3rt';
files(n).expt = '022814';
files(n).topox =  '022814 g62b3rt\G62B.3-RT_run2_topoXmaps.mat';
files(n).topoy = '022814 g62b3rt\G62B.3-RT_run3_topoYmaps.mat';
files(n).behav = '022814 g62b3rt\G62B.3-RT_run1_HvV_Bbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '022814 G62B.3-RT passive veiwing\G62B.3-RT_run2_topoX\G62B.3-RT_run2_topoX';
files(n).topoydata = '022814 G62B.3-RT passive veiwing\G62B.3-RT_run3_topoY\G62B.3-RT_run3_topoY';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '022814 G62B.3-RT HvV Behavior\G62B.3-RT_run1_HvV_Behavior_15msexp\G62B.3-RT_run1_HvV_Behavior_15msexp';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '022514';
files(n).topox =  '022514 g62b7lt\G62B7-LT_run1_TopoXmaps.mat';
files(n).topoy = '022514 g62b7lt\G62B7-LT_run2_TopoYmaps.mat';
files(n).behav = '022514 g62b7lt\G62B.7-LT_run1_HvV_center_Bbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';
files(n).topoxdata = '022514 G62B.7-LT passive veiwing\G62B7-LT_run1_TopoX\G62B7-LT_run1_TopoX';
files(n).topoydata = '022514 G62B.7-LT passive veiwing\G62B7-LT_run2_TopoY\G62B7-LT_run2_TopoY';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '022514 G62B.7-LT HvV_center Behavior\G62B.7-LT_run1_HvV_center_Behavior_15msexp\G62B.7-LT_run1_HvV_center_Behavior_15msexp';

n=n+1;
files(n).subj = 'g62b7lt';
files(n).expt = '022314';
files(n).topox =  '022314 g62b7lt\G62B.7-LT_run2_topoX_15msmaps.mat';
files(n).topoy = '022314 g62b7lt\G62B.7-LT_run3_topoY_15msmaps.mat';
files(n).behav = '022314 g62b7lt\G62B.7-LT_run1_HvV_center_Bbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'HvV_center';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';%couldnt do behavior overlay 5/20
files(n).topoxdata = '022314 G62B.7-LT passive veiwing\G62B.7-LT_run2_topoX_15ms\G62B.7-LT_run2_topoX';
files(n).topoydata = '022314 G62B.7-LT passive veiwing\G62B.7-LT_run3_topoY_15ms\G62B.7-LT_run3_topoY';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '022314 G62B.7-LT HvV_center Behavior\G62B.7-LT_run1_HvV_center_Behavior_15msexp\G62B.7-LT_run1_HvV_center_Behavior_15msexp';

n=n+1;
files(n).subj = 'g62b4ln';
files(n).expt = '022114';
files(n).topox =  '022114 g62b4ln\G62B.4-LN_run2_topoX_15msexpmaps.mat';
files(n).topoy = '022114 g62b4ln\G62B.4-LN_run4_topoY_15msexpmaps.mat';
files(n).behav = '022114 g62b4ln\G62B.4-LN_run1_GTS_bbehav data.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'good imaging session';%couldnt do behavior overlay 5/20
files(n).topoxdata = '022114 G62B.4-LN Passive viewing\G62B.4-LN_run2_topoX_15msexp\G62B.4-LN_run2_topoX_15msexp';
files(n).topoydata = '022114 G62B.4-LN Passive viewing\G62B.4-LN_run4_topoY_15msexp\G62B.4-LN_run4_topoY_15msexp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '022114 G62B.4-LN GTS Behavior\G62B.4-LN_run1_GTS_behavior_15msexp';

n=n+1;
files(n).subj = 'g628lt';
files(n).expt = '021914';
files(n).topox =  '021914 g628lt\G628-LT_run2_topoX_15ms_expmaps.mat';
files(n).topoy = '021914 g628lt\G628-LT_run3_topoY_15ms_expmaps.mat';
files(n).behav = '021914 g628lt\G628-LT_run1_GTS_behavior_15ms_exp.pcoraw_115_138_31311_8_540_1_640_1_31311.mat';
files(n).grating = '';
files(n).loom = '';
files(n).monitor = 'vert';
files(n).task = 'GTS';
files(n).label = 'camk2 gc6';
files(n).notes = 'pco raw files for behavior, low resolution'; %couldnt do behavior analysis overlay
files(n).topoxdata = '021914 G628-LT passive veiwing\G628-LT_run2_topoX_15ms_exp\G628-LT_run2_topoX_15ms_exp';
files(n).topoydata = '021914 G628-LT passive veiwing\G628-LT_run3_topoY_15ms_exp\G628-LT_run3_topoY_15ms_exp';
files(n).gratingdata = '';
files(n).loomdata = '';
files(n).behavdata = '021914 G628-LT GTS Behavior\G628-LT_run1_GTS_behavior_15ms_exp0';



% % n=n+1;
% % files(n).subj = '';
% % files(n).expt = '';
% % files(n).topox =  '';
% % files(n).topoxdata = '';
% % files(n).topoy = '';
% % files(n).topoydata = '';
% % files(n).behav = '';
% % files(n).behavdata = '';
% % files(n).grating = '';
% % files(n).gratingdata = '';
% % files(n).loom = '';
% % files(n).loomdata = '';
% % files(n).monitor = 'vert';
% % files(n).task = '';
% % files(n).label = 'camk2 gc6';
% % files(n).notes = 'good imaging session';
% % 
% % files(n).topoxdata = '';
% % files(n).topoydata = '';
% % files(n).behavdata = '';
% % files(n).gratingdata = '';
% % files(n).loomdata = '';

% movemapfiles
% keyboard

% 
% %%% batch dfofMovie
% errmsg= [];errRpt = {};
% nerr=0;
% %for f = 1:length(files);
% 
% for f = 1:length(files)
%     f
%     tic
%     
%     try
%         dfofMovie([datapathname files(f).topoxdata]);
%     catch exc
%         nerr=nerr+1;
%         errmsg{nerr}= sprintf('couldnt do %s',files(f).topoxdata)
%         errRpt{nerr}=getReport(exc,'extended')
%     end
%     try
%         dfofMovie([datapathname files(f).topoydata]);
%     catch exc
%         nerr=nerr+1;
%         errmsg{nerr}=sprintf('couldnt do %s',files(f).topoydata)
%         errRpt{nerr}=getReport(exc,'extended')
%     end
%     try
%         dfofMovie([datapathname files(f).loomdata]);
%     catch exc
%         nerr=nerr+1;
%         errmsg{nerr}=sprintf('couldnt do %s',files(f).loomdata)
%          errRpt{nerr}=getReport(exc,'extended')
%     end
%     try
%         dfofMovie([datapathname files(f).gratingdata]);
%     catch exc
%         nerr=nerr+1;
%         errmsg{nerr}=sprintf('couldnt do %s',files(f).gratingdata)
%          errRpt{nerr}=getReport(exc,'extended')
%     end
% 
%     
%     for e = 1:nerr
%         errRpt{e}
%     end
%     toc
% end
%  errRpt{:} ;

outpathname = 'I:\compiled behavior\behavior topos\';


use = find(strcmp({files.monitor},'vert') &  strcmp({files.notes},'good imaging session') &  strcmp({files.label},'camk2 gc6')&  strcmp({files.task},'HvV_center') &strcmp({files.subj},'g62b7lt'))


%use = 1: length(files)
%%% calculate gradients and regions
clear map merge
for f = 1:length(use)
    f
    [map{f} merge{f}]= getRegions(files(use(f)),pathname,outpathname);
end

%%% align gradient maps to first file
for f = 1:length(use); %changed from 1:length(map)
    [imfit{f} allxshift(f) allyshift(f) allzoom(f)] = alignMaps(map([1 f]), merge([1 f]), [files(use(f)).subj ' ' files(use(f)).expt ' ' files(use(f)).monitor] );
    xshift = allxshift(f); yshift = allyshift(f); zoom = allzoom(f);
    save( [outpathname files(f).subj files(f).expt '_topography.mat'],'xshift','yshift','zoom','-append');
end

avgmap=0;
for f= 1:length(use) ;
    
    m = shiftImage(merge{f},allxshift(f),allyshift(f),allzoom(f),100);
    sum(isnan(m(:)))
    
    sum(isnan(merge{f}(:)))
    figure
    imshow(m);
    avgmap = avgmap+m;
    title( [files(use(f)).subj ' ' files(use(f)).expt ' ' files(use(f)).monitor] );
end
avgmap = avgmap/length(use);
figure
imshow(avgmap);
title('average topo  map');


% %%% overlay behavior on top of topomaps
 clear behav
%matlabpool
for f = 1:length(use)
    try
        behav{f} = overlayMaps(files(use(f)),pathname,outpathname);
    catch
                sprintf('couldnt do behav on %d',f)
    end
    
end
%matlabpool close

nb=0; avgbehav=0;
for f= 1:length(use)
        if ~isempty(behav(f));
            b = shiftdim(behav{f},1);
            zoom = 260/size(b,1);
            b = shiftImage(b,allxshift(f),allyshift(f),zoom,100);
            avgbehav = avgbehav+b;
            nb= nb+1;
        end
end
avgbehav = avgbehav/nb;



figure
for t= 1:22
    subplot(5,5,t);
    imshow(avgmap);
    hold on
    data = squeeze(avgbehav(:,:,t));
    h = imshow(mat2im(data,jet,[-0.15 0.15]));
   transp = zeros(size(squeeze(avgmap(:,:,1))));
   transp(abs(data)>0.02)=1;
    set(h,'AlphaData',transp);
    
end

%%% analyze 4-phase data (e.g. looming and grating)
for f = 1:length(use)
    loom_resp{f}=fourPhaseOverlay(files(use(f)),pathname,outpathname,'loom');
end



for f = 1:length(use)
    grating_resp{f}=fourPhaseOverlay(files(use(f)),pathname,outpathname,'grating');
end