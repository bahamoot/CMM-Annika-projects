#!/bin/bash 
 
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cmd="pyCMM-plink-merge-hap-assocs"
cmd+=" -j $CMM_CLIENT/scripts/RnD/plink_hap_assocs/bin/plink_hap_assocs_jobs_setup.txt"
cmd+=" --hap_assoc_files $script_dir/../data/input1.assoc.hap,$script_dir/../data/input2.assoc.hap"
cmd+=" --out $script_dir/../data/merged_hap_assocs.txt"
#cmd+=" -r 18"
#cmd+=" -r 6:78171941-78172992,18:28610988-28611790"
#cmd+=" -o /proj/b2011117/private/projects/out/RnD/gen_mutation_reports/rpts/gen_mutation_reports_summary_custom.xlsx"
#cmd+=" -l /proj/b2011117/private/projects/out/RnD/gen_mutation_reports/18q_axq"
eval "$cmd"
