# LN-TPSVR
1. Abstract
   
Most regression techniques assume that noise characteristics are influenced by a Gaussian distribution. However, in some low-quality data, such as photovoltaic power generation and traffic flow estimation, studies have found that data noise does not follow a Gaussian distribution but rather tends to follow a Laplace distribution. Therefore, this paper introduces Laplace noise characteristics by combining the proximal support vector regression (PSVR) model with the twin support vector regression (TSVR) model, designing a new regressor, called the twin proximal support vector regression with Laplace noise (LN-TPSVR). Furthermore, the stochastic gradient descent (SGD) is used to solve the LN-TPSVR model.

2. Installation

Set up a Matlab environment for R2016a version

## Source

1. Dataset

You can download the dataset by referring to the URL.

https://github.com/liuchaonihao/LN-TPSVR.git

2. Code

Run main.m

## Application
MATLAB Compiler

1. Prerequisites for Deployment 

. Verify the MATLAB Runtime is installed and ensure you have installed version 9.0.1 (R2016a).   

. If the MATLAB Runtime is not installed, do the following:
 
  (1) enter
  
      >>mcrinstaller
      
      At MATLAB prompt. The MCRINSTALLER command displays the location of the MATLAB Runtime installer.

  (2) run the MATLAB Runtime installer.

      Or download the Windows 64-bit version of the MATLAB Runtime for R2016a from the MathWorks Web site by navigating to http://www.mathworks.com/products/compiler/mcr/index.html
      
For more information about the MATLAB Runtime and the MATLAB Runtime installer, see Package and Distribute in the MATLAB Compiler documentation in the MathWorks Documentation Center.    


NOTE: You will need administrator rights to run MCRInstaller. 


2. Files to Deploy and Package

#######Files to package for Standalone#######

-Gui.exe
   
   -if end users are unable to download the MATLAB Runtime using the above link, include it when building your component by clicking the "Runtime downloaded from web" link in the Deployment Tool

-This readme file 

3. Definitions

For information on deployment terminology, go to http://www.mathworks.com/help. Select MATLAB Compiler >  Getting Started > About Application Deployment > Deployment Product Terms in the MathWorks Documentation Center.
