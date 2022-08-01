blastn -db ../../../../../databases/fMOMD/fMOMD -query ../dna-sequences.fasta -out blast_fMOMD_p$1.txt -perc_identity $1 -qcov_hsp_perc 100 -ungapped -outfmt 7 -max_target_seqs 1000
