blastn -db ../../../../../databases/MOMD/MOMD -query ../dna-sequences.fasta -out blast_MOMD_p$1.txt -perc_identity $1 -qcov_hsp_perc 100 -ungapped -outfmt 7 -max_target_seqs 100
