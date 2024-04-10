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

