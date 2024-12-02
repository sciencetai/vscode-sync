setwd("E:\\Microsoft VS Code\\R para ciencias da vida")

# Criando um arquivo de log para registrar operações
log_file <- "registro_log)aula5.txt"
write(paste0("Iniciando script de análise:", " ", Sys.time()), file = log_file)

# escolhendo o CRAN a ser usado
options(repos = c(CRAN = "https://vps.fmvz.usp.br/CRAN/")) #cran da USP


#exercício 1 - criação de vetores 

plantas <- c("camomila", "hortelã", "cidreira", "alecrim", "babosa")

altura_plantas <- c(150, 180, 135, 170, 145)

#antiinflamatoria = 1 e inflamatoria = 2
anti_inflamatoria <- c(1, 2, 1, 1, 2)

# Selecionar plantas com altura > 160 
plantas_altas <- plantas[altura_plantas > 160]
print(plantas_altas)
#tem que aparecer hortelã e alecrim



###############################################
# exercicio 2 - calculo com vetores

ratos <- c("r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8")
peso_ratos <- c(35.2, 42.1, 38.7, 33.5, 40.8, 45.3, 37.9, 43.2)

mean(peso_ratos)
#media tem que ser 39.5875

#identificar os ratos que pesam mais de 43g
ratos_pesados <- ratos[peso_ratos > 43]
print(ratos_pesados)
#resposta r6 e r8

#############################################

#exercicio 3 - matrix com dados de experimento com plantas
#criando vetor com os dados das especies
dados <- c(12, 15, 20, #esp 1
           10, 18, 20, #esp 2
           14, 17, 24, #esp 3
           11, 16, 19) #esp 4
#criando a matriz
m <- matrix(data = dados, nrow = 4, ncol = 3, byrow = TRUE)

#dando nome as colunas e linhas
rownames(m) <- c("Espécie 1", "Espécie 2", "Espécie 3", "Espécie 4")
colnames(m) <- c("Nível de luz 1", "Nível de luz 2", "Nível de luz 3")

print(m)

#calcule a produção media de clorofila por especie
#resolvi usar a função apply, que vai fazer a média por linha e nao preciso fazer manualmente
#nessa função, 1 indica que a operação é por linha; 2 seria por coluna.
media_clorofila <- apply(m, 1, mean)
print(media_clorofila)

#encontre a produção mais alta em um unico nivel de luz para todas as espécies
#os niveis de luz estão por coluna, então podemos usar a função max por coluna pra saber qual 
#espécie teve a maior produção em determinado nivel de luz
max_nivel_1 <- max(m[, "Nível de luz 1"]) #aqui ele ve o valor maximo na coluna de nivel de luz 1
max_nivel_2 <- max(m[, "Nível de luz 2"])
max_nivel_3 <- max(m[, "Nível de luz 3"])

#vamos ver o resultado
print(max_nivel_1)
print(max_nivel_2)
print(max_nivel_3)

#pra ver o valor maximo, podemos usar
max_total <- max(m)
print(max_total)

############################################

#exercicio 4 matriz de dados climaticos

dados_climaticos <- c(120, 110, 95, 100,
                    140, 135, 130, 125,
                    115, 105, 90, 80)

m2 <- matrix(data = dados_climaticos, nrow = 3, ncol = 4, byrow = TRUE)
colnames(m2) <- c("jan", "fev", "mar", "abr")
rownames(m2) <- c("Porto Alegre", "Novo Hamburgo", "Caxias do Sul")

print(m2)

#transpondo os elementos
transposta <- t(m2)
print(transposta)

#identificar o mes com maior chuva em cada local
#qual o maior nivel de chuva?
max_chuva_porto_alegre <- max(m2["Porto Alegre",])

#qual o mes que tem o maior nivel de chuva?
coluna_maxima_porto_alegre <- which.max(m2["Porto Alegre", ])
nome_coluna_maxima_porto_alegre <- colnames(m2)[coluna_maxima_porto_alegre]

#mostrar resultados
print(max_chuva_porto_alegre)
print(nome_coluna_maxima_porto_alegre)



#qual o maior nivel de chuva?
max_chuva_nh <- max(m2["Novo Hamburgo",])

#qual o mes que tem o maior nivel de chuva?
coluna_maxima_nh <- which.max(m2["Novo Hamburgo", ])
nome_coluna_maxima_nh <- colnames(m2)[coluna_maxima_nh]

#mostrar resultados
print(max_chuva_nh)
print(nome_coluna_maxima_nh)


#qual o maior nivel de chuva?
max_chuva_cxs <- max(m2["Caxias do Sul",])

#qual o mes que tem o maior nivel de chuva?
coluna_maxima_cxs <- which.max(m2["Caxias do Sul", ])
nome_coluna_maxima_cxs <- colnames(m2)[coluna_maxima_cxs]

#mostrar resultados
print(max_chuva_cxs)
print(nome_coluna_maxima_cxs)


################################################

#seção de dataframes
#registro de uma coelta de campo exercicio 5
library(data.table)

dt <- data.table(Espécie <- c("Anopheles gambiae", "Aedes aegypti", "Culex quinquefasciatus"),
                Local_de_Coleta <- c("Lago", "Parque", "Cidade"),
                Número_de_individuos <- c(34, 22, 18)
)
print(dt)

#mostre as especies com mais de 20 individuos
individuos <- Espécie[Número_de_individuos > 20]
print(individuos)

################################################

#exercicio 6 - simulando um experimento de crescimento bacteriano

dt2 <- data.table(Bactéria <- c("E. coli", "S. aureus", "L. monocytogenes", "B. subtilis", "P. aeruginosa"),
                  pH_do_meio <- c(7.0, 5.5, 6.8, 7.2, 6.0),
                  Densidade_óptica <- c(0.8, 1.5, 1.2, 0.7, 1.3)
)

print(dt2)
library(dplyr)

#filtrando as bacterias com ph maior que 6.5
bacterias_ph_maior <- filter(dt2, pH_do_meio > 6.5)

print(bacterias_ph_maior)

#salvando em excel
write.csv(dt2, "crescimento_bacteriano.csv", row.names = FALSE)
