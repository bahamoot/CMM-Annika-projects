#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dataset_name="gen_family_report"
project_out_dir="/proj/b2011117/private/projects/out/RnD/$dataset_name"
vcf_tabix_file="/glob/jessada/private/master_data/CMM/CMM_Axeq_b2012247/Axeq_chr3_6_14_18.vcf.gz"
vcf_region="6"
project_code="b2012247"
annotated_vcf_tabix="/glob/jessada/private/master_data/CMM/table_annovar/Axeq_chr3_6_14_18/Axeq_chr3_6_14_18_annotated.vcf.gz"
call_detail="True"
sample_infos="$CMM_CLIENT/scripts/RnD/gen_family_report/gen_family_report.sample_infos"
#freq_ratios="ExAC_ALL:0.1"
jobs_setup_file="$dataset_name"_jobs_setup.txt


cmd="pyCMM-cmmdb-create-job-setup-file"
cmd+=" -d $dataset_name"
cmd+=" -O $project_out_dir"
cmd+=" -i $vcf_tabix_file"
cmd+=" -r $vcf_region"
if [ ! -z $project_code ]
then
    cmd+=" -p $project_code"
fi
if [ ! -z $annotated_vcf_tabix ]
then
    cmd+=" -A $annotated_vcf_tabix"
fi
if [ ! -z $report_regions ]
then
    cmd+=" -R $report_regions"
fi
if [ ! -z $sample_infos ]
then
    cmd+=" -s $sample_infos"
fi
if [ "$call_detail" == "True" ]
then
    cmd+=" --call_detail"
fi
if [ ! -z $freq_ratios ]
then
    cmd+=" -f $freq_ratios"
fi
if [ "$split_chrom" == "True" ]
then
    cmd+=" --split_chrom"
fi
if [ "$summary_families" == "True" ]
then
    cmd+=" --summary_families"
fi
if [ "$exclude_common" = "True" ]
then
    cmd+=" --exclude_common"
fi
cmd+=" -o $jobs_setup_file"

eval "$cmd"