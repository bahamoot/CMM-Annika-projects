#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dataset_name="TYRCA"
project_out_dir="$MUTATIONS_REPORTS_OUTPUT_DIR/TYRCA/debug"
#project_code="b2016200"
annotated_vcf_tabix="$ANNOTATED_TYRCA"
sample_infos="$script_dir/sample.info"
coloring_zygosity="True"
anno_cols="Func.refGene"
anno_cols+=",ExonicFunc.refGene"
anno_cols+=",snp138"
anno_cols+=",Gene.refGene"
anno_cols+=",GeneDetail.refGene"
anno_cols+=",AAChange.refGene"
anno_cols+=",cytoBand"
anno_cols+=",SWEGEN_AF"
anno_cols+=",ExAC_ALL"
anno_cols+=",ExAC_NFE"
anno_cols+=",ExAC_AFR"
anno_cols+=",ExAC_AMR"
anno_cols+=",ExAC_EAS"
anno_cols+=",ExAC_FIN"
anno_cols+=",ExAC_SAS"
anno_cols+=",ExAC_OTH"
anno_cols+=",249_SWEDES"
anno_cols+=",200_DANES"
anno_cols+=",1000g2014oct_all"
anno_cols+=",1000g2014oct_eur"
anno_cols+=",InterVar_class"
anno_cols+=",InterVar_evidence"
anno_cols+=",OAF_EARLYONSET_AF"
anno_cols+=",OAF_EARLYONSET_GF"
anno_cols+=",OAF_BRCS_AF"
anno_cols+=",OAF_BRCS_GF"
anno_cols+=",OAF_FAMILIAL_CRCS_AF"
anno_cols+=",OAF_FAMILIAL_CRCS_GF"
anno_cols+=",OAF_BRC_CRC_PROSTATE_AF"
anno_cols+=",OAF_BRC_CRC_PROSTATE_GF"
anno_cols+=",OAF_CHEK2_AF"
anno_cols+=",OAF_CHEK2_GF"
anno_cols+=",SWEGEN_HET"
anno_cols+=",SWEGEN_HOM"
anno_cols+=",SWEGEN_HEMI"
anno_cols+=",SWEGEN_AC"
anno_cols+=",SWEGEN_GT"
anno_cols+=",SWEGEN_GF"
anno_cols+=",SWEGEN_PF"
anno_cols+=",EXAC03_CONSTRAINT_EXP_SYN"
anno_cols+=",EXAC03_CONSTRAINT_N_SYN"
anno_cols+=",EXAC03_CONSTRAINT_SYN_Z"
anno_cols+=",EXAC03_CONSTRAINT_EXP_MIS"
anno_cols+=",EXAC03_CONSTRAINT_N_MIS"
anno_cols+=",EXAC03_CONSTRAINT_MIS_Z"
anno_cols+=",EXAC03_CONSTRAINT_EXP_LOF"
anno_cols+=",EXAC03_CONSTRAINT_N_LOF"
anno_cols+=",EXAC03_CONSTRAINT_PLI"
anno_cols+=",cosmic70"
anno_cols+=",clinvar_20150330"
anno_cols+=",dpsi_zscore"
anno_cols+=",SIFT_pred"
anno_cols+=",Polyphen2_HDIV_pred"
anno_cols+=",Polyphen2_HVAR_pred"
anno_cols+=",LRT_pred"
anno_cols+=",MutationTaster_pred"
anno_cols+=",MutationAssessor_pred"
anno_cols+=",FATHMM_pred"
anno_cols+=",RadialSVM_pred"
anno_cols+=",LR_pred"
anno_cols+=",CADD_phred"
#anno_excl_tags="Mutstat_details"
#anno_excl_tags+=",ExAC_Other"
#anno_excl_tags+=",Unknown"
report_regions="17:11778445-11778445"
report_regions+=",17:17009561-17069561"
#filter_actions="Rare"
#filter_actions+=",PASS-VQSR"
filter_actions="PASS-VQSR"
filter_actions+=",Non-Intergenic"
filter_actions+=",Non-Intronic"
filter_actions+=",Non-Upstream"
filter_actions+=",Non-Downstream"
filter_actions+=",Non-UTR"
freq_ratios="SWEGEN_AF:0.1"
expression_patterns="'Func_ncRNA_exonic:(\"Func.refGene\"=='\''ncRNA_exonic'\'')'"
expression_usages="Func_ncRNA_exonic:DELETE_ROW"
expression_patterns+=",'Func_ncRNA_splicing:(\"Func.refGene\"=='\''ncRNA_splicing'\'')'"
expression_usages+=",Func_ncRNA_splicing:DELETE_ROW"
expression_patterns+=",'ExonicFunc_unknown:(\"ExonicFunc.refGene\"=='\''unknown'\'')'"
expression_usages+=",ExonicFunc_unknown:DELETE_ROW"
#expression_patterns="'EARLYONSET_0:(\"OAF_EARLYONSET_AF\"=='\''0.0000'\'')'"
#expression_usages="EARLYONSET_0:DELETE_ROW"
#expression_patterns+=",'EARLYONSET_1:(\"OAF_EARLYONSET_AF\"=='\''1.0000'\'')'"
#expression_usages+=",EARLYONSET_1:DELETE_ROW"
#expression_patterns+=",'EARLYONSET_NA:(\"OAF_EARLYONSET_AF\"=='\''NA'\'')'"
#expression_usages+=",EARLYONSET_NA:DELETE_ROW"
#expression_patterns+=",'EARLYONSET_dot:(\"OAF_EARLYONSET_AF\"=='\''.'\'')'"
#expression_usages+=",EARLYONSET_dot:DELETE_ROW"
#expression_patterns+=",'EARLYONSET_empty:(\"OAF_EARLYONSET_AF\"=='\'''\'')'"
#expression_usages+=",EARLYONSET_empty:DELETE_ROW"
expression_patterns+=",'SWEGEN_AF_COMMON:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")<=0.9)and"
expression_patterns+="(float(\"SWEGEN_AF\")>=0.1)'"
expression_usages+=",SWEGEN_AF_COMMON:DELETE_ROW"
expression_patterns+=",'SWEGEN_AF_03:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")<0.03)'"
expression_usages+=",SWEGEN_AF_03:COLOR_COLUMN:SWEGEN_AF:XLS_YELLOW"
expression_patterns+=",'SWEGEN_AF_97:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")>0.97)'"
expression_usages+=",SWEGEN_AF_97:COLOR_COLUMN:SWEGEN_AF:XLS_YELLOW"
expression_patterns+=",'SWEGEN_AF_01:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")<0.01)'"
expression_usages+=",SWEGEN_AF_01:COLOR_COLUMN:SWEGEN_AF:XLS_ORANGE"
expression_patterns+=",'SWEGEN_AF_99:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")>0.99)'"
expression_usages+=",SWEGEN_AF_99:COLOR_COLUMN:SWEGEN_AF:XLS_ORANGE"
expression_patterns+=",'SWEGEN_AF_001:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")<0.001)'"
expression_usages+=",SWEGEN_AF_001:COLOR_COLUMN:SWEGEN_AF:XLS_GREEN"
expression_patterns+=",'SWEGEN_AF_999:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")>0.999)'"
expression_usages+=",SWEGEN_AF_999:COLOR_COLUMN:SWEGEN_AF:XLS_GREEN"
expression_patterns+=",'SWEGEN_AF_empty:(\"SWEGEN_AF\"=='\'''\'')'"
expression_usages+=",SWEGEN_AF_empty:COLOR_COLUMN:SWEGEN_AF:XLS_GREEN"
expression_patterns+=",'ExAC_ALL_COMMON:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")<=0.9)and"
expression_patterns+="(float(\"ExAC_ALL\")>=0.1)'"
expression_usages+=",ExAC_ALL_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_ALL_03:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")<0.03)'"
expression_usages+=",ExAC_ALL_03:COLOR_COLUMN:ExAC_ALL:XLS_YELLOW"
expression_patterns+=",'ExAC_ALL_97:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")>0.97)'"
expression_usages+=",ExAC_ALL_97:COLOR_COLUMN:ExAC_ALL:XLS_YELLOW"
expression_patterns+=",'ExAC_ALL_01:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")<0.01)'"
expression_usages+=",ExAC_ALL_01:COLOR_COLUMN:ExAC_ALL:XLS_ORANGE"
expression_patterns+=",'ExAC_ALL_99:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")>0.99)'"
expression_usages+=",ExAC_ALL_99:COLOR_COLUMN:ExAC_ALL:XLS_ORANGE"
expression_patterns+=",'ExAC_ALL_001:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")<0.001)'"
expression_usages+=",ExAC_ALL_001:COLOR_COLUMN:ExAC_ALL:XLS_GREEN"
expression_patterns+=",'ExAC_ALL_999:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")>0.999)'"
expression_usages+=",ExAC_ALL_999:COLOR_COLUMN:ExAC_ALL:XLS_GREEN"
expression_patterns+=",'ExAC_ALL_empty:(\"ExAC_ALL\"=='\'''\'')'"
expression_usages+=",ExAC_ALL_empty:COLOR_COLUMN:ExAC_ALL:XLS_GREEN"
expression_patterns+=",'ExAC_NFE_COMMON:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")<=0.9)and"
expression_patterns+="(float(\"ExAC_NFE\")>=0.1)'"
expression_usages+=",ExAC_NFE_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_NFE_03:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")<0.03)'"
expression_usages+=",ExAC_NFE_03:COLOR_COLUMN:ExAC_NFE:XLS_YELLOW"
expression_patterns+=",'ExAC_NFE_97:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")>0.97)'"
expression_usages+=",ExAC_NFE_97:COLOR_COLUMN:ExAC_NFE:XLS_YELLOW"
expression_patterns+=",'ExAC_NFE_01:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")<0.01)'"
expression_usages+=",ExAC_NFE_01:COLOR_COLUMN:ExAC_NFE:XLS_ORANGE"
expression_patterns+=",'ExAC_NFE_99:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")>0.99)'"
expression_usages+=",ExAC_NFE_99:COLOR_COLUMN:ExAC_NFE:XLS_ORANGE"
expression_patterns+=",'ExAC_NFE_001:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")<0.001)'"
expression_usages+=",ExAC_NFE_001:COLOR_COLUMN:ExAC_NFE:XLS_GREEN"
expression_patterns+=",'ExAC_NFE_999:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")>0.999)'"
expression_usages+=",ExAC_NFE_999:COLOR_COLUMN:ExAC_NFE:XLS_GREEN"
expression_patterns+=",'ExAC_NFE_empty:(\"ExAC_NFE\"=='\'''\'')'"
expression_usages+=",ExAC_NFE_empty:COLOR_COLUMN:ExAC_NFE:XLS_GREEN"
expression_patterns+=",'ExAC_AFR_COMMON:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")<=0.9)and"
expression_patterns+="(float(\"ExAC_AFR\")>=0.1)'"
expression_usages+=",ExAC_AFR_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_AFR_03:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")<0.03)'"
expression_usages+=",ExAC_AFR_03:COLOR_COLUMN:ExAC_AFR:XLS_YELLOW"
expression_patterns+=",'ExAC_AFR_97:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")>0.97)'"
expression_usages+=",ExAC_AFR_97:COLOR_COLUMN:ExAC_AFR:XLS_YELLOW"
expression_patterns+=",'ExAC_AFR_01:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")<0.01)'"
expression_usages+=",ExAC_AFR_01:COLOR_COLUMN:ExAC_AFR:XLS_ORANGE"
expression_patterns+=",'ExAC_AFR_99:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")>0.99)'"
expression_usages+=",ExAC_AFR_99:COLOR_COLUMN:ExAC_AFR:XLS_ORANGE"
expression_patterns+=",'ExAC_AFR_001:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")<0.001)'"
expression_usages+=",ExAC_AFR_001:COLOR_COLUMN:ExAC_AFR:XLS_GREEN"
expression_patterns+=",'ExAC_AFR_999:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")>0.999)'"
expression_usages+=",ExAC_AFR_999:COLOR_COLUMN:ExAC_AFR:XLS_GREEN"
expression_patterns+=",'ExAC_AFR_empty:(\"ExAC_AFR\"=='\'''\'')'"
expression_usages+=",ExAC_AFR_empty:COLOR_COLUMN:ExAC_AFR:XLS_GREEN"
expression_patterns+=",'ExAC_AMR_COMMON:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")<=0.9)and"
expression_patterns+="(float(\"ExAC_AMR\")>=0.1)'"
expression_usages+=",ExAC_AMR_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_AMR_03:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")<0.03)'"
expression_usages+=",ExAC_AMR_03:COLOR_COLUMN:ExAC_AMR:XLS_YELLOW"
expression_patterns+=",'ExAC_AMR_97:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")>0.97)'"
expression_usages+=",ExAC_AMR_97:COLOR_COLUMN:ExAC_AMR:XLS_YELLOW"
expression_patterns+=",'ExAC_AMR_01:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")<0.01)'"
expression_usages+=",ExAC_AMR_01:COLOR_COLUMN:ExAC_AMR:XLS_ORANGE"
expression_patterns+=",'ExAC_AMR_99:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")>0.99)'"
expression_usages+=",ExAC_AMR_99:COLOR_COLUMN:ExAC_AMR:XLS_ORANGE"
expression_patterns+=",'ExAC_AMR_001:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")<0.001)'"
expression_usages+=",ExAC_AMR_001:COLOR_COLUMN:ExAC_AMR:XLS_GREEN"
expression_patterns+=",'ExAC_AMR_999:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")>0.999)'"
expression_usages+=",ExAC_AMR_999:COLOR_COLUMN:ExAC_AMR:XLS_GREEN"
expression_patterns+=",'ExAC_AMR_empty:(\"ExAC_AMR\"=='\'''\'')'"
expression_usages+=",ExAC_AMR_empty:COLOR_COLUMN:ExAC_AMR:XLS_GREEN"
expression_patterns+=",'ExAC_EAS_COMMON:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")<=0.9)and"
expression_patterns+="(float(\"ExAC_EAS\")>=0.1)'"
expression_usages+=",ExAC_EAS_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_EAS_03:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")<0.03)'"
expression_usages+=",ExAC_EAS_03:COLOR_COLUMN:ExAC_EAS:XLS_YELLOW"
expression_patterns+=",'ExAC_EAS_97:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")>0.97)'"
expression_usages+=",ExAC_EAS_97:COLOR_COLUMN:ExAC_EAS:XLS_YELLOW"
expression_patterns+=",'ExAC_EAS_01:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")<0.01)'"
expression_usages+=",ExAC_EAS_01:COLOR_COLUMN:ExAC_EAS:XLS_ORANGE"
expression_patterns+=",'ExAC_EAS_99:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")>0.99)'"
expression_usages+=",ExAC_EAS_99:COLOR_COLUMN:ExAC_EAS:XLS_ORANGE"
expression_patterns+=",'ExAC_EAS_001:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")<0.001)'"
expression_usages+=",ExAC_EAS_001:COLOR_COLUMN:ExAC_EAS:XLS_GREEN"
expression_patterns+=",'ExAC_EAS_999:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")>0.999)'"
expression_usages+=",ExAC_EAS_999:COLOR_COLUMN:ExAC_EAS:XLS_GREEN"
expression_patterns+=",'ExAC_EAS_empty:(\"ExAC_EAS\"=='\'''\'')'"
expression_usages+=",ExAC_EAS_empty:COLOR_COLUMN:ExAC_EAS:XLS_GREEN"
expression_patterns+=",'ExAC_FIN_COMMON:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")<=0.9)and"
expression_patterns+="(float(\"ExAC_FIN\")>=0.1)'"
expression_usages+=",ExAC_FIN_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_FIN_03:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")<0.03)'"
expression_usages+=",ExAC_FIN_03:COLOR_COLUMN:ExAC_FIN:XLS_YELLOW"
expression_patterns+=",'ExAC_FIN_97:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")>0.97)'"
expression_usages+=",ExAC_FIN_97:COLOR_COLUMN:ExAC_FIN:XLS_YELLOW"
expression_patterns+=",'ExAC_FIN_01:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")<0.01)'"
expression_usages+=",ExAC_FIN_01:COLOR_COLUMN:ExAC_FIN:XLS_ORANGE"
expression_patterns+=",'ExAC_FIN_99:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")>0.99)'"
expression_usages+=",ExAC_FIN_99:COLOR_COLUMN:ExAC_FIN:XLS_ORANGE"
expression_patterns+=",'ExAC_FIN_001:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")<0.001)'"
expression_usages+=",ExAC_FIN_001:COLOR_COLUMN:ExAC_FIN:XLS_GREEN"
expression_patterns+=",'ExAC_FIN_999:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")>0.999)'"
expression_usages+=",ExAC_FIN_999:COLOR_COLUMN:ExAC_FIN:XLS_GREEN"
expression_patterns+=",'ExAC_FIN_empty:(\"ExAC_FIN\"=='\'''\'')'"
expression_usages+=",ExAC_FIN_empty:COLOR_COLUMN:ExAC_FIN:XLS_GREEN"
expression_patterns+=",'ExAC_SAS_COMMON:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")<=0.9)and"
expression_patterns+="(float(\"ExAC_SAS\")>=0.1)'"
expression_usages+=",ExAC_SAS_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_SAS_03:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")<0.03)'"
expression_usages+=",ExAC_SAS_03:COLOR_COLUMN:ExAC_SAS:XLS_YELLOW"
expression_patterns+=",'ExAC_SAS_97:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")>0.97)'"
expression_usages+=",ExAC_SAS_97:COLOR_COLUMN:ExAC_SAS:XLS_YELLOW"
expression_patterns+=",'ExAC_SAS_01:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")<0.01)'"
expression_usages+=",ExAC_SAS_01:COLOR_COLUMN:ExAC_SAS:XLS_ORANGE"
expression_patterns+=",'ExAC_SAS_99:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")>0.99)'"
expression_usages+=",ExAC_SAS_99:COLOR_COLUMN:ExAC_SAS:XLS_ORANGE"
expression_patterns+=",'ExAC_SAS_001:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")<0.001)'"
expression_usages+=",ExAC_SAS_001:COLOR_COLUMN:ExAC_SAS:XLS_GREEN"
expression_patterns+=",'ExAC_SAS_999:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")>0.999)'"
expression_usages+=",ExAC_SAS_999:COLOR_COLUMN:ExAC_SAS:XLS_GREEN"
expression_patterns+=",'ExAC_SAS_empty:(\"ExAC_SAS\"=='\'''\'')'"
expression_usages+=",ExAC_SAS_empty:COLOR_COLUMN:ExAC_SAS:XLS_GREEN"
expression_patterns+=",'ExAC_OTH_COMMON:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")<=0.9)and"
expression_patterns+="(float(\"ExAC_OTH\")>=0.1)'"
expression_usages+=",ExAC_OTH_COMMON:DELETE_ROW"
expression_patterns+=",'ExAC_OTH_03:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")<0.03)'"
expression_usages+=",ExAC_OTH_03:COLOR_COLUMN:ExAC_OTH:XLS_YELLOW"
expression_patterns+=",'ExAC_OTH_97:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")>0.97)'"
expression_usages+=",ExAC_OTH_97:COLOR_COLUMN:ExAC_OTH:XLS_YELLOW"
expression_patterns+=",'ExAC_OTH_01:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")<0.01)'"
expression_usages+=",ExAC_OTH_01:COLOR_COLUMN:ExAC_OTH:XLS_ORANGE"
expression_patterns+=",'ExAC_OTH_99:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")>0.99)'"
expression_usages+=",ExAC_OTH_99:COLOR_COLUMN:ExAC_OTH:XLS_ORANGE"
expression_patterns+=",'ExAC_OTH_001:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")<0.001)'"
expression_usages+=",ExAC_OTH_001:COLOR_COLUMN:ExAC_OTH:XLS_GREEN"
expression_patterns+=",'ExAC_OTH_999:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")>0.999)'"
expression_usages+=",ExAC_OTH_999:COLOR_COLUMN:ExAC_OTH:XLS_GREEN"
expression_patterns+=",'ExAC_OTH_empty:(\"ExAC_OTH\"=='\'''\'')'"
expression_usages+=",ExAC_OTH_empty:COLOR_COLUMN:ExAC_OTH:XLS_GREEN"
expression_patterns+=",'249_SWEDES_COMMON:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")<=0.9)and"
expression_patterns+="(float(\"249_SWEDES\")>=0.1)'"
expression_usages+=",249_SWEDES_COMMON:DELETE_ROW"
expression_patterns+=",'249_SWEDES_03:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")<0.03)'"
expression_usages+=",249_SWEDES_03:COLOR_COLUMN:249_SWEDES:XLS_YELLOW"
expression_patterns+=",'249_SWEDES_97:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")>0.97)'"
expression_usages+=",249_SWEDES_97:COLOR_COLUMN:249_SWEDES:XLS_YELLOW"
expression_patterns+=",'249_SWEDES_01:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")<0.01)'"
expression_usages+=",249_SWEDES_01:COLOR_COLUMN:249_SWEDES:XLS_ORANGE"
expression_patterns+=",'249_SWEDES_99:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")>0.99)'"
expression_usages+=",249_SWEDES_99:COLOR_COLUMN:249_SWEDES:XLS_ORANGE"
expression_patterns+=",'249_SWEDES_001:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")<0.001)'"
expression_usages+=",249_SWEDES_001:COLOR_COLUMN:249_SWEDES:XLS_GREEN"
expression_patterns+=",'249_SWEDES_999:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")>0.999)'"
expression_usages+=",249_SWEDES_999:COLOR_COLUMN:249_SWEDES:XLS_GREEN"
expression_patterns+=",'249_SWEDES_empty:(\"249_SWEDES\"=='\'''\'')'"
expression_usages+=",249_SWEDES_empty:COLOR_COLUMN:249_SWEDES:XLS_GREEN"
expression_patterns+=",'200_DANES_COMMON:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")<=0.9)and"
expression_patterns+="(float(\"200_DANES\")>=0.1)'"
expression_usages+=",200_DANES_COMMON:DELETE_ROW"
expression_patterns+=",'200_DANES_03:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")<0.03)'"
expression_usages+=",200_DANES_03:COLOR_COLUMN:200_DANES:XLS_YELLOW"
expression_patterns+=",'200_DANES_97:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")>0.97)'"
expression_usages+=",200_DANES_97:COLOR_COLUMN:200_DANES:XLS_YELLOW"
expression_patterns+=",'200_DANES_01:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")<0.01)'"
expression_usages+=",200_DANES_01:COLOR_COLUMN:200_DANES:XLS_ORANGE"
expression_patterns+=",'200_DANES_99:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")>0.99)'"
expression_usages+=",200_DANES_99:COLOR_COLUMN:200_DANES:XLS_ORANGE"
expression_patterns+=",'200_DANES_001:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")<0.001)'"
expression_usages+=",200_DANES_001:COLOR_COLUMN:200_DANES:XLS_GREEN"
expression_patterns+=",'200_DANES_999:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")>0.999)'"
expression_usages+=",200_DANES_999:COLOR_COLUMN:200_DANES:XLS_GREEN"
expression_patterns+=",'200_DANES_empty:(\"200_DANES\"=='\'''\'')'"
expression_usages+=",200_DANES_empty:COLOR_COLUMN:200_DANES:XLS_GREEN"
expression_patterns+=",'1000g2014oct_all_COMMON:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")<=0.9)and"
expression_patterns+="(float(\"1000g2014oct_all\")>=0.1)'"
expression_usages+=",1000g2014oct_all_COMMON:DELETE_ROW"
expression_patterns+=",'1000g2014oct_all_03:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")<0.03)'"
expression_usages+=",1000g2014oct_all_03:COLOR_COLUMN:1000g2014oct_all:XLS_YELLOW"
expression_patterns+=",'1000g2014oct_all_97:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")>0.97)'"
expression_usages+=",1000g2014oct_all_97:COLOR_COLUMN:1000g2014oct_all:XLS_YELLOW"
expression_patterns+=",'1000g2014oct_all_01:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")<0.01)'"
expression_usages+=",1000g2014oct_all_01:COLOR_COLUMN:1000g2014oct_all:XLS_ORANGE"
expression_patterns+=",'1000g2014oct_all_99:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")>0.99)'"
expression_usages+=",1000g2014oct_all_99:COLOR_COLUMN:1000g2014oct_all:XLS_ORANGE"
expression_patterns+=",'1000g2014oct_all_001:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")<0.001)'"
expression_usages+=",1000g2014oct_all_001:COLOR_COLUMN:1000g2014oct_all:XLS_GREEN"
expression_patterns+=",'1000g2014oct_all_999:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")>0.999)'"
expression_usages+=",1000g2014oct_all_999:COLOR_COLUMN:1000g2014oct_all:XLS_GREEN"
expression_patterns+=",'1000g2014oct_all_empty:(\"1000g2014oct_all\"=='\'''\'')'"
expression_usages+=",1000g2014oct_all_empty:COLOR_COLUMN:1000g2014oct_all:XLS_GREEN"
expression_patterns+=",'1000g2014oct_eur_COMMON:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")<=0.9)and"
expression_patterns+="(float(\"1000g2014oct_eur\")>=0.1)'"
expression_usages+=",1000g2014oct_eur_COMMON:DELETE_ROW"
expression_patterns+=",'1000g2014oct_eur_03:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")<0.03)'"
expression_usages+=",1000g2014oct_eur_03:COLOR_COLUMN:1000g2014oct_eur:XLS_YELLOW"
expression_patterns+=",'1000g2014oct_eur_97:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")>0.97)'"
expression_usages+=",1000g2014oct_eur_97:COLOR_COLUMN:1000g2014oct_eur:XLS_YELLOW"
expression_patterns+=",'1000g2014oct_eur_01:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")<0.01)'"
expression_usages+=",1000g2014oct_eur_01:COLOR_COLUMN:1000g2014oct_eur:XLS_ORANGE"
expression_patterns+=",'1000g2014oct_eur_99:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")>0.99)'"
expression_usages+=",1000g2014oct_eur_99:COLOR_COLUMN:1000g2014oct_eur:XLS_ORANGE"
expression_patterns+=",'1000g2014oct_eur_001:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")<0.001)'"
expression_usages+=",1000g2014oct_eur_001:COLOR_COLUMN:1000g2014oct_eur:XLS_GREEN"
expression_patterns+=",'1000g2014oct_eur_999:(\"1000g2014oct_eur\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_eur\")>0.999)'"
expression_usages+=",1000g2014oct_eur_999:COLOR_COLUMN:1000g2014oct_eur:XLS_GREEN"
expression_patterns+=",'1000g2014oct_eur_empty:(\"1000g2014oct_eur\"=='\'''\'')'"
expression_usages+=",1000g2014oct_eur_empty:COLOR_COLUMN:1000g2014oct_eur:XLS_GREEN"
expression_patterns+=",'EXAC03_CONSTRAINT_MIS_Z_significance:(\"EXAC03_CONSTRAINT_MIS_Z\"!='\'''\'')and"
expression_patterns+="(float(\"EXAC03_CONSTRAINT_MIS_Z\")>3)'"
expression_usages+=",EXAC03_CONSTRAINT_MIS_Z_significance:COLOR_COLUMN:EXAC03_CONSTRAINT_MIS_Z:XLS_YELLOW"
expression_patterns+=",'EXAC03_CONSTRAINT_PLI_significance:(\"EXAC03_CONSTRAINT_PLI\"!='\'''\'')and"
expression_patterns+="(float(\"EXAC03_CONSTRAINT_PLI\")>0.9)'"
expression_usages+=",EXAC03_CONSTRAINT_PLI_significance:COLOR_COLUMN:EXAC03_CONSTRAINT_PLI:XLS_YELLOW"
expression_patterns+=",'CADD_phred_significance:(\"CADD_phred\"!='\'''\'')and"
expression_patterns+="(float(\"CADD_phred\")>20)'"
expression_usages+=",CADD_phred_significance:COLOR_COLUMN:CADD_phred:XLS_YELLOW"
expression_patterns+=",'dpsi_zscore_significance1:(\"dpsi_zscore\"!='\'''\'')and"
expression_patterns+="(float(\"dpsi_zscore\")<-2)'"
expression_usages+=",dpsi_zscore_significance1:COLOR_COLUMN:dpsi_zscore:XLS_YELLOW"
expression_patterns+=",'dpsi_zscore_significance2:(\"dpsi_zscore\"!='\'''\'')and"
expression_patterns+="(float(\"dpsi_zscore\")>2)'"
expression_usages+=",dpsi_zscore_significance2:COLOR_COLUMN:dpsi_zscore:XLS_YELLOW"

