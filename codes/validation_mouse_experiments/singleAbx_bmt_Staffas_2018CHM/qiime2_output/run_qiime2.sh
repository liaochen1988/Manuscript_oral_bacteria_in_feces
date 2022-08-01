#---------------------------
# import pairend fastq files
#---------------------------
qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-path manifest.tsv \
  --output-path single-end-demux.qza \
  --input-format SingleEndFastqManifestPhred33V2

qiime demux summarize \
  --i-data single-end-demux.qza \
  --o-visualization single-end-demux.qzv

qiime tools view single-end-demux.qzv

#--------------
# DADA2 denoise
#--------------
qiime dada2 denoise-single \
  --i-demultiplexed-seqs single-end-demux.qza \
  --p-trunc-len 330 \
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
