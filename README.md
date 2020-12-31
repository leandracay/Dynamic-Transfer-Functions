# Transfer-functions
Introduction
This repository contains data files and Matlab codes used to analyze data from manuscript entitled "Mapping the dynamic transfer functions of epigenome editing". 
Note: this package was written with Matlab R2018b. 
It is written purely in Matlab language. It requires "fwer_holmbonf.m" from Multiple Testing Toolbox (https://www.mathworks.com/matlabcentral/fileexchange/70604-multiple-testing-toolbox). 

Package contains three folders described below:

Matlab codes: Contains all executable files
  BlahutArimoto.m- Algorithm to calculate the maximal mutual information from descretized data outputs. Modified from https://gist.github.com/Piyush3dB/01df75af9889414de1b6.
  
  CRAnalysisFunction.m-Normalizes data for the CR screen and performs outlier analysis.
  CROverallAnalysis.m-Produces panels for Figures 6 and S5.
  CV_med_Calculation.m-Performs gating of events and calculates median and coefficient of variation values for fluorescence
  MIfunction.m-Preps data for input into Blahut-arimoto
  ProfileClusterAnalysis.m-Performs clustering for CRs
  VP16Analysis_allPW_20201005.m
  VP16Analysis_allPW.m-Produces graphs with all PWs found in figures 2 and 3. Also finds linear regression in Figure 2C.
  VP16Analysis_allPWselect.m
  VP16Analysis_individual.m-Produces graphs for individual PWs found in figure 2 and 3.
  VP16onlyMI.m-Finds MI for VP16 only data (Figure 5).
