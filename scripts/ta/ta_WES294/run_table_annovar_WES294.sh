script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cmd="pyCMM-cmmdb-table-annovar "
cmd+=" -j $script_dir/ta_WES294_jobs_setup.txt"
eval "$cmd"
