## Correlation
#Sharing Samples
common_samples <- intersect(gene_id, mir_id)
length(common_samples)
head(common_samples)

##Example for miR-gene
#Importing or using Normalized log-scale expression values
Normalized <- data.frame(Normalized)
gene <- Normalized["gene",]
tgene <- t(gene) #Transpose rows and columns 

Normalized.miR <- data.frame(Normalized.miR)
mymiR <- Normalized.miR["hsa-mir-...",]
tmymiR <- t(mymiR) #Transpose rows and columns 


# cor.test
cor_test <- cor.test(
  as.numeric(miRNA_source[mir, ]),
  as.numeric(mRNA_tar[gene, ]),
  method = "pearson" #Or "spearman" method
)
# Results as a table
results <- data.frame(
  miRNA = "hsa-mir-...",
  gene = "gene",
  cor = cor_test$estimate,
  pvalue = cor_test$p.value)

#Adjust p-values
results$padj <- p.adjust(results$pvalue, method = "BH")


#Visualization
library(ggplot2)
library(ggpubr)

df <- data.frame(
  gene = as.numeric(tgene),
  mir = as.numeric(tmymiR))

rho <- round(
  cor_test$estimate,
  3)

pval <- format.pval(
  cor_res$p.value,
  digits = 3,
  eps = 0.001) 

ggplot(df, aes(x = hsa_mir_..., y = gene)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  ggtitle("Correlation: miRNA vs gene") +
  theme_light()+
  annotate(
    "text",
    x = Inf,
    y = Inf,
    label = paste0("R = ", rho,   " ,p = ", pval),
    hjust = 1.5,
    vjust = 1,
    size = 5)

## Heatmap
library(ggcorrplot)

mir <- data.frame(Normalized.miR[10:20,])
mrna <- data.frame(Normalized[10:20,])
mat <- rbind(mir,mrna)
tm <- t(mat)

corr1 <- cor(tm)

ggcorrplot(
  corr1,
  method = "circle", #The appearance of graph could be cange by selections of arguments
  type = "lower",
  lab = TRUE,
  lab_size = 3,
  colors = c("blue", "white", "red"),
  outline.color = "white")

