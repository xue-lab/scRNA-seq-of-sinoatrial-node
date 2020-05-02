#Map the reads for each sample to the reference genome
hisat2 -p 8 --dta -x /home/RNAseq/Refmm.vM23.p6.hisat2.ERCC/GRCm38 -1 $R1 -2 $R2 -S "$Sample".sam

#Sort and convert the SAM files to BAM
samtools sort -@ 8 -o "$Sample".bam "$Sample".sam

#Assemble and quantify expressed genes and transcripts
featureCounts --primary -p -T 20 -g gene_name -a $/home/RNAseq/Refmm.vM23.p6.hisat2.ERCC/gencode.vM23.annotation.gtf -o Read_Count_Table_gencode.txt *.bam
