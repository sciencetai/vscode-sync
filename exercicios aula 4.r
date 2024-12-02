
setwd("E:\\Microsoft VS Code\\R para ciencias da vida")

# Criando um arquivo de log para registrar operações
log_file <- "registro_log.txt"
write(paste0("Iniciando script de análise:", " ", Sys.time()), file = log_file)

# escolhendo o CRAN a ser usado
options(repos = c(CRAN = "https://vps.fmvz.usp.br/CRAN/")) #cran da USP

# Lista de pacotes a serem verificados e carregados
pacotes_cran <- c("tidyverse", "vegan", "DESeq2", "phyloseq", "limma", "ggstatsplot")

#Função para instalar pacotes
instalar_cran <- function(pacote) {
  if (!requireNamespace(pacote, quietly = TRUE)) { # Verifica se o pacote já está instalado
    install.packages(pacote)  # Instala o pacote se necessário
  }
}


sapply(pacotes_cran, instalar_cran)


if (all(sapply(pacotes, requireNamespace, quietly = TRUE))) {
  cat("Todos os pacotes foram instalados e carregados com sucesso!\n")
} else {
  cat("Alguns pacotes não foram instalados corretamente:\n")
  cat(paste("-", pacotes[!sapply(pacotes, requireNamespace, quietly = TRUE)]), collapse = "\n")
}


#instlaando pacote que estava mal instalado
BiocManager::install("phyloseq")

#verificando novamente
if (all(sapply(pacotes, requireNamespace, quietly = TRUE))) {
  cat("Todos os pacotes foram instalados e carregados com sucesso!\n")
} else {
  cat("Alguns pacotes não foram instalados corretamente:\n")
  cat(paste("-", pacotes[!sapply(pacotes, requireNamespace, quietly = TRUE)]), collapse = "\n")
}

library(ggplot2)
library(ggstatsplot)
install.packages("jsonlite")
R --version

