#!/bin/bash

project_name="sv"
sub_project_name="colon_all_patients"

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
export MUTATIONS_REPORTS_PROJECT_CODE="b2011117"
export MUTATIONS_REPORTS_TOTAL_RUN_TIME="2-00:00:00"
export MUTATIONS_REPORTS_RUNNING_KEY=$running_key
export MUTATIONS_REPORTS_TABIX_FILE=$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ
export MUTATIONS_REPORTS_ANNOVAR_ROOT_DIR=$ANNOVAR_ROOT_DIR
export MUTATIONS_REPORTS_PROJECT_OUT_DIR=$project_out_dir
export MUTATIONS_REPORTS_SLURM_LOG_DIR=$CMM_PROJECTS_SLURM_LOG_DIR

MUTATIONS_REPORTS_STAT_CONFIG=":Uppsala-ALL,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,,PF#6"
MUTATIONS_REPORTS_STAT_CONFIG+=":SWEDES,$SWEDES_STAT,,PF"
export MUTATIONS_REPORTS_STAT_CONFIG

export MUTATIONS_REPORTS_FREQUENCY_RATIOS="1000G:0.2"
export MUTATIONS_REPORTS_MODIFY_HEADER="Uppsala-ALL_PF:OAF,SWEDES_PF:Daniel_DB"
#cache_dir="$project_out_dir/cache/9_98318926_105545483"
#export MUTATIONS_REPORTS_CACHE_DIR="$cache_dir"

export MUTATIONS_REPORTS_TABIX_VCF_REGION="6:38004942-45000000"
export MUTATIONS_REPORTS_COL_NAMES="110-Co1301,110-1526-02D,301-Co1053,301-Co837,301-Co840,350-1104-03D,350-Co866"
#cache_dir="$project_dir/cache"
#export MUTATIONS_REPORTS_CACHE_DIR="$cache_dir"


export MUTATIONS_REPORTS_CELL_COLORS="SHARED:SILVER,HARMFUL:LIGHT_BLUE,HOM_SHARED:GRAY25"
export MUTATIONS_REPORTS_EXTRA_ATTRIBUTES="has_shared,rare,cases_ge_ctrls,has_mutation"
##********************************************* set parameters here *****************************************************

if [ ! -z "$MUTATIONS_REPORTS_PROJECT_CODE" ]; then
    export CMM_LIB_DIR="$CMM_LIB_ROOT_DIR/dev_serv/scripts"
else
    export CMM_LIB_DIR="$CMM_LIB_ROOT_DIR/dev_adhoc/scripts"
fi
$CMM_LIB_DIR/exec_script_gen_mutations_reports.sh
