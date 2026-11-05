 <img src="images/logo.png" width="120" align="right" hspace="20" alt="Project Logo">
 
<h1>Correlation Analysis in R</h1>
 <p>Statistical correlation analysis for bioinformatics research</p>
 
![](https://img.shields.io/badge/Biostatistics-8A2BE2)
![](https://img.shields.io/badge/Rstudio-4.5.1-%23276DC3?logo=r)      

# ```Correlation``` is a statistical approach used to investigate the strength and direction of relationships between two or more variables. 
### In bioinformatics, it is particularly useful for exploring associations between gene expression profiles, miRNAs, lncRNAs, circRNAs, clinical variables, and molecular biomarkers.

### **The two most popular methods:**

### **1. Pearson Correlation**
#### `Pearson's correlation` coefficient (r) measures the direction of a **linear relationship** between two variables.

### **2. Spearman rank-based Correlation**
#### `Spearman's rank correlation` coefficient (rho) evaluates monotonic relationships between two variables using their ranks.

> The test gives you a **correlation coefficient** between −1 and +1 and a **p-value** that tells you whether the association is statistically significant

> RStudio function:
```
cor.test()
```
> In argument `method`, the correlation method is selected:

* The imported data should be in `Normalized log-scale` values in class of matrix.
* The samples between two matrix should be the same in numbers and characters
* Rows are genes or other RNAs 

```
cor.test(matrix1, matrix2, method = "pearson")
cor.test(matrix1, matrix2, method = "Spearman")
```

> Extracting results with P.value:
```
results <- data.frame(
  X,
  Y,
  cor = corr_test$estimate,
  pvalue = corr_test$p.value)
```

* A commonly used significance threshold is: `P-value < 0.05`


## Applications in **Bioinformatics**

### 1. **Gene–Gene Expression Correlation**
> Investigating *co-expression* patterns and identifying potential functional associations.

### 2. **miRNA–mRNA Correlation** `core < 0` *Negative*
### 3. **lncRNA–miRNA Correlation** `cor < 0` *Negative*
### 4. **lncRNA-mRNA Correlation** `cor > 0` *Positive*

> *Note*: *Negative* or *Positive* correlations may support a potential regulatory relationship, although correlation alone does not establish direct targeting.

Correlation coefficient | Interpretation 
----------------------- | ----------------
+1                      | Perfect positive correlation
0.70 to 0.99            | Strong positive correlation
0.40 to 0.69            | Moderate positive correlation
0.10 to 0.39            | Weak positive correlation
0                       | No linear correlation (Pearson)
-0.10 to -0.39          | Weak negative correlation
-0.40 to -0.69          | Moderate negative correlation
-0.70 to -0.99          | Strong negative correlation
-1                      | Perfect negative correlation

> *Note*: These ranges are meant as illustrative guidelines, not universal statistical thresholds. Interpretation should depend on the research context and biological relevance.

## Visualization
### Scatter Plot
* These codes are for an example 

```
library(ggplot2)
library(ggpubr)
```
```
df <- data.frame(
  hsa_mir_... = as.numeric(miRNA_source["hsa-mir-...", ]),
  gene = as.numeric(mRNA_tar["gene", ]))
```
* *Note*: Samples in both matrix tables should be the same

```
cor_test <- cor.test(df$gene, df$mir, method = "pearson")
```
```
rho <- round(
  cor_test$estimate,3)
  
pval <- format.pval(
  cor_test$p.value,
  digits = 3,
  eps = 0.001)
```
```
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
```

#### When there is **positive** correlation in scatter plot:

![](C:/Users/resam/Desktop/p.png)

* The names of gene and lncRNA labeled in the plot are only for an example.

#### When there is **Negative** correlation in scatter plot:

![](C:/Users/resam/Desktop/N.png)

* The names of gene and miRNA labeled in the plot are only for an example.




