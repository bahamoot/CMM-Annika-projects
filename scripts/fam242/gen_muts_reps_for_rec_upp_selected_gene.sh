#!/bin/bash

project_name="fam242"
sub_project_name="rec_upp_sel_gene"

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
export MUTATIONS_REPORTS_PROJECT_CODE="b2011097"
export MUTATIONS_REPORTS_TOTAL_RUN_TIME="3-00:00:00"
export MUTATIONS_REPORTS_RUNNING_KEY=$running_key
export MUTATIONS_REPORTS_TABIX_FILE=$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ
export MUTATIONS_REPORTS_ANNOVAR_ROOT_DIR=$ANNOVAR_ROOT_DIR
export MUTATIONS_REPORTS_PROJECT_OUT_DIR=$project_out_dir
export MUTATIONS_REPORTS_SLURM_LOG_DIR=$CMM_PROJECTS_SLURM_LOG_DIR

MUTATIONS_REPORTS_STAT_CONFIG="ALL,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,,PF#6"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CAFAM,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CAFAM,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CRC,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CRC,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-COLON,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_COLON,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-RECTAL,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_RECTAL,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":SWEDES,$SWEDES_STAT,,PF"
export MUTATIONS_REPORTS_STAT_CONFIG

export MUTATIONS_REPORTS_TABIX_VCF_REGION="3:137780831-137834661,3:142534763-142608045,3:151143171-151176497,3:151591430-151602408,9:107331448-107332412,9:111934255-112083245,9:139334547-139378212,9:139388895-139440315,12:10954130-10955227,22:30727976-30752937,22:30950621-30970575,22:38093010-38172564"
export MUTATIONS_REPORTS_COL_NAMES="$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_RECTAL"
#cache_dir="$project_out_dir/cache/"
#export MUTATIONS_REPORTS_CACHE_DIR="$cache_dir"

export MUTATIONS_REPORTS_FREQUENCY_RATIOS="1000G:0.2"
export MUTATIONS_REPORTS_EXTRA_ATTRIBUTES="has_shared,rare"
export MUTATIONS_REPORTS_EXCLUSION_CRITERIAS="I,C,S"
export MUTATIONS_REPORTS_CELL_COLORS="SHARED:SILVER,HARMFUL:LIGHT_BLUE,HOM_SHARED:GRAY25"

export MUTATIONS_REPORTS_MODIFY_HEADER="ALL_PF:OAF,Uppsala-ALL_PF:Uppsala_OAF,Uppsala-CAFAM:CAFAM,Uppsala-CRC:CRC,Uppsala-COLON:COLON,Uppsala-RECTAL:RECTAL,SWEDES_PF:Daniel_DB"
export MUTATIONS_REPORTS_DEVELOPER_MODE="On"
##********************************************* set parameters here *****************************************************

if [ ! -z "$MUTATIONS_REPORTS_PROJECT_CODE" ]; then
    export CMM_LIB_DIR="$CMM_LIB_ROOT_DIR/dev_serv/scripts"
else
    export CMM_LIB_DIR="$CMM_LIB_ROOT_DIR/dev_adhoc/scripts"
fi
export CMM_LIB_DIR="$CMM_LIB_ROOT_DIR/dev_serv/scripts"
$CMM_LIB_DIR/exec_script_gen_mutations_reports.sh
