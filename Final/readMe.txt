This is the ReadME file for: 
NSF REU Summer 2022 Project: 'Image Processing and Machine Learning for Tumor Detection Using MRI Images'

Mentor: 
Dr. Yanwei Jin, University of Maryland, Eastern Shore - yjin@umes.edu

Contributors:
Emily Hitchcock, Salisbury University - evhitchcock@proton.me
Sarah Hodges, Liberty University - sarah.hodges1401@gmail.com
Kevin Zuang, Brown University - kevinzuang@gmail.com

Acknowledgement:
Dr. Yanwei Jin, University of Maryland Eastern Shore - yjin@umes.edu
Dr. Qiuhong He, University of North Carolina, Chapel Hill 
Dr. Enyue Lu, Salisbury University - EALU@salisbury.edu

**********************************************************************************************************************************************
MATLAB ALGORITHMS
--------------------------------------------------------------------------------------------------------------------------------

BENCHMARKING INSTRUCTIONS

Research Papers Used for Benchmarking:
a) "An Algorithm for Detecting Brain Tumors in MRI Images"
b) "Brain Tumor Segmentation to Calculate Percentage Tumor Using MRI" 
c) "Efficient Detection of Brain Tumor from MRIs Using K-Means Segmentation and Normalized Histogram"
d) "Minimum Time Delay and More Efficient Image Filtering Brain Tumor Detection with the help of MATLAB"


Files Used for Benchmarking:
1) testa.m
	a) histNormal.m
	b) isolateTumor.m
2) testb.m
3) testd.m 
4) convertMAT2JPG.m - converts .MAT type given by Image Segmenter when creating the binary masks to .JPG

-------------------------------------------------------------------------

Required Folders for Running 'testa.m':
1) 1_photos
2) 2_preprocessing
3) 3_CannyEdge
4) 3_CannyEdgeApplied
5) 4_HarrisLaplace_Isolated

Instructions for Running ' testa.m':
1) Create specified folders in the same directory as testa.m
2) Place data set in 1_photos
3) copy histNormal.m & isolateTumor to same directory
4) Run the program to populate the remaining folders. 

-------------------------------------------------------------------------

Required Folders for Running ' testb.m':
1) 1_photos
2) 2_preprocessing
3) 3_deadTumorSegSet
4) 3_TumorSeg

Instructions for Running ' testb.m':
1) create specified folders in the same directory as testb.m
2) place data set in 1_photos
3) Run the program to populate the remaining folders. 

-------------------------------------------------------------------------

Required Folders for Running ' testd.m':
1) 1_photos
2) 2_Gaussian_d
3) 3_Median_Gauss_d
4) 3_Median_No_Gauss_d
5) 4_Watershed_d
6) 6_Weiner_d
7) 8_GradMag_d
8) 9_RegMax_d


Instructions for Running 'testd.m':
1) Create specified folders in the same directory as testd.m
2) Place data set in 1_photos
3) Run the program to populate the remaining folders. 

--------------------------------------------------------------------------------------------------------------------------------
IMAGE PROCESSING ALGORITHM DESCRIPTION AND USE INSTRUCTIONS

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
1) final_without_unet.m - MAIN FILE
2) findCenterOfMass.m
3) histNorm.m
4) preprocess.m
5) closeBorder.m
6) Compute_Volume.m
7) isolateTumor.m
8) seggers.m
9) finalcutt.m

Required Folders for Running 'final_without_unet.m' (Located in the Same Directory as Above Files):
1_photos
2_edge
3_gauss
4_normalized
5_binarized
6_colored
7_kmeans

Required MATLAB Toolboxes:
1) Image Processing
2) Signal Processing
3) Deep Learning Toolbox
4) Computer Vision 

Instructions for Running MATLAB Algorithm:
1) Install MATLAB and all of the Toolboxes Listed Above
2) Download & Upload/Add Files above to either MATLAB Online or Put in Same Directory
3) Go Through and Create all of the Folders Listed Above
4) Open Command Window and Clear Workspace with 'clear' and Clear Command Window with 'clc'
5) Open the main file, titled 'final_without_unet.m'
6) Click 'Run' in the Ribbon
7) Doctored Images are Located in Each Respective Folder and Volume will be Displayed in the Command Window

MATLAB Tips & Tricks:
- When creating functions or files to call later, the name of the file must match the function name
- To run this algorithm successfully, all files must be located in the same path
- Works best with MATLAB Online or version 'a' (aka released in March of each year)
	- MATLAB R2017b Desktop App had issues with "directory names", ie "1_photos" when running 2017b version


----------------------------------------------------------------------------------------------------------------------------------------------
DATA AUGMENTATION INSTRUCTIONS

Files Used to Augment Images:
Main File:
1) aug.m 
Function Files:
2) findCenterOfMass.m
3) hitNormal.m
	
Required Folders for Running '.m':
1) 1_binpics
2) 1_pics 
3) 2_augPis
4) 3_normPics
5) 4_gauss
6) 5_noise

Instructions for Running Augmentation Algorithm:
1) Create specified folders in the same directory as aug.m
2) Place data set in 1_photos
3) Place findCenterOfMass.m & histNormal.m in same directory as aug.m
3) Run the program to populate the remaining folders. 


**********************************************************************************************************************************************
PYTHON
----------------------------------------------------------------------------------------------------------------------------------------------
U-NET DESCRIPTION AND USE INSTRUCTIONS

Files Used for Python Neural Network:
1) predict_tumor.py
2) preprocess.m

Required Python Libraries:
1) Keras
2) TensorFlow
3) Numpy

Instructions for Running U-Net:
1)Make a folder to write preproccsed images to
2)Set the write directory in preprocess.m to the folder created and the read directory to the original images
3)Run preprocess.py
4)Make/set a folder to write the predicted images to
5)Set the read directory to file path of preprocessed images and write directory to the predicted image folder
6)Run predict_tumor.py

