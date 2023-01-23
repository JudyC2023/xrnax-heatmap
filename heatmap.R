library(ComplexHeatmap)

setwd('D:/UT/other_research/EV/data')

pureev_raw <- read.csv("pureev_raw.txt", sep = '', row.names = 1, header = TRUE)
#hmle_cellrbp_raw <- read.table("cellrbp_raw.txt", sep = '', row.names = 1, header = TRUE)

# these files have duplicated genes?
cellrbp <- read.csv('xrnaxcellrbp.txt', sep = '\t')
#pureevrbp <- read.csv('pureevrbp.txt', sep = '\t')

cr <- pureev_raw[rownames(pureev_raw) %in% cellrbp$HGNC, ]
#per <- hmle_cellrbp_raw[rownames(hmle_cellrbp_raw) %in% pureevrbp$HGNC, ]

# normalize within each sample, each value divided by the sum of sample intensity? not sure if it's ok
norm_cr <- cr / colSums(cr)

#scaling
cr_scaled <- t(scale(t(norm_cr)))

Heatmap(cr_scaled,
        show_row_names = FALSE)
