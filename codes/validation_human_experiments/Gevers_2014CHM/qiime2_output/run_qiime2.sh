#---------------------------
# import pairend fastq files
#---------------------------
#qiime tools import \
#  --type 'SampleData[PairedEndSequencesWithQuality]' \
#  --input-path manifest.tsv \
#  --output-path paired-end-demux.qza \
#  --input-format PairedEndFastqManifestPhred33V2

#qiime demux summarize \
#  --i-data paired-end-demux.qza \
#  --o-visualization paired-end-demux.qzv

#qiime tools view paired-end-demux.qzv

#--------------
# DADA2 denoise
#--------------
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs paired-end-demux.qza \
  --p-trunc-len-f 160 \
  --p-trunc-len-r 155 \
  --p-n-threads 36 \
  --o-table table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza

qiime tools export \
  --input-path table.qza \
  --output-path feature-table
biom convert -i feature-table/feature-table.biom -o feature-table/feature-table.from_biom.txt --to-tsv

qiime tools export \
   --input-path rep-seqs.qza \
   --output-path asv-sequences

#---------------------
# taxonomic assignment
#---------------------
qiime feature-classifier classify-sklearn \
  --i-classifier ~/Documents/silva-138-99-nb-classifier.qza \
  --i-reads rep-seqs.qza \
  --p-n-jobs 36 \
  --p-confidence 0.8 \
  --o-classification taxonomy.qza
