#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dataset_name="THYRCA"
project_out_dir="$MUTATIONS_REPORTS_OUTPUT_DIR/THYRCA/families_gene_list"
project_code="b2016200"
job_alloc_time="20:00:00"
annotated_vcf_tabix="$ANNOTATED_THYRCA"
sample_infos="$script_dir/sample.info"
coloring_zygosity="True"
show_shared_variants="True"
call_detail="True"
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
anno_cols+=",gnomAD_genome_ALL"
anno_cols+=",gnomAD_genome_AFR"
anno_cols+=",gnomAD_genome_AMR"
anno_cols+=",gnomAD_genome_ASJ"
anno_cols+=",gnomAD_genome_EAS"
anno_cols+=",gnomAD_genome_FIN"
anno_cols+=",gnomAD_genome_NFE"
anno_cols+=",gnomAD_genome_OTH"
anno_cols+=",249_SWEDES"
anno_cols+=",200_DANES"
anno_cols+=",1000g2014oct_all"
anno_cols+=",1000g2014oct_eur"
anno_cols+=",1000g2014oct_eur"
anno_cols+=",InterVar_class"
anno_cols+=",InterVar_evidence"
anno_cols+=",ExAC_nontcga_ALL"
anno_cols+=",ExAC_nontcga_NFE"
anno_cols+=",ExAC_nontcga_AFR"
anno_cols+=",ExAC_nontcga_AMR"
anno_cols+=",ExAC_nontcga_EAS"
anno_cols+=",ExAC_nontcga_FIN"
anno_cols+=",ExAC_nontcga_SAS"
anno_cols+=",ExAC_nontcga_OTH"
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
anno_cols+=",CLINSIG"
anno_cols+=",CLNDBN"
anno_cols+=",CLNACC"
anno_cols+=",CLNDSDB"
anno_cols+=",CLNDSDBID"
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
#report_regions="17"
#report_regions="17:61000000-62000000"
#report_regions+=",17:63000000-64000000"
#report_regions+=",17:17009561-17069561"
filter_actions="Rare"
filter_actions+=",PASS-VQSR"
#filter_actions="PASS-VQSR"
filter_actions+=",Non-Intergenic"
#filter_actions+=",Non-Intronic"
filter_actions+=",Non-Upstream"
filter_actions+=",Non-Downstream"
#filter_actions+=",Non-UTR"
filter_actions+=",Has-Shared"
filter_actions+=",Has-Mutation"
freq_ratios="SWEGEN_AF:0.1"
color_genes="ABCB11"
color_genes+=",ALMS1"
color_genes+=",AP3B1"
color_genes+=",ATM"
color_genes+=",BARD1"
color_genes+=",BLM"
color_genes+=",BLOC1S6"
color_genes+=",BRCA2"
color_genes+=",BRIP1"
color_genes+=",BUB1B"
color_genes+=",CASR"
color_genes+=",CEP57"
color_genes+=",CTC1"
color_genes+=",DDB2"
color_genes+=",DICER1"
color_genes+=",DIS3L2"
color_genes+=",DTNBP1"
color_genes+=",EGFR"
color_genes+=",ERCC2"
color_genes+=",ERCC3"
color_genes+=",ERCC4"
color_genes+=",ERCC5"
color_genes+=",EXO1"
color_genes+=",FAN1"
color_genes+=",FANCA"
color_genes+=",FANCC"
color_genes+=",FANCD2"
color_genes+=",FANCE"
color_genes+=",FANCF"
color_genes+=",FANCG"
color_genes+=",FANCI"
color_genes+=",FANCL"
color_genes+=",FANCM"
color_genes+=",FH"
color_genes+=",FOXO1"
color_genes+=",G6PC3"
color_genes+=",HACE1"
color_genes+=",HAX1"
color_genes+=",HOXB13"
color_genes+=",HPS1"
color_genes+=",HPS3"
color_genes+=",HPS4"
color_genes+=",HPS5"
color_genes+=",HPS6"
color_genes+=",ITK"
color_genes+=",JAGN1"
color_genes+=",MET"
color_genes+=",MLH1"
color_genes+=",MPL"
color_genes+=",MRE11A"
color_genes+=",MSH2"
color_genes+=",MSH3"
color_genes+=",MSH6"
color_genes+=",MUTYH"
color_genes+=",NBN"
color_genes+=",NHP2"
color_genes+=",NOP10"
color_genes+=",NTHL1"
color_genes+=",OCA2"
color_genes+=",PALB2"
color_genes+=",PARK2"
color_genes+=",PAX3"
color_genes+=",PAX7"
color_genes+=",PMS1"
color_genes+=",PMS2"
color_genes+=",PMS2P1"
color_genes+=",POLE"
color_genes+=",POLH"
color_genes+=",PRF1"
color_genes+=",RAD50"
color_genes+=",RAD51C"
color_genes+=",RBBP8"
color_genes+=",RECQL4"
color_genes+=",RET"
color_genes+=",RMRP"
color_genes+=",RTEL1"
color_genes+=",SASH1"
color_genes+=",SBDS"
color_genes+=",SDHA"
color_genes+=",SLC26A4"
color_genes+=",SLX4"
color_genes+=",SMARCAL1"
color_genes+=",TERT"
color_genes+=",CD27"
color_genes+=",TRIM37"
color_genes+=",TYR"
color_genes+=",UBE2T"
color_genes+=",USB1"
color_genes+=",VHL"
color_genes+=",VPS45"
color_genes+=",WRAP53"
color_genes+=",WRN"
color_genes+=",XPA"
color_genes+=",XPC"
color_genes+=",XRCC2"
color_genes+=",XRCC4"
expression_patterns="'Func_ncRNA_exonic:(\"Func.refGene\"=='\''ncRNA_exonic'\'')'"
expression_usages="Func_ncRNA_exonic:DELETE_ROW"
expression_patterns+=",'Func_ncRNA_splicing:(\"Func.refGene\"=='\''ncRNA_splicing'\'')'"
expression_usages+=",Func_ncRNA_splicing:DELETE_ROW"
expression_patterns+=",'ExonicFunc_unknown:(\"ExonicFunc.refGene\"=='\''unknown'\'')'"
expression_usages+=",ExonicFunc_unknown:DELETE_ROW"

