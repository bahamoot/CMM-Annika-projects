#!/bin/bash

project_name="xiang"
sub_project_name="plink_chr21"

if [ ! -d "$CMM_PROJECTS_OUTPUT_DIR/$project_name" ]; then
    mkdir "$CMM_PROJECTS_OUTPUT_DIR/$project_name"
fi
if [ ! -z "$sub_project_name" ]; then
    project_out_dir="$CMM_PROJECTS_OUTPUT_DIR/$project_name/$sub_project_name"
    dataset_name="$project_name"_"$sub_project_name"
    if [ ! -d "$project_out_dir" ]; then
        mkdir "$project_out_dir"
    fi
else
    project_out_dir="$CMM_PROJECTS_OUTPUT_DIR/$project_name"
    dataset_name="$project_name"
fi


##********************************************* set parameters here *****************************************************
#export PLINK_REPORTS_PROJECT_CODE="b2011097"
export PLINK_REPORTS_RUNNING_KEY="$dataset_name"
export PLINK_REPORTS_PLINK_BIN_FILE_PREFIX="$CMM_GENOTYPING_UPPSALA_PROCESSED_PLINK_BIN_FILE_PREFIX"
export PLINK_REPORTS_PLINK_PHENO_FILE="$CMM_GENOTYPING_UPPSALA_BREAST_301CTRLS_WO_RELATIVES_PHENO"
export PLINK_REPORTS_FAMILIES_HAPLOTYPES_PLINK_TFILE_PREFIX="$CMM_HAPLOTYPE_CHR9_LKG_PLINK_FILE_PREFIX"
#export PLINK_REPORTS_TFAM_INDIVIDUAL_IDS="fam_8,fam_740,new_fam24_shared_only"
#export PLINK_REPORTS_TFAM_FAMILY_IDS="fam_8,fam_275,fam_478,fam_740,fam_350,fam_918,new_fam24_shared_only"
export PLINK_REPORTS_TFAM_FAMILY_IDS="740,24"
export PLINK_REPORTS_SPECIAL_FAMILIES_INFO="24:GOLD,740:LIME:MAGENTA"
export PLINK_REPORTS_PLINK_HAP_WINDOW_SIZES="1,3,5,10,20,50,100"
#export PLINK_REPORTS_PVALUE_SIGNIFICANCE_RATIO="1"
export PLINK_REPORTS_PVALUE_SIGNIFICANCE_RATIO="1e-08"
export PLINK_REPORTS_PROJECT_OUT_DIR=$project_out_dir
export PLINK_REPORTS_SLURM_LOG_DIR=$CMM_PROJECTS_SLURM_LOG_DIR

cache_dir="$project_out_dir/cache/"
##cache_dir="$project_out_dir/cache/9_100000000_105000000"
export PLINK_REPORTS_CACHE_DIR="$cache_dir"
export PLINK_REPORTS_USE_CACHED_PLINK_EXTRA_INFO="On"

#export PLINK_REPORTS_PLINK_REGION="9:104400000-104444000"
export PLINK_REPORTS_PLINK_REGION="21"
#export PLINK_REPORTS_PLINK_REGION="9:100000000-105000000"

PLINK_REPORTS_COLOR_REGION="24:DARK_SLATE_GRAY:9:98410000-98460000"
PLINK_REPORTS_COLOR_REGION+=",24:PLUM:9:103969400-104125000"
PLINK_REPORTS_COLOR_REGION+=",24:PLUM:9:104439369-104439370"
PLINK_REPORTS_COLOR_REGION+=",24:PLUM:9:100468000-100525000"
export PLINK_REPORTS_COLOR_REGION

PLINK_REPORTS_COLOR_REGION="24:DARK_SLATE_GRAY:9:98410000-98460000"
PLINK_REPORTS_COLOR_REGION+=",24:PLUM:9:103969400-104125000"
PLINK_REPORTS_COLOR_REGION+=",24:PLUM:9:104439369-104439370"
PLINK_REPORTS_COLOR_REGION+=",24:PLUM:9:100468000-100525000"
export PLINK_REPORTS_COLOR_REGION

export PLINK_REPORTS_DEVELOPER_MODE="On"
##********************************************* set parameters here *****************************************************

$EXEC_SCRIPT_GEN_PLINK_REPORTS