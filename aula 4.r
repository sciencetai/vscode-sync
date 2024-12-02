# 1. Verificar e instalar pacotes do CRAN -----------------------

# Vetor com os nomes dos pacotes do CRAN para análise de dados e estatística
pacotes_cran <- c("data.table",  # Manipulação eficiente de grandes datasets
                  "ggplot2",     # Criação de gráficos e visualização de dados
                  "dplyr")       # Manipulação de dados (parte do tidyverse)

# Função para instalar pacotes do CRAN, se ainda não estiverem instalados
instalar_cran <- function(pacote) {
  if (!requireNamespace(pacote, quietly = TRUE)) { # Verifica se o pacote já está instalado
    install.packages(pacote)  # Instala o pacote se necessário
  }
}

# Aplica a função de instalação para cada pacote listado no vetor 'pacotes_cran'
sapply(pacotes_cran, instalar_cran)


# 2. Instalar pacotes do Bioconductor ---------------------------

# Verifica se o pacote 'BiocManager' está instalado; caso contrário, instala do CRAN
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")  # Instalação do BiocManager
}

# Vetor com pacotes do Bioconductor para análise de dados genômicos e ômicos
pacotes_bioconductor <- c("edgeR",        # Análise estatística de dados de RNA-Seq
                          "Biostrings",   # Manipulação de sequências biológicas
                          "limma")        # Análise de dados de microarrays e RNA-Seq

# Instala todos os pacotes listados no vetor 'pacotes_bioconductor'
BiocManager::install(pacotes_bioconductor, update = TRUE, ask = FALSE)

# 3. Instalar pacotes do GitHub ----------------------------------

# Verifica se o pacote 'remotes' está instalado; caso contrário, instala do CRAN
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")  # Instala o pacote remotes
}

# Instala pacotes do GitHub para manipulação de árvores filogenéticas
remotes::install_github("GuangchuangYu/treeio")  # Pacote para manipular árvores filogenéticas

# 4. Verificar as versões dos pacotes instalados -----------------

# Função para listar e exibir a versão de pacotes instalados
listar_versoes <- function(pacotes) {
  for (pkg in pacotes) {
    if (requireNamespace(pkg, quietly = TRUE)) {
      cat(pkg, ":", as.character(packageVersion(pkg)), "\n")
    } else {
      cat(pkg, ": não instalado\n")
    }
  }
}

# Listar versões dos pacotes do CRAN
cat("\nVersões dos pacotes do CRAN:\n")  # Título da seção no console
listar_versoes(pacotes_cran)  # Exibe versões dos pacotes do CRAN

# Lista de pacotes do Bioconductor
pacotes_bioconductor <- c("edgeR", "DESeq2", "limma")  # Substitua pelos seus pacotes

cat("\nVersões dos pacotes do Bioconductor:\n")  # Título da seção no console

# Função para listar as versões dos pacotes
listar_versoes(pacotes_bioconductor)
listar_versoes(pacotes_cran)

# 5. Fim do script ----------------------------------------------

# Mensagem final no console indicando que a instalação foi concluída
cat("\nInstalação concluída! Agora você está pronto para realizar análises biológicas e estatísticas no R.\n")



# Como Acessar as Vinhetas no R

# As vinhetas são documentos incluídos em pacotes do R que oferecem tutoriais detalhados e exemplos práticos
# para ajudar os usuários a entender e aplicar as funcionalidades de um pacote.

# 1. Listar Vinhetas de um Pacote Instalado
# Para listar todas as vinhetas disponíveis em um pacote instalado, use o seguinte comando:

# Exemplo:
vignette(package = "ggplot2")
# 2. Abrir uma Vinheta Específica
# Para abrir uma vinheta específica de um pacote, use o comando:
vignette("nome_da_vinheta")

# Exemplo:
vignette("ggplot2-specs")
# 3. Buscar Vinhetas Disponíveis na Sessão R
# Para visualizar todas as vinhetas disponíveis de todos os pacotes instalados na sua sessão R, use o comando:
browseVignettes()