expression_patterns+=",'MAX_REF_MAF_COMMON:(\"MAX_REF_MAF\"!='\'''\'')and"
expression_patterns+="(float(\"MAX_REF_MAF\")<=0.99)and"
expression_patterns+="(float(\"MAX_REF_MAF\")>=0.01)'"
expression_usages+=",MAX_REF_MAF_COMMON:DELETE_ROW"
expression_patterns+=",'SWEGEN_AF_001:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")<0.001)'"
expression_usages+=",SWEGEN_AF_001:COLOR_COLUMN:SWEGEN_AF:XLS_GREEN"
expression_patterns+=",'SWEGEN_AF_999:(\"SWEGEN_AF\"!='\'''\'')and"
expression_patterns+="(float(\"SWEGEN_AF\")>0.999)'"
expression_usages+=",SWEGEN_AF_999:COLOR_COLUMN:SWEGEN_AF:XLS_GREEN"
expression_patterns+=",'SWEGEN_AF_empty:(\"SWEGEN_AF\"=='\'''\'')'"
expression_usages+=",SWEGEN_AF_empty:COLOR_COLUMN:SWEGEN_AF:XLS_GREEN"
expression_patterns+=",'ExAC_ALL_001:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")<0.001)'"
expression_usages+=",ExAC_ALL_001:COLOR_COLUMN:ExAC_ALL:XLS_GREEN"
expression_patterns+=",'ExAC_ALL_999:(\"ExAC_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_ALL\")>0.999)'"
expression_usages+=",ExAC_ALL_999:COLOR_COLUMN:ExAC_ALL:XLS_GREEN"
expression_patterns+=",'ExAC_ALL_empty:(\"ExAC_ALL\"=='\'''\'')'"
expression_usages+=",ExAC_ALL_empty:COLOR_COLUMN:ExAC_ALL:XLS_GREEN"
expression_patterns+=",'ExAC_NFE_001:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")<0.001)'"
expression_usages+=",ExAC_NFE_001:COLOR_COLUMN:ExAC_NFE:XLS_GREEN"
expression_patterns+=",'ExAC_NFE_999:(\"ExAC_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_NFE\")>0.999)'"
expression_usages+=",ExAC_NFE_999:COLOR_COLUMN:ExAC_NFE:XLS_GREEN"
expression_patterns+=",'ExAC_NFE_empty:(\"ExAC_NFE\"=='\'''\'')'"
expression_usages+=",ExAC_NFE_empty:COLOR_COLUMN:ExAC_NFE:XLS_GREEN"
expression_patterns+=",'ExAC_AFR_001:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")<0.001)'"
expression_usages+=",ExAC_AFR_001:COLOR_COLUMN:ExAC_AFR:XLS_GREEN"
expression_patterns+=",'ExAC_AFR_999:(\"ExAC_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AFR\")>0.999)'"
expression_usages+=",ExAC_AFR_999:COLOR_COLUMN:ExAC_AFR:XLS_GREEN"
expression_patterns+=",'ExAC_AFR_empty:(\"ExAC_AFR\"=='\'''\'')'"
expression_usages+=",ExAC_AFR_empty:COLOR_COLUMN:ExAC_AFR:XLS_GREEN"
expression_patterns+=",'ExAC_AMR_001:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")<0.001)'"
expression_usages+=",ExAC_AMR_001:COLOR_COLUMN:ExAC_AMR:XLS_GREEN"
expression_patterns+=",'ExAC_AMR_999:(\"ExAC_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_AMR\")>0.999)'"
expression_usages+=",ExAC_AMR_999:COLOR_COLUMN:ExAC_AMR:XLS_GREEN"
expression_patterns+=",'ExAC_AMR_empty:(\"ExAC_AMR\"=='\'''\'')'"
expression_usages+=",ExAC_AMR_empty:COLOR_COLUMN:ExAC_AMR:XLS_GREEN"
expression_patterns+=",'ExAC_EAS_001:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")<0.001)'"
expression_usages+=",ExAC_EAS_001:COLOR_COLUMN:ExAC_EAS:XLS_GREEN"
expression_patterns+=",'ExAC_EAS_999:(\"ExAC_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_EAS\")>0.999)'"
expression_usages+=",ExAC_EAS_999:COLOR_COLUMN:ExAC_EAS:XLS_GREEN"
expression_patterns+=",'ExAC_EAS_empty:(\"ExAC_EAS\"=='\'''\'')'"
expression_usages+=",ExAC_EAS_empty:COLOR_COLUMN:ExAC_EAS:XLS_GREEN"
expression_patterns+=",'ExAC_FIN_001:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")<0.001)'"
expression_usages+=",ExAC_FIN_001:COLOR_COLUMN:ExAC_FIN:XLS_GREEN"
expression_patterns+=",'ExAC_FIN_999:(\"ExAC_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_FIN\")>0.999)'"
expression_usages+=",ExAC_FIN_999:COLOR_COLUMN:ExAC_FIN:XLS_GREEN"
expression_patterns+=",'ExAC_FIN_empty:(\"ExAC_FIN\"=='\'''\'')'"
expression_usages+=",ExAC_FIN_empty:COLOR_COLUMN:ExAC_FIN:XLS_GREEN"
expression_patterns+=",'ExAC_SAS_001:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")<0.001)'"
expression_usages+=",ExAC_SAS_001:COLOR_COLUMN:ExAC_SAS:XLS_GREEN"
expression_patterns+=",'ExAC_SAS_999:(\"ExAC_SAS\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_SAS\")>0.999)'"
expression_usages+=",ExAC_SAS_999:COLOR_COLUMN:ExAC_SAS:XLS_GREEN"
expression_patterns+=",'ExAC_SAS_empty:(\"ExAC_SAS\"=='\'''\'')'"
expression_usages+=",ExAC_SAS_empty:COLOR_COLUMN:ExAC_SAS:XLS_GREEN"
expression_patterns+=",'ExAC_OTH_001:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")<0.001)'"
expression_usages+=",ExAC_OTH_001:COLOR_COLUMN:ExAC_OTH:XLS_GREEN"
expression_patterns+=",'ExAC_OTH_999:(\"ExAC_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"ExAC_OTH\")>0.999)'"
expression_usages+=",ExAC_OTH_999:COLOR_COLUMN:ExAC_OTH:XLS_GREEN"
expression_patterns+=",'ExAC_OTH_empty:(\"ExAC_OTH\"=='\'''\'')'"
expression_usages+=",ExAC_OTH_empty:COLOR_COLUMN:ExAC_OTH:XLS_GREEN"

