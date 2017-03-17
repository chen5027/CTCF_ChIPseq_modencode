rule unzip_gff:
        input:
                zipfile="Oregon_embryos_2_4h.gff3.gz"
        output:
                unzipfile="bysnake.gff"
        shell:
                "gunzip {input.zipfile} > {output.unzipfile}"


rule only_enriched:
        input:
                “Oregon_embryos_2_4h_enrichOnly.gff"
        output:
                "Oregon_embryos_2_4h_enrichOnly.bed"
        shell:
                "awk -F "\t" '{OFS="\t"; print "chr"$0}' {input} | cut -f 1,4,5 > {output}"