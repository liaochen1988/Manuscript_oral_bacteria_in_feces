import pandas as pd
import os

df_meta = pd.read_csv("sra_ids.txt", header=None)
manifest = []
for acc in df_meta[0]:
    manifest.append([acc, "$PWD/raw_fastq/%s_1.fastq"%(acc), "$PWD/raw_fastq/%s_2.fastq"%(acc)])
df_manifest = pd.DataFrame(manifest, columns=['sample-id','forward-absolute-filepath','reverse-absolute-filepath'])
df_manifest.to_csv("manifest.tsv", sep="\t", index=False)

