library("ggplot2")
library(dplyr)
library(tidyr)
library("tidyverse")
library("stringr")
library("tidyr")

ggplot(cand2, aes(reorder(partido, -frequencia), frequencia))+
  geom_bar(stat = "identity", position="dodge", alpha=.5)+ #stat = que estatística vc quer;"identity = soma" , alpha=transparencia, positiondodge= barras laterais
  geom_text(aes(label=frequencia), position = position_dodge(.9), vjust=-0.5)+ #Position_dodge=texto tambem tem que ser lateral PEGAR o valor que cada barra possui
  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank())+ #Tirar as informações do eixo y pq elas ja estao em cima do grafico 
  theme(legend.position = "bottom")+ #colocar a legenda paara baixo
  theme(axis.text.x = element_text(angle=45, hjust = 1, size = 8))+
  labs(title = "Número de candidatos à vereança por partido", subtitle = "Curitiba", caption ="Fonte: autores, a partir dos dados do TSE em 4 de outubro de 2020. ", x="", y="")

summary(cand2$quant)


ggplot(ensino2, aes(reorder(ensino, -quant), quant))+
  geom_bar(stat = "identity", position="dodge", alpha=.5)+ #stat = que estatística vc quer;"identity = soma" , alpha=transparencia, positiondodge= barras laterais
  geom_text(aes(label=quant), position = position_dodge(.9), vjust=-0.2)+ #Position_dodge=texto tambem tem que ser lateral PEGAR o valor que cada barra possui
  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank())+ #Tirar as informações do eixo y pq elas ja estao em cima do grafico 
  theme(legend.position = "bottom")+ #colocar a legenda paara baixo
  theme(axis.text.x = element_text(angle=90, hjust = 1, size = 8))+
  labs(title = "Grau de instrução dos candidatos à vereança", subtitle = "Curitiba", caption ="Fonte: autores, a partir dos dados do TSE em 4 de outubro de 2020. ", x="", y="")