expression_patterns+=",'gnomAD_genome_ALL_001:(\"gnomAD_genome_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_ALL\")<0.001)'"
expression_usages+=",gnomAD_genome_ALL_001:COLOR_COLUMN:gnomAD_genome_ALL:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_ALL_999:(\"gnomAD_genome_ALL\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_ALL\")>0.999)'"
expression_usages+=",gnomAD_genome_ALL_999:COLOR_COLUMN:gnomAD_genome_ALL:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_ALL_empty:(\"gnomAD_genome_ALL\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_ALL_empty:COLOR_COLUMN:gnomAD_genome_ALL:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_AFR_001:(\"gnomAD_genome_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_AFR\")<0.001)'"
expression_usages+=",gnomAD_genome_AFR_001:COLOR_COLUMN:gnomAD_genome_AFR:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_AFR_999:(\"gnomAD_genome_AFR\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_AFR\")>0.999)'"
expression_usages+=",gnomAD_genome_AFR_999:COLOR_COLUMN:gnomAD_genome_AFR:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_AFR_empty:(\"gnomAD_genome_AFR\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_AFR_empty:COLOR_COLUMN:gnomAD_genome_AFR:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_AMR_001:(\"gnomAD_genome_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_AMR\")<0.001)'"
expression_usages+=",gnomAD_genome_AMR_001:COLOR_COLUMN:gnomAD_genome_AMR:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_AMR_999:(\"gnomAD_genome_AMR\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_AMR\")>0.999)'"
expression_usages+=",gnomAD_genome_AMR_999:COLOR_COLUMN:gnomAD_genome_AMR:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_AMR_empty:(\"gnomAD_genome_AMR\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_AMR_empty:COLOR_COLUMN:gnomAD_genome_AMR:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_ASJ_001:(\"gnomAD_genome_ASJ\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_ASJ\")<0.001)'"
expression_usages+=",gnomAD_genome_ASJ_001:COLOR_COLUMN:gnomAD_genome_ASJ:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_ASJ_999:(\"gnomAD_genome_ASJ\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_ASJ\")>0.999)'"
expression_usages+=",gnomAD_genome_ASJ_999:COLOR_COLUMN:gnomAD_genome_ASJ:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_ASJ_empty:(\"gnomAD_genome_ASJ\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_ASJ_empty:COLOR_COLUMN:gnomAD_genome_ASJ:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_EAS_001:(\"gnomAD_genome_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_EAS\")<0.001)'"
expression_usages+=",gnomAD_genome_EAS_001:COLOR_COLUMN:gnomAD_genome_EAS:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_EAS_999:(\"gnomAD_genome_EAS\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_EAS\")>0.999)'"
expression_usages+=",gnomAD_genome_EAS_999:COLOR_COLUMN:gnomAD_genome_EAS:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_EAS_empty:(\"gnomAD_genome_EAS\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_EAS_empty:COLOR_COLUMN:gnomAD_genome_EAS:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_FIN_001:(\"gnomAD_genome_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_FIN\")<0.001)'"
expression_usages+=",gnomAD_genome_FIN_001:COLOR_COLUMN:gnomAD_genome_FIN:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_FIN_999:(\"gnomAD_genome_FIN\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_FIN\")>0.999)'"
expression_usages+=",gnomAD_genome_FIN_999:COLOR_COLUMN:gnomAD_genome_FIN:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_FIN_empty:(\"gnomAD_genome_FIN\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_FIN_empty:COLOR_COLUMN:gnomAD_genome_FIN:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_NFE_001:(\"gnomAD_genome_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_NFE\")<0.001)'"
expression_usages+=",gnomAD_genome_NFE_001:COLOR_COLUMN:gnomAD_genome_NFE:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_NFE_999:(\"gnomAD_genome_NFE\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_NFE\")>0.999)'"
expression_usages+=",gnomAD_genome_NFE_999:COLOR_COLUMN:gnomAD_genome_NFE:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_NFE_empty:(\"gnomAD_genome_NFE\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_NFE_empty:COLOR_COLUMN:gnomAD_genome_NFE:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_OTH_001:(\"gnomAD_genome_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_OTH\")<0.001)'"
expression_usages+=",gnomAD_genome_OTH_001:COLOR_COLUMN:gnomAD_genome_OTH:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_OTH_999:(\"gnomAD_genome_OTH\"!='\'''\'')and"
expression_patterns+="(float(\"gnomAD_genome_OTH\")>0.999)'"
expression_usages+=",gnomAD_genome_OTH_999:COLOR_COLUMN:gnomAD_genome_OTH:XLS_GREEN"
expression_patterns+=",'gnomAD_genome_OTH_empty:(\"gnomAD_genome_OTH\"=='\'''\'')'"
expression_usages+=",gnomAD_genome_OTH_empty:COLOR_COLUMN:gnomAD_genome_OTH:XLS_GREEN"

