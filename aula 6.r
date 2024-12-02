setwd("E:\\Microsoft VS Code\\R para ciencias da vida")

# Criando um arquivo de log para registrar operações
log_file <- "registro_log_aula_6.txt"
write(paste0("Iniciando script de análise:", " ", Sys.time()), file = log_file)
write(paste0("Tentando novamente depois do vscode travar:", " ", Sys.time()), file = log_file)
# escolhendo o CRAN a ser usado
options(repos = c(CRAN = "https://vps.fmvz.usp.br/CRAN/")) #cran da USP


pacotes_bioconductor <- c("edgeR",        # Análise estatística de dados de RNA-Seq
                          "Biostrings",   # Manipulação de sequências biológicas
                          "limma",
                          "GEOquery",
                          "KEGGREST")        # Análise de dados de microarrays e RNA-Seq

# Instala todos os pacotes listados no vetor 'pacotes_bioconductor'
BiocManager::install(pacotes_bioconductor, update = TRUE, ask = FALSE)

library(GEOquery)
library(tidyverse)
library(KEGGREST)

geo_id <- "GSE208338"

#get geo usado para acessar datasets
geo_data <- getGEO(geo_id, GSEMatrix = TRUE)

View(geo_data)
class(geo_data)
head(geo_data)

#para acessar apenas a matriz de expressao de dados

expression_data <- exprs(geo_data[[1]]) #primeiro elemento é minha matriz de expressao

