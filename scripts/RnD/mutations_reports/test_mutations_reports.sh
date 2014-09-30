#!/bin/bash

project_name="RnD"
sub_project_name="mut_reps"

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
#export MUTATIONS_REPORTS_PROJECT_CODE="b2011097"
export MUTATIONS_REPORTS_TOTAL_RUN_TIME="3-00:00:00"
export MUTATIONS_REPORTS_RUNNING_KEY=$running_key
export MUTATIONS_REPORTS_TABIX_FILE=$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ
#export MUTATIONS_REPORTS_TABIX_FILE=$CMM_SCILIFE_ILLUMINA_ALL_PATIENTS_MANS_GZ
export MUTATIONS_REPORTS_ANNOVAR_ROOT_DIR=$ANNOVAR_ROOT_DIR
export MUTATIONS_REPORTS_PROJECT_OUT_DIR=$project_out_dir
export MUTATIONS_REPORTS_SLURM_LOG_DIR=$CMM_PROJECTS_SLURM_LOG_DIR

MUTATIONS_REPORTS_STAT_CONFIG="ALL,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,,PF#6"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CAFAM,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CAFAM,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CRC,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CRC,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-COLON,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_COLON,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-RECTAL,$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_RECTAL,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":SWEDES,$SWEDES_STAT,,PF"
export MUTATIONS_REPORTS_STAT_CONFIG

#cache_dir="$project_out_dir/cache/sanna"
#cache_dir="$project_out_dir/cache/9_98318926_105545483_2members"
#cache_dir="$project_out_dir/cache/9_104030000_104060000"
cache_dir="$project_out_dir/cache/9_98318926_105545483_all"
#cache_dir="$project_out_dir/cache/9_139360000_139410000"
#cache_dir="$project_out_dir/cache/fam242_big"
export MUTATIONS_REPORTS_CACHE_DIR="$cache_dir"

## vcf region from rs10124153 to rs7040414
#export MUTATIONS_REPORTS_TABIX_VCF_REGION="9:98318926-105545483"
export MUTATIONS_REPORTS_TABIX_VCF_REGION="9:139360000-139410000"
#export MUTATIONS_REPORTS_TABIX_VCF_REGION="9:104030000-104060000"
#export MUTATIONS_REPORTS_COL_NAMES="185-Co603,185-Co669,312-Co1116,350-1104-03D,350-Co866,650-398-05o,650-729-05o,1290-Co1723"
#export MUTATIONS_REPORTS_COL_NAMES="485-Co1302,485-Co1322,532-Co1583,532-Co1584,574-468-04,574-474-05,578-531-04o,578-Co1349,650-398-05o,650-729-05o,695-Co1354,695-Co1359,695-Co1368,739-529-05,739-Co1467,740-602-05o,740-Co1373,740-Co1383,849-Co1764,849-Co1765,869-Co1685,871-Co1618,871-Co1661,918-134-06,918-354-06,975-Co1591,975-Co1600,1025-Co1529,1085-Co1518,1113-642-06,1113-Co1538,1206-1052-05,1206-Co1552,1207-2818-07D,1213-Co1666,1252-Co1719,1290-Co1723"
#export MUTATIONS_REPORTS_COL_NAMES="1207-2818-07D,1213-Co1666"
export MUTATIONS_REPORTS_COL_NAMES="242-Co441,242-Co666,242-Co771"
#export MUTATIONS_REPORTS_FAMILIES_INFO="242:242-Co441:242-Co666:242-Co771"
#export MUTATIONS_REPORTS_COL_NAMES="1207-2818-07D,1213-Co1666"
#export MUTATIONS_REPORTS_FAMILIES_INFO="24:24-Co213:24-Co166"
#export MUTATIONS_REPORTS_FAMILIES_INFO="185:185-Co603:185-Co669"
#export MUTATIONS_REPORTS_CUSTOM_ZYGO_CODES="WT:."
#export MUTATIONS_REPORTS_FAMILIES_INFO="185:185-Co603:185-Co669,312:312-Co1116"
#export MUTATIONS_REPORTS_FAMILIES_INFO="185:185-Co603:185-Co669,312:312-Co1116,350:350-1104-03D:350-Co866,650:650-398-05o:650-729-05o,1290:1290-Co1723,68:68-Co218:68-Co258"

#export MUTATIONS_REPORTS_FREQUENCY_RATIOS="1000G:0.2"
export MUTATIONS_REPORTS_FREQUENCY_RATIOS="1000G:0.2,Daniel_DB:0.2"
export MUTATIONS_REPORTS_CELL_COLORS="SHARED:SILVER,HARMFUL:LIGHT_BLUE,HOM_SHARED:GRAY25"
#export MUTATIONS_REPORTS_CELL_COLORS="RARE:YELLOW,SHARED:SILVER,HARMFUL:LIGHT_BLUE,HOM_SHARED:GRAY40"
export MUTATIONS_REPORTS_EXTRA_ATTRIBUTES="has_shared,rare,study,cases_ge_ctrls,has_mutation"
#export MUTATIONS_REPORTS_EXCLUSION_CRITERIAS="C,S"

MUTATIONS_REPORTS_COLOR_REGION="24:8:LIME:9:98410000-98440000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:5:ROSY_BROWN:9:98890000-98970000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:2:LIME:9:104020000-104032400"
MUTATIONS_REPORTS_COLOR_REGION+=",24:5:ROSY_BROWN:9:104300000-104340000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:5:ROSY_BROWN:9:104376000-104396000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:5:ROSY_BROWN:9:104435000-104460000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:8:LIME:9:104730000-104780000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:8:LIME:9:104802800-104819600"
MUTATIONS_REPORTS_COLOR_REGION+=",24:5:ROSY_BROWN:9:104870000-104890000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:8:LIME:9:105108100-105203000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:4:ORANGE:9:104033649-104033650"
MUTATIONS_REPORTS_COLOR_REGION+=",24:6:ROSY_BROWN:9:104034500-104037000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:3:GREEN:9:105108100-105203000"
MUTATIONS_REPORTS_COLOR_REGION+=",24:4:GREEN:9:105108100-105203000"
export MUTATIONS_REPORTS_COLOR_REGION
export MUTATIONS_REPORTS_MODIFY_HEADER="ALL_PF:OAF,Uppsala-CAFAM:CAFAM,Uppsala-CRC:CRC,Uppsala-COLON:COLON,Uppsala-RECTAL:RECTAL,SWEDES_PF:Daniel_DB"

export MUTATIONS_REPORTS_DEVELOPER_MODE="On"
##********************************************* set parameters here *****************************************************

$EXEC_SCRIPT_GEN_MUTATIONS_REPORTS