expression_patterns+=",'249_SWEDES_001:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")<0.001)'"
expression_usages+=",249_SWEDES_001:COLOR_COLUMN:249_SWEDES:XLS_GREEN"
expression_patterns+=",'249_SWEDES_999:(\"249_SWEDES\"!='\'''\'')and"
expression_patterns+="(float(\"249_SWEDES\")>0.999)'"
expression_usages+=",249_SWEDES_999:COLOR_COLUMN:249_SWEDES:XLS_GREEN"
expression_patterns+=",'249_SWEDES_empty:(\"249_SWEDES\"=='\'''\'')'"
expression_usages+=",249_SWEDES_empty:COLOR_COLUMN:249_SWEDES:XLS_GREEN"
expression_patterns+=",'200_DANES_001:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")<0.001)'"
expression_usages+=",200_DANES_001:COLOR_COLUMN:200_DANES:XLS_GREEN"
expression_patterns+=",'200_DANES_999:(\"200_DANES\"!='\'''\'')and"
expression_patterns+="(float(\"200_DANES\")>0.999)'"
expression_usages+=",200_DANES_999:COLOR_COLUMN:200_DANES:XLS_GREEN"
expression_patterns+=",'200_DANES_empty:(\"200_DANES\"=='\'''\'')'"
expression_usages+=",200_DANES_empty:COLOR_COLUMN:200_DANES:XLS_GREEN"
expression_patterns+=",'1000g2014oct_all_001:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")<0.001)'"
expression_usages+=",1000g2014oct_all_001:COLOR_COLUMN:1000g2014oct_all:XLS_GREEN"
expression_patterns+=",'1000g2014oct_all_999:(\"1000g2014oct_all\"!='\'''\'')and"
expression_patterns+="(float(\"1000g2014oct_all\")>0.999)'"
expression_usages+=",1000g2014oct_all_999:COLOR_COLUMN:1000g2014oct_all:XLS_GREEN"
expression_patterns+=",'1000g2014oct_all_empty:(\"1000g2014oct_all\"=='\'''\'')'"
expression_usages+=",1000g2014oct_all_empty:COLOR_COLUMN:1000g2014oct_all:XLS_GREEN"
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
expression_patterns+=",'true_synonymous:(\"dpsi_zscore\"!='\'''\'')and"
expression_patterns+="(\"ExonicFunc.refGene\"=='\''synonymous_SNV'\'')and"
expression_patterns+="(float(\"dpsi_zscore\")>-2)and"
expression_patterns+="(float(\"dpsi_zscore\")<2)'"
expression_usages+=",true_synonymous:DELETE_ROW"

jobs_setup_file="$dataset_name"_jobs_setup.txt

cmd="pyCMM-mutrep-create-job-setup-file"
cmd+=" -d $dataset_name"
cmd+=" -O $project_out_dir"
if [ ! -z $project_code ]
then
    cmd+=" -p $project_code"
fi
if [ ! -z $job_alloc_time ]
then
    cmd+=" --job_alloc_time $job_alloc_time"
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
if [ ! -z $color_genes ]
then
    cmd+=" --color_genes $color_genes"
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
if [ "$coloring_zygosity" = "True" ]
then
    cmd+=" --coloring_zygosity"
fi
if [ "$show_shared_variants" == "True" ]
then
    cmd+=" --show_shared_variants"
fi
cmd+=" -o $jobs_setup_file"

eval "$cmd"
