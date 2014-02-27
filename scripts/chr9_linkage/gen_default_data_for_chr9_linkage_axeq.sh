#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ~/.bashrc

project_code="b2012247"
dataset_name="chr9_linkage_axeq"
tabix_file=$CMM_AXEQ_CHR9_ALL_PATIENTS_GZ
working_dir=$CMM_PROJECTS_WORKING_DIR

project_name="chr9_linkage"
sub_project_name="axeq"

vcf_region="9:92298000-105323000"
col_names="24-Co166,24-Co213,24-Co648,8-Co37,275-Co618,478-Co1274,296-Co876"

if [ ! -d "$CMM_PROJECTS_OUTPUT_DIR/$project_name" ]; then
    mkdir "$CMM_PROJECTS_OUTPUT_DIR/$project_name"
fi
if [ ! -z "$sub_project_name" ]; then
    out_dir="$CMM_PROJECTS_OUTPUT_DIR/$project_name/$sub_project_name"
    if [ ! -d "$out_dir" ]; then
        mkdir "$out_dir"
    fi
else
    out_dir="$CMM_PROJECTS_OUTPUT_DIR/$project_name"
fi

oaf_out_file=$out_dir/$dataset_name.oaf
gt_vcf_gt_out_file=$out_dir/$dataset_name.gt.vgt
mt_vcf_gt_out_file=$out_dir/$dataset_name.mt.vgt
sa_out_file=$out_dir/$dataset_name.sa

cmd="$SCRIPT_GEN_DEFAULT_DATA -p $project_code -N $dataset_name -t $tabix_file -w $working_dir"
if [ ! -z "$oaf_out_file" ]; then
    cmd+=" -O $oaf_out_file"
fi
if [ ! -z "$gt_vcf_gt_out_file" ]; then
    cmd+=" -G $gt_vcf_gt_out_file"
fi
if [ ! -z "$mt_vcf_gt_out_file" ]; then
    cmd+=" -M $mt_vcf_gt_out_file"
fi
if [ ! -z "$sa_out_file" ]; then
    cmd+=" -S $sa_out_file"
fi
if [ ! -z "$vcf_region" ]; then
    cmd+=" -R $vcf_region"
fi
if [ ! -z "$col_names" ]; then
    cmd+=" -c $col_names"
fi
eval $cmd

