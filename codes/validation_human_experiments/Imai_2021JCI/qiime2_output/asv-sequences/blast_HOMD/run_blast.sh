blastn -db ../../../../../../databases/HOMD/HOMD -query ../dna-sequences.fasta -out blast_HOMD_p$1.txt -perc_identity $1 -qcov_hsp_perc 100 -ungapped -outfmt 7 -max_target_seqs 100 -num_threads 24
