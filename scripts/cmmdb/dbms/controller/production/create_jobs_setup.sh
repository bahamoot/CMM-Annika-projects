#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
project_name="production"
project_out_dir="$CMMDB_OUTPUT_DIR/SQLiteDB/$project_name"
#sample_info="$SAMPLES_LIST_DIR/Exome_OAF_familial_CRC.list"
#sample_info="/glob/jessada//private/master_data/CMM/family/processed/uppsala//uppsala_pats_all_members.lst.all"
project_code="b2016331"
job_alloc_time="8-00:00:00"
db_file="$project_out_dir/data_out/$project_name.db"
db_jobs="$script_dir/db.jobs"
jobs_setup_file=dbms_"$project_name"_jobs_setup.txt


cmd="pyCMM-dbms-create-job-setup-file"
cmd+=" -d $project_name"
cmd+=" -O $project_out_dir"
if [ ! -z $project_code ]
then
    cmd+=" -p $project_code"
fi
if [ ! -z $job_alloc_time ]
then
    cmd+=" --job_alloc_time $job_alloc_time"
fi
if [ ! -z $db_file ]
then
    cmd+=" --db_file $db_file"
fi
if [ ! -z $db_jobs ]
then
    cmd+=" --db_jobs $db_jobs"
fi
cmd+=" -o $jobs_setup_file"

eval "$cmd"
