#!/bin/bash

project_name="chr9_fam24"
sub_project_name="axq_3mems"

if [ ! -d "$CMM_PROJECTS_OUTPUT_DIR/$project_name" ]; then
    mkdir "$CMM_PROJECTS_OUTPUT_DIR/$project_name"
fi
if [ ! -z "$sub_project_name" ]; then
    project_out_dir="$CMM_PROJECTS_OUTPUT_DIR/$project_name/$sub_project_name"
    running_key="$project_name"_"$sub_project_name"
    if [ ! -d "$project_out_dir" ]; then
        mkdir "$project_out_dir"
    fi
else
    project_out_dir="$CMM_PROJECTS_OUTPUT_DIR/$project_name"
    running_key="$project_name"
fi


##********************************************* set parameters here *****************************************************
export MUTATIONS_REPORTS_PROJECT_CODE="b2012247"
export MUTATIONS_REPORTS_TOTAL_RUN_TIME="2-00:00:00"
export MUTATIONS_REPORTS_RUNNING_KEY=$running_key
export MUTATIONS_REPORTS_TABIX_FILE=$CMM_AXEQ_CHR9_ALL_PATIENTS_GZ
export MUTATIONS_REPORTS_ANNOVAR_ROOT_DIR=$ANNOVAR_ROOT_DIR
export MUTATIONS_REPORTS_PROJECT_OUT_DIR=$project_out_dir
export MUTATIONS_REPORTS_SLURM_LOG_DIR=$CMM_PROJECTS_SLURM_LOG_DIR

MUTATIONS_REPORTS_STAT_CONFIG="ALL,$CMM_AXEQ_CHR9_ALL_PATIENTS_GZ,,PF#6"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CAFAM,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CAFAM,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CRC,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CRC,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-COLON,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_COLON,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-RECTAL,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_RECTAL,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":SWEDES,$SWEDES_STAT,,PF"
export MUTATIONS_REPORTS_STAT_CONFIG

#cache_dir="$project_out_dir/cache/9_98318926_105545483"
#export MUTATIONS_REPORTS_CACHE_DIR="$cache_dir"

## vcf region from rs10124153 to rs7040414
export MUTATIONS_REPORTS_TABIX_VCF_REGION="9:98318926-105545483"
export MUTATIONS_REPORTS_COL_NAMES="24-Co213,24-Co166,24-Co648"
export MUTATIONS_REPORTS_FAMILIES_INFO="24:24-Co213:24-Co166:24-Co648"

export MUTATIONS_REPORTS_FREQUENCY_RATIOS="MAF:0.2"
export MUTATIONS_REPORTS_EXTRA_ATTRIBUTES="has_shared,rare"

MUTATIONS_REPORTS_COLOR_REGION="24:LIME:9:98478117-98516889"
MUTATIONS_REPORTS_COLOR_REGION+=",24:LIME:9:104033918-104068546"
MUTATIONS_REPORTS_COLOR_REGION+=",24:LIME:9:104734569-104765535"
MUTATIONS_REPORTS_COLOR_REGION+=",24:LIME:9:98923267-98936605"
MUTATIONS_REPORTS_COLOR_REGION+=",24:LIME:9:105137536-105167689"
MUTATIONS_REPORTS_COLOR_REGION+=",24:LIME:9:104878134-105009468"
export MUTATIONS_REPORTS_COLOR_REGION

export MUTATIONS_REPORTS_MODIFY_HEADER="ALL_PF:OAF,Uppsala-CAFAM:CAFAM,Uppsala-CRC:CRC,Uppsala-COLON:COLON,Uppsala-RECTAL:RECTAL,SWEDES_PF:Daniel_DB"
export MUTATIONS_REPORTS_DEVELOPER_MODE="On"
##********************************************* set parameters here *****************************************************

$EXEC_SCRIPT_GEN_MUTATIONS_REPORTS
