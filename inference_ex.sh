#!/bin/bash

''' Here is an example inference script you can run, assuming you installed nnUNetv2 into a virtual environment'''

## useful to specify what GPUs are being used
export CUDA_VISIBLE_DEVICES=$SGE_GPU

## highly recommend to install nnunet into a virtual environment!
venv_path="/your/home/path/venv"
source "$venv_path/bin/activate"

## export folders following nnU-Net instructions
export nnUNet_raw="/your/home/path/nnUNet_PVS_ADNI_model/nnUNet_raw"
export nnUNet_preprocessed="/your/home/path/nnUNet_PVS_ADNI_model/nnUNet_preprocessed"
export nnUNet_results="/your/home/path/nnUNet_PVS_ADNI_model/nnUNet_results"

## if you download the model zip file, you can install it with this command:
#"$venv_path/bin/nnUNetv2_install_pretrained_model_from_zip" $home/model_weights/model_name

## run this to inference (change Dataset001_PVS to your dataset name)
"$venv_path/bin/nnUNetv2_predict" -i $nnUNet_raw/Dataset001_PVS/imagesTs -o $nnUNet_results -d 001 -f 0 1 2 3 4 -tr nnUNetTrainer -c 3d_fullres -p nnUNetPlans 

## postprocessing can be run on this model but is likely not necessary
# "$venv_path/bin/nnUNetv2_apply_postprocessing" -i $nnUNet_results -o $nnUNet_results/postprocessed -pp_pkl_file /your/home/path/nnUNet_PVS_ADNI_model/nnUNet_results/Dataset001_PVS/nnUNetTrainer__nnUNetPlans__3d_fullres/crossval_results_folds_0_1_2_3_4/postprocessing.pkl -np 8 -plans_json /your/home/path/nnUNet_PVS_ADNI_model/nnUNet_results/Dataset001_PVS/nnUNetTrainer__nnUNetPlans__3d_fullres/crossval_results_folds_0_1_2_3_4/plans.json
