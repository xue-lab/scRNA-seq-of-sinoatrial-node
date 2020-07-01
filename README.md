# scRNA-seq-of-sinoatrial-node
Cellular and molecular landscape of mammalian sinoatrial node revealed by single-cell RNA sequencing

library(Seurat)
library(dplyr)
library(Matrix)

san.data <- read.table("/expression_count.txt", header=T, row.names = 1)
san.data <- as(as.matrix(mouse.data), "dgCMatrix")

san <- CreateSeuratObject(raw.data = san.data)
san <- FilterCells(san, subset.names = "nGene")
san <- NormalizeData(san)
san <- FindVariableGenes(san, do.plot = F, display.progress = F)
san <- ScaleData(san)

san <- RunPCA(object = san, pc.genes = san@var.genes, do.print = TRUE)

PCElbowPlot(object = san)

san <- FindClusters(object = san, reduction.type = "pca", resolution = 0.6)
san <- RunTSNE(object = san, do.fast = TRUE)
TSNEPlot(object = san)
