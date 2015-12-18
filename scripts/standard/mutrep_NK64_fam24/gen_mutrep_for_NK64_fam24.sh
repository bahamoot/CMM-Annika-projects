#!/bin/bash -l
 
#SBATCH -A b2011158
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 3-00:00:00
#SBATCH -J mtr_mutrep_NK64_fam24

dataset_name="64_samples"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cmd="pyCMM-mutrep-mutation-reports"
cmd+=" -j $CMM_CLIENT/scripts/standard/mutrep_NK64_fam24/$dataset_name"_jobs_setup.txt
cmd+=" -l /proj/b2011117/private/projects/slurm_log/$dataset_name"
eval "$cmd"