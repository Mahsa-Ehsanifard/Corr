
# Correlation Analysis in R  <img src="images/logo.png" width="80" alt="Project Logo">
</p>

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

#### *Note*: The imported data should be in `Normalized log-scale` values in class of matrix.


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

## Applications in **Bioinformatics**

### 1. **Gene–Gene Expression Correlation**
> Investigating *co-expression* patterns and identifying potential functional associations.

### 2. **miRNA–mRNA Correlation** `core < 0` *Negative*
### 3. **lncRNA–miRNA Correlation** `cor < 0` *Negative*
### 4. **lncRNA-mRNA Correlation** `cor > 0` *Positive*

> *Note*: *Negative* or *Positive* correlations may support a potential regulatory relationship, although correlation alone does not establish direct targeting.