jobs_setup_file="$dataset_name"_jobs_setup.txt
#only_families="True"
#only_summary="True"

cmd="pyCMM-mutrep-create-job-setup-file"
cmd+=" -d $dataset_name"
cmd+=" -O $project_out_dir"
if [ ! -z $project_code ]
then
    cmd+=" -p $project_code"
fi
if [ ! -z $anno_cols ]
then
    cmd+=" -a $anno_cols"
fi
if [ ! -z $anno_excl_tags ]
then
    cmd+=" -E $anno_excl_tags"
fi
if [ ! -z "$filter_actions" ]
then
    cmd+=" --filter_actions $filter_actions"
fi
if [ ! -z $filter_genes ]
then
    cmd+=" --filter_genes $filter_genes"
fi
if [ ! -z "$expression_patterns" ]
then
    cmd+=" --expression_patterns $expression_patterns"
fi
if [ ! -z "$expression_usages" ]
then
    cmd+=" --expression_usages $expression_usages"
fi
if [ ! -z $annotated_vcf_tabix ]
then
    cmd+=" -A $annotated_vcf_tabix"
fi
if [ ! -z $sample_infos ]
then
    cmd+=" -s $sample_infos"
fi
if [ ! -z $report_regions ]
then
    cmd+=" -R $report_regions"
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
if [ "$summary_families" = "True" ]
then
    cmd+=" --summary_families"
fi
if [ "$only_families" = "True" ]
then
    cmd+=" --only_families"
fi
if [ "$only_summary" = "True" ]
then
    cmd+=" --only_summary"
fi
if [ "$coloring_zygosity" = "True" ]
then
    cmd+=" --coloring_zygosity"
fi
cmd+=" -o $jobs_setup_file"

eval "$cmd"
