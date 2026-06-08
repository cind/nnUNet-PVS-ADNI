# nnUNet-PVS-ADNI
This is an nnU-Net based model trained (n=50) and tested (n=10) on n=60 ADNI-3 3T T1 and co-registered FLAIR images, with equal distribution across diagnostic groups (CU: n=20, MCI: n=20, AD: n=20). Model will perform whole-brain segmentation.

If you use this model in your research, please cite the following paper: 
<pre>Tang S, Thropp P, Hausle I, Younes K and Tosun D. (2026) 
    Spatial coupling of enlarged perivascular spaces and white matter lesions across the Alzheimer's disease continuum. 
    Front. Neurosci. 20:1772024. doi: 10.3389/fnins.2026.1772024</pre>

# How to run this model

## 1. Preprocessing
Images used in training underwent ANTS non-local means denoising, followed by Freesurfer's recon-all preprocessing, which included motion correction, bias field correction, and intensity normalization. Output image used was the 'T1.mgz' file. More information about the images can be found in the publication above.

## 2. Model download and folder structuring
Please follow the instructions on downloading the nnU-Net model and following its folder structure: https://github.com/MIC-DKFZ/nnUNet/blob/master/documentation/getting-started/installation-and-setup.md
This model uses the nnUNetv2 version, so please follow instructions to download that one!

## 3. Model weights
Model weights can be downloaded here: https://drive.google.com/drive/folders/1JbD21oXlXpIVpF250ITSY0xt13yjnTaK?usp=drive_link

Weights can be placed in the nnU-Net `results` folder:
```text
nnUNet_results/
└── DatasetXXX_MyDataset
    ├── nnUNetTrainer__nnUNetPlans__3d_fullres
```
## 4. Running the model
Please follow the instruction on how to inference with nnU-Net models: https://github.com/MIC-DKFZ/nnUNet/blob/master/documentation/how-to/run-inference.md

An example script is provided in this repository under `inference_ex.sh`.

## 5. Problems?
If there are any issues with running this model, please contact xxx.
