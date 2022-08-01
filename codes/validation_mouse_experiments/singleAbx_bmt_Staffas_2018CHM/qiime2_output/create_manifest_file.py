import pandas as pd
import os

df_meta = pd.read_csv("SraRunTable.txt")
manifest = []
for acc in df_meta.Run:
    manifest.append([acc, "$PWD/raw_fastq/%s.fastq"%(acc)])
df_manifest = pd.DataFrame(manifest, columns=['sample-id','absolute-filepath'])
df_manifest.to_csv("manifest.tsv", sep="\t", index=False)

