This is the ReadME file for: 
NSF REU Summer 2022 Project: 'Image Processing and Machine Learning for Tumor Detection Using MRI Images'

Mentor: 
Dr. Yanwei Jin, University of Maryland, Eastern Shore - yjin@umes.edu

Contributors:
Emily Hitchcock, Salisbury University - evhitchcock@proton.me
Sarah Hodges, Liberty University - sarah.hodges1401@gmail.com
Kevin Zuang, Brown University - kevinzuang@gmail.com

Acknowledgement:
Dr. Yanwei Jin, University of Maryland, Eastern Shore - yjin@umes.edu
Dr. Qiuhong He, University of North Carolina, Chapel Hill

----------------------------------------------------------------------------------------------------------------------------------------------
MATLAB ALGORITHM DESCRIPTION AND USE INSTRUCTIONS

Image Folders (MATLAB Algorithm):
data_set_1 - original images from 1st data set
data_set_2 - original images from 2nd data set
data_set_3 - original images from 3rd data set
data_set_4 - original images from 4th data set
data_set_1_cropped - original images cropped for 1st data set
data_set_2_cropped - original images cropped for 2nd data set
data_set_3_cropped - original images cropped for 3rd data set
data_set_4_cropped - original images cropped for 4th data set

Files Used for MATLAB Algorithm:
final_without_unet.m
findCenterOfMass.m
histNorm.m
preprocess.m
closeBorder.m
Compute_Volume.m
isolateTumor.m
seggers.m
finalcutt.m

Required Folders for Running 'final_without_unet' (Located in the Same Directory as Above Files):
1_photos
2_edge
3_gauss
4_normalized
5_binarized
6_colored
7_kmeans

Required MATLAB Toolboxes:
Image Processing
Signal Processing
Deep Learning Toolbox
Computer Vision 

Instructions for Running MATLAB Algorithm:
1) Install MATLAB and all of the Toolboxes Listed Above
2) Download & Upload/Add Files above to either MATLAB Online or Put in Same Directory
3) Go Through and Create all of the Folders Listed Above
4) Open Command Window and Clear Workspace with 'clear' and Clear Command Window with 'clc'
5) Click 'Run' in the Ribbon
6) Doctored Images are Located in Each Respective Folder and Volume will be Displayed in the Command Window

MATLAB Tips & Tricks:
- When creating functions or files to call later, the name of the file must match the function name
- To run this algorithm successfully, all files must be located in the same path
- Works best with MATLAB Online or version 'a' (aka released in March of each year)
	- MATLAB R2017b Desktop App had issues with "directory names", ie "1_photos"

----------------------------------------------------------------------------------------------------------------------------------------------
U-NET DESCRIPTION AND USE INSTRUCTIONS

Files Used for Python Neural Network:
predict_tumor.py
train_net.py

Required Python Libraries:
Keras
TensorFlow
