install.packages("dplyr")
library(dplyr)
sessionInfo()

url <- "https://raw.githubusercontent.com/lucasjdc/estudando-r/main/dados.csv"
dados <- read.csv(url)

head(dados, 5)

unique(select(dados, Anos.de.Estudo))
arrange(unique(select(dados, Anos.de.Estudo)), Anos.de.Estudo)

c(arrange(unique(select(dados, Anos.de.Estudo)), Anos.de.Estudo))

c(arrange(unique(select(dados, UF)), UF))

c(arrange(unique(select(dados, Sexo)), Sexo))

c(arrange(unique(select(dados, Cor)), Cor))

sprintf('De %s até %s anos', min(dados$Idade), max(dados$Idade))

update.packages("glue")
library(glue)
glue('De {min(dados$Idade)} até {max(dados$Idade)} anos')

glue('De {min(dados$Altura)} até {max(dados$Altura)} metros')

table(dados$Sexo)

prop.table(table(dados$Sexo)) * 100

dist_freq_qualitativas <- cbind(freq = table(dados$Sexo), percent = prop.table(table(dados$Sexo)) * 100)

colnames(dist_freq_qualitativas) <- c('Frequência', 'Porcentagem (%)')

rownames(dist_freq_qualitativas) <- c('Masculino', 'Feminino')

# Distribuição de frequências para variáveis qualitativas - Método 2

frequencia <- table(dados$Sexo, dados$Cor)
rownames(frequencia) <- c('Masculino', 'Feminino')
colnames(frequencia) <- c('Indígena', 'Branca', 'Preta', 'Amarela', 'Parda')
frequencia <- cbind(frequencia)
percentual <- prop.table(frequencia) * 100
list(c(1, 2, 3, 4), c(5, 6, 7))
medias <- tapply(dados$Renda, list(dados$Sexo, dados$Cor), mean)
rownames(medias) <- c('Masculino', 'Feminino')
colnames(medias) <- c('Indígena', 'Branca', 'Preta', 'Amarela', 'Parda')

# Distribuição de frequências para variáveis quantitativas - Classes personalizadas

min(dados$Renda)
max(dados$Renda)

classes <- c(0, 1576, 3152, 7880, 15760, 200000)

labels <- c('E', 'D', 'C', 'B', 'A')

frequencia <- table(cut(x = dados$Renda, breaks = classes, labels = labels, include.lowest = TRUE))

percentual <- prop.table(frequencia) * 100

dist_freq_quantitativas_personalizadas <- cbind('Frequência' = frequencia, 'Porcentagem (%)' = percentual)

dist_freq_quantitativas_personalizadas[
  order(row.names(dist_freq_quantitativas_personalizadas)),
  ]

# Distribuição de frequências para variáveis quantitativas (Classes de amplitude fixa)

# Passo 1 - Definindo o número de classes

n <- nrow(dados)

# Regra de Sturges
k <- 1 + (10/3) * log10(n)

k <- round(k)

# Passo 2 - Criar a tabela de frequências

labels <- c(
    '      0.00 |—|  11,764.70',
    ' 11,764.70  —|  23,529.40',
    ' 23,529.40  —|  35,294.10',
    ' 35,294.10  —|  47,058.80',
    ' 47,058.80  —|  58,823.50',
    ' 58,823.50  —|  70,588.20',
    ' 70,588.20  —|  82,352.90',
    ' 82,352.90  —|  94,117.60',
    ' 94,117.60  —| 105,882.00',
    '105,882.00  —| 117,647.00',
    '117,647.00  —| 129,412.00',
    '129,412.00  —| 141,176.00',
    '141,176.00  —| 152,941.00',
    '152,941.00  —| 164,706.00',
    '164,706.00  —| 176,471.00',
    '176,471.00  —| 188,235.00',
    '188,235.00  —| 200,000.00'
)

frequencia <- table(cut(x = dados$Renda, breaks = k, labels = labels, include.lowest = TRUE))
percentual <- prop.table(frequencia) * 100
dist_freq_quantitativas_amplitude_fixa <- cbind('Frequência' = frequencia, 'Porcentagem (%)' = percentual)