blastn -db ../../HOMD/HOMD -query ../HMPv35oral.fasta -out blast_HOMD_p$1.txt -perc_identity $1 -ungapped -outfmt 7 -qcov_hsp_perc 100 -max_target_seqs 1000 -num_threads 24
