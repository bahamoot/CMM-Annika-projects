#!/bin/bash

project_name="chr9_lkg"
sub_project_name="all_uppsala"

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
#export MUTATIONS_REPORTS_PROJECT_CODE="b2011117"
export MUTATIONS_REPORTS_RUNNING_KEY=$running_key
export MUTATIONS_REPORTS_TABIX_FILE=$CMM_UPPSALA_58FAM_ALL_PATIENTS_GZ
export MUTATIONS_REPORTS_ANNOVAR_ROOT_DIR=$ANNOVAR_ROOT_DIR
export MUTATIONS_REPORTS_PROJECT_OUT_DIR=$project_out_dir
export MUTATIONS_REPORTS_SLURM_LOG_DIR=$CMM_PROJECTS_SLURM_LOG_DIR

MUTATIONS_REPORTS_STAT_CONFIG="ALL,,PF#6"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CAFAM,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CAFAM,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-CRC,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_CRC,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-COLON,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_COLON,PF-GF"
MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-RECTAL,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_RECTAL,PF-GF"
#MUTATIONS_REPORTS_STAT_CONFIG+=":Uppsala-NON-CAFAM,$CMM_PATIENT_LIST_UPPSALA_ALL_MEMBERS_NON_CAFAM,PF-GF"
export MUTATIONS_REPORTS_STAT_CONFIG

#cache_dir="$project_out_dir/cache/9_98318926_105545483"
#export MUTATIONS_REPORTS_CACHE_DIR="$cache_dir"

## vcf region from rs10124153 to rs7040414
export MUTATIONS_REPORTS_TABIX_VCF_REGION="9:98318926-105545483"
#export MUTATIONS_REPORTS_COL_NAMES="185-Co603,185-Co669,312-Co1116,350-1104-03D,350-Co866,650-398-05o,650-729-05o,1290-Co1723"
#export MUTATIONS_REPORTS_COL_NAMES="8-Co35,8-Co37,275-Co1262,275-Co618,350-Co866,350-1104-03D,478-Co1274,478-Co1207,740-Co1373,740-602-05o,740-Co1383,918-134-06,918-354-06"
#export MUTATIONS_REPORTS_FAMILIES_INFO="8:8-Co35:8-Co37,275:275-Co1262:275-Co618,350:350-866:350-1104-03D,478:478-Co1274:478-Co1207,740:740-1373:740-602-05o:740-1383,918:918-134-06:918-354-06"

export MUTATIONS_REPORTS_EXONIC_FILTERING="Off"
export MUTATIONS_REPORTS_MISSENSE_FILTERING="Off"
export MUTATIONS_REPORTS_DELETERIOUS_FILTERING="Off"
#export MUTATIONS_REPORTS_RARE_FILTERING="On"

export MUTATIONS_REPORTS_FREQUENCY_RATIOS="MAF:0.2"
export MUTATIONS_REPORTS_EXTRA_ATTRIBUTES="has_shared,rare"

MUTATIONS_REPORTS_COLOR_REGION="24:7:ROSY_BROWN:9:98478117-98516889"
MUTATIONS_REPORTS_COLOR_REGION+=",24:7:ROSY_BROWN:9:104033918-104068546"
MUTATIONS_REPORTS_COLOR_REGION+=",24:7:ROSY_BROWN:9:104734569-104765535"
MUTATIONS_REPORTS_COLOR_REGION+=",24:7:ROSY_BROWN:9:98923267-98936605"
MUTATIONS_REPORTS_COLOR_REGION+=",24:7:ROSY_BROWN:9:105137536-105167689"
MUTATIONS_REPORTS_COLOR_REGION+=",24:7:ROSY_BROWN:9:104878134-105009468"
MUTATIONS_REPORTS_COLOR_REGION+=",24:8:LIME:9:98488881-98488883"
MUTATIONS_REPORTS_COLOR_REGION+=",24:8:LIME:9:98515577-98515579"
MUTATIONS_REPORTS_COLOR_REGION+=",24:8:LIME:9:98928995-98928997"

