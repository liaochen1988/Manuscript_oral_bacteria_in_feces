blastn -db ../../MOMD/MOMD -query ../../mGMB_miBC/mGMB_miBC.fasta -out blast_MOMD_as_subject_$1.txt -perc_identity $1 -qcov_hsp_perc 100 -outfmt 7 -max_target_seqs 100 -ungapped
blastn -db ../../mGMB_miBC/mGMB_miBC -query ../../MOMD/MOMD.fasta -out blast_MOMD_as_query_$1.txt -perc_identity $1 -qcov_hsp_perc 100 -outfmt 7 -max_target_seqs 100 -ungapped
