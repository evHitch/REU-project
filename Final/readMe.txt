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
----------------------------------------------------------------------------------------------------------------------------------------------
BENCHMARKING INSTRUCTIONS

Research Papers Used for Benchmarking:
1) "An Algorithm for Detecting Brain Tumors in MRI Images"
2) "Brain Tumor Segmentation to Calculate Percentage Tumor Using MRI" 
3) "Efficient Detection of Brain Tumor from MRIs Using K-Means Segmentation and Normalized Histogram"
4) "Minimum Time Delat and More Efficient Image Filtering Brain tumor Detection with the help of MATLAB"


Files Used for Benchmarking:
1)
2)
3) convertMAT2JPG.m - converts .MAT type given by Image Segmenter when creating the binary masks to .JPG
.
.
.


Required Folders for Running ' .m':
1)
2)
3)
.
.
.


Instructions for Running ' .m':
1)
2)
3)
.
.
.


----------------------------------------------------------------------------------------------------------------------------------------------
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
	- MATLAB R2017b Desktop App had issues with "directory names", ie "1_photos"


----------------------------------------------------------------------------------------------------------------------------------------------
DATA AUGMENTATION INSTRUCTIONS

Files Used to Augment Images:
1)
2)
3)
.
.
.


Required Folders for Running '.m':
1)
2)
3)
.
.
.


Instructions for Running Augmentation Algorithm:
1)
2)
3)
.
.
.



**********************************************************************************************************************************************
PYTHON
----------------------------------------------------------------------------------------------------------------------------------------------
U-NET DESCRIPTION AND USE INSTRUCTIONS

Files Used for Python Neural Network:
1) predict_tumor.py
2) train_net.py
3) 
.
.
.

Required Python Libraries:
1) Keras
2) TensorFlow
3) 
.
.
.

Other Required Software:
1)
2)
3)
.
.
.

Instructions for Running U-Net:
1)
2)
3)
.
.
.