#MUTATIONS_REPORTS_COLOR_REGION="24:7:LIME:9:98410000-98440000"
##MUTATIONS_REPORTS_COLOR_REGION+=",24:ROSY_BROWN:9:98890000-98970000"
#MUTATIONS_REPORTS_COLOR_REGION+=",24:7:LIME:9:104020000-104090000"
##MUTATIONS_REPORTS_COLOR_REGION+=",24:ROSY_BROWN:9:104300000-104340000"
##MUTATIONS_REPORTS_COLOR_REGION+=",24:ROSY_BROWN:9:104376000-104396000"
##MUTATIONS_REPORTS_COLOR_REGION+=",24:ROSY_BROWN:9:104435000-104460000"
#MUTATIONS_REPORTS_COLOR_REGION+=",24:7:LIME:9:104730000-104780000"
#MUTATIONS_REPORTS_COLOR_REGION+=",24:7:LIME:9:104802800-104819600"
##MUTATIONS_REPORTS_COLOR_REGION+=",24:ROSY_BROWN:9:104870000-104890000"
#MUTATIONS_REPORTS_COLOR_REGION+=",24:7:LIME:9:105108100-105203000"
##MUTATIONS_REPORTS_COLOR_REGION+=",8:ROSY_BROWN:9:98410000-98460000"
##MUTATIONS_REPORTS_COLOR_REGION+=",8:ROSY_BROWN:9:100468000-100525000"
##MUTATIONS_REPORTS_COLOR_REGION+=",8:ROSY_BROWN:9:102620000-102687100"
#MUTATIONS_REPORTS_COLOR_REGION+=",8:7:LIME:9:102710000-102830000"
#MUTATIONS_REPORTS_COLOR_REGION+=",8:7:LIME:9:102865000-103170000"
#MUTATIONS_REPORTS_COLOR_REGION+=",8:7:LIME:9:103969400-104125000"
##MUTATIONS_REPORTS_COLOR_REGION+=",8:ROSY_BROWN:9:104167000-104224000"
##MUTATIONS_REPORTS_COLOR_REGION+=",8:ROSY_BROWN:9:104780000-104814000"
##MUTATIONS_REPORTS_COLOR_REGION+=",8:ROSY_BROWN:9:105080000-105136000"
#MUTATIONS_REPORTS_COLOR_REGION+=",8:7:LIME:9:104730000-104762000"
#MUTATIONS_REPORTS_COLOR_REGION+=",275:7:LIME:9:98413000-98540000"
##MUTATIONS_REPORTS_COLOR_REGION+=",275:ROSY_BROWN:9:100468000-100530000"
##MUTATIONS_REPORTS_COLOR_REGION+=",275:ROSY_BROWN:9:101850000-101990000"
#MUTATIONS_REPORTS_COLOR_REGION+=",275:7:LIME:9:102740000-103095000"
##MUTATIONS_REPORTS_COLOR_REGION+=",275:ROSY_BROWN:9:103950000-104125000"
##MUTATIONS_REPORTS_COLOR_REGION+=",275:ROSY_BROWN:9:104220000-104280000"
#MUTATIONS_REPORTS_COLOR_REGION+=",275:7:LIME:9:104730000-104819700"
##MUTATIONS_REPORTS_COLOR_REGION+=",275:ROSY_BROWN:9:104870000-104890000"
##MUTATIONS_REPORTS_COLOR_REGION+=",275:ROSY_BROWN:9:105110000-105140000"
#MUTATIONS_REPORTS_COLOR_REGION+=",275:7:LIME:9:105425000-105520000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:98410000-98440000"
#MUTATIONS_REPORTS_COLOR_REGION+=",350:7:LIME:9:98467000-98550000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:100468000-100522000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:100573000-100610000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:100668000-100870000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:101250000-101320000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:101820000-101990000"
#MUTATIONS_REPORTS_COLOR_REGION+=",350:7:LIME:9:102596000-103170000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:103969700-104130000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:104309000-104340000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:104616000-104680000"
#MUTATIONS_REPORTS_COLOR_REGION+=",350:7:LIME:9:104730000-104761000"
#MUTATIONS_REPORTS_COLOR_REGION+=",350:7:LIME:9:104879000-105090000"
##MUTATIONS_REPORTS_COLOR_REGION+=",350:ROSY_BROWN:9:105430000-105490000"
#MUTATIONS_REPORTS_COLOR_REGION+=",478:7:LIME:9:98497700-98550000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:100500000-100618000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:100669000-100930000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:100940000-101213000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:101860000-101980000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:102740000-102830000"
#MUTATIONS_REPORTS_COLOR_REGION+=",478:7:LIME:9:103970000-104125000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:104237000-104433100"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:104437000-104460000"
##MUTATIONS_REPORTS_COLOR_REGION+=",478:ROSY_BROWN:9:104620000-104709000"
#MUTATIONS_REPORTS_COLOR_REGION+=",478:7:LIME:9:104730000-104780000"
#MUTATIONS_REPORTS_COLOR_REGION+=",478:7:LIME:9:104951000-105215000"
#MUTATIONS_REPORTS_COLOR_REGION+=",740:7:LIME:9:98414000-98520000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:99085000-99160000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:100467000-100506000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:100574000-100610000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:101820000-101990000"
#MUTATIONS_REPORTS_COLOR_REGION+=",740:7:LIME:9:102660000-103070000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:104430000-104460000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:104620000-104710000"
#MUTATIONS_REPORTS_COLOR_REGION+=",740:7:LIME:9:104730000-104780000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:104802800-104819600"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:104870000-104890000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:104959000-105001000"
##MUTATIONS_REPORTS_COLOR_REGION+=",740:ROSY_BROWN:9:105022000-105460000"
#MUTATIONS_REPORTS_COLOR_REGION+=",918:7:LIME:9:98470000-98510000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:98530000-98540000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:100468000-100522000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:100669000-100830000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:101177000-101220000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:101220001-101320000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:101720000-101760000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:102733000-103170000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:104275000-104300000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:104300001-104340000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:104430000-104460000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:104951000-105022000"
##MUTATIONS_REPORTS_COLOR_REGION+=",918:ROSY_BROWN:9:105080000-105136000"
export MUTATIONS_REPORTS_COLOR_REGION

export MUTATIONS_REPORTS_MODIFY_HEADER="ALL_PF:OAF,Uppsala-CAFAM:CAFAM,Uppsala-CRC:CRC,Uppsala-COLON:COLON,Uppsala-RECTAL:RECTAL"
export MUTATIONS_REPORTS_DEVELOPER_MODE="On"
##********************************************* set parameters here *****************************************************

$EXEC_SCRIPT_GEN_MUTATIONS_REPORTS
