import pandas as pd
import os

df_meta = pd.read_csv("SraRunTable.txt")
df_meta = df_meta[df_meta.source_material_ID.str.contains('Maternal')]
df_meta = df_meta[df_meta.source_material_ID.str.contains('Oral') | df_meta.source_material_ID.str.contains('Intestine')]
manifest = []
for acc in df_meta.Run:
    manifest.append([acc, "$PWD/raw_fastq/%s_1.fastq"%(acc), "$PWD/raw_fastq/%s_2.fastq"%(acc)])
df_manifest = pd.DataFrame(manifest, columns=['sample-id','forward-absolute-filepath','reverse-absolute-filepath'])
df_manifest.to_csv("manifest.tsv", sep="\t", index=False)

