blastn -db ../../../../../HMPv35oral/HMPv35oral -query ../dna-sequences.fasta -out blast_HMPv35oral_p$1.txt -perc_identity $1 -ungapped -outfmt 7 -max_target_seqs 1000 -num_threads 24
