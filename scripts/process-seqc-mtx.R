suppressMessages(require("scCB2"))
suppressMessages(require("Matrix"))
args <- commandArgs(trailingOnly = TRUE)

# command line arguments
sample_name <- args[1]
path_in <- args[2]
path_out <- args[3]

if (!dir.exists(path_out)){
    dir.create(path_out)
} else {
    print("Dir already exists!")
}

mtx_file = paste0(sample_name, '_sparse_molecule_counts.mtx')
bc_file = paste0(sample_name, '_sparse_counts_barcodes.csv')
g_file = paste0(sample_name, '_sparse_counts_genes.csv')

ofile = paste0(sample_name, '_realdrops.csv')

barcodes = read.csv(
    paste0(path_in,bc_file),
    stringsAsFactors = F,
    header=F,
    sep=',',
    row.names=1,
    as.is=T
)
barcodes = as.character(barcodes$V2)

genes = read.csv(
    paste0(path_in,g_file),
    stringsAsFactors = F,
    header=F,
    sep=',',
    row.names=1,
    as.is=T
)
genes = as.character(genes$V2)

my.counts = readMM(paste0(path_in,mtx_file))

rownames(my.counts) <- barcodes
colnames(my.counts) <- genes
my.counts = t(my.counts)

ind = !duplicated(genes)
my.counts = my.counts[ind,]

my.counts = as(my.counts,'dgCMatrix')

CBOut <- CB2FindCell(
    my.counts, FDR_threshold = 0.01,
    lower = 100, Ncores = 2, verbose = TRUE
)
summary(CBOut)

RealCell <- GetCellMat(CBOut)
str(RealCell)

real_cells = colnames(RealCell)

write.table(
    data.frame(real_cells),
    paste0(path_out, ofile),
    quote = F,
    row.names = F,
    col.names = F
)
