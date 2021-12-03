library(bio3d)
library(bioseq)

read.alignment(bioinfo-alingment.fa, 'clustal', forceToLower= T)

aln <- read.fasta("/Users/zaidarodriguez/Desktop/UCSD/Fall2021/BGGN213/bggn213_github/Find_a_gene/findagene.fasta")

seqidentity(aln, normalize=TRUE, similarity=FALSE, ncore=1, nseg.scale=1)

x <- seqidentity(aln, normalize=TRUE, similarity=FALSE, ncore=1, nseg.scale=1)

heatmap(x, margins= c(17,14))

# con <- consensus(x)

aln2 <- read.fasta("/Users/zaidarodriguez/Desktop/UCSD/Fall2021/BGGN213/bggn213_github/Find_a_gene/sequence.fasta")

consensus(aln2)
blast.pdb(aln2)
pdb.annotate(ids = "3HQD_A")
pdb.annotate(ids = "3WPN_A")
pdb.annotate(ids = "4ZCA_A")
pdb.annotate(ids = "6VPO_C")
pdb.annotate(ids = "7D8V_A")
