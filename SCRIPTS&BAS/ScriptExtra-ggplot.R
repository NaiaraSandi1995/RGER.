#Aula extra para os colegas do mestrado e doutorado
#Naiara Sandi de A. Alcantara

#Cores: https://color.adobe.com/pt/create/color-wheel


#Gráfico de Linha####
#1º versão  
library(ggplot2)
#Banco sen
ggplot(data = sen, aes(x = vgasto, 
                       y = votos)) + 
  geom_point()

options(scipen = 1000)
#2º versão:
ggplot(data = sen, aes(x = vgasto, 
                      y = votos, 
                      col = votos)) + 
  geom_point()+ 
  scale_x_log10()+
  scale_y_log10()+ geom_count()

 #3º versão:
ggplot(data = sen, aes(x = vgasto, 
                       y = votos, 
                       col = vgasto 
)) + 
  geom_point()+ 
  scale_x_log10()+
  scale_y_log10()+ 
  geom_smooth(method = "lm", se = T, 
              col = "#C42126", size = 2) +
  theme(legend.position = "none"
  )+ labs(title = "Título", x= "gastos", y="votos")

#Documentação
#https://www.rdocumentation.org/packages/ggplot2/versions/3.3.5

#4º Versão

#https://www.datanovia.com/en/blog/ggplot-point-shapes-best-tips/

ggplot(data = sen, aes(x = vgasto, 
                       y = votos, 
                       col = vgasto 
)) + 
  geom_point(shape = 21, size = 2,
             fill = "black", alpha = 0.2, 
             stroke = 2)+ 
  scale_x_log10()+
  scale_y_log10()+ 
  geom_smooth(method = "lm", se = T, 
              col = "#C42126", size = 2) +
  theme(legend.position = "none"
  )+ labs(title = "Título", x= "", y="")


??stroke

#5º e ultima versão
Gra1 <- ggplot(data = sen, aes(x = vgasto, 
                       y = votos, 
                       col = vgasto 
)) + 
  geom_point(shape = 21, size = 2,
             fill = "black", 
             stroke = 2, alpha = 0.2)+ 
  scale_x_log10()+
  scale_y_log10()+ 
  geom_smooth(method = "lm", se = F, 
              col = "#C42126", size = 2) +
  labs(title = "Título", x= "", y="")

Gra1 + theme_classic()+ 
  theme(legend.position = "none") + 
  theme(text = element_text(family = "serif", size = 14)) 
  


#Gráfico1 de barras simples####
Alimentação <- c("Salada", "Carne", "Legumes", "Doces")  
Frequência <- c(50, 41, 32, 42)  
Data <- data.frame(Alimentação, Frequência)

#Fazer por partes 
#1ª parte
Gra2 <-  ggplot(Data, aes(y=Frequência, x= Alimentação, 
                             labe = Frequência)) + #Podemos colocar o fill aqui
  geom_bar(stat = "identity",  width = 0.75) #Ou colocar o fill aqui / Aqui podemos 
# colocar a largura das barras ", width = .75"

Gra2

#2ª parte
Gra3 <-  ggplot(Data, aes(y=Frequência, x= Alimentação, 
                              labe = Frequência, fill = Frequência)) +
  geom_bar(stat = "identity", width = 0.70) + 
  scale_y_continuous(limits = c(0, 55)) #Inserimos até onde queremos 
#que nossa escala vá

Gra3

#3ª parte

library(RColorBrewer)

??RColorBrewer

Gráfico2 <-  ggplot(Data, aes(y=Frequência, x= Alimentação, 
                              labe = Frequência)) +
  geom_bar(stat = "identity", width = .75, fill = "#2297E6") + 
  scale_y_continuous(limits = c(0, 56))+
  geom_text(aes(label = Frequência), vjust= -3, color="black",size=4)+ #, vjust=1.9, color="white",size=3.5
  xlab("Comidas_mensais") + ggtitle("Título")

Gráfico2 + theme_classic() 
Gráfico2  + theme_dark() 
#+  scale_fill_brewer(palette = "BuGn", type = "div")


#Com o banco do LAPOP 2019

summary(Lapop2019$q1)

Lapop2019$q1 <- as.factor(Lapop2019$q1)

#Qual pacote contem a função recode?
Lapop2019$sexo <- recode(Lapop2019$q1, "Homem" <- 1,
                         "Mulher" <- 2)

table(Lapop2019$sexo)

Gráfico2 <-  ggplot(Lapop2019, aes(y=q2, x=sexo, 
                               color= sexo, fill = sexo)) +
  geom_bar(stat = "identity", width = .75) + 
  scale_y_continuous(limits = c(0, 1550))+
  xlab("sexo") + ylab("Idade") + labs(title = "Título") 

Gráfico2  +
  theme_classic() + 
  geom_text(aes(label = q1), vjust=0.5, color="white",size= 3.5) 

#Provavelmente pelo fato de existirem muitos casos,  cada frame
#coloca todos os casos na mesma barra, então não conseguimos inserir
#o labs da barra
# SAÍDA 
summary(Lapop2019$q1)

Idades = c(748, 750)
Sexo = c("Homem", "Mulher")
DADOSX <- data.frame(Idades, Sexo)

Gráfico2 <-  ggplot(DADOSX, aes(y=Idades, x=Sexo, 
                                labe = Sexo, fill= Sexo)) +
  geom_bar(stat = "identity", width = .75) + 
  scale_y_continuous(limits = c(0, 800))+
  geom_text(aes(label = Idades), vjust=1.9, color="black",size= 3.5)+
  xlab("sexo") + labs(title = "Título")

Gráfico2 + theme_classic()

#Paramos aqui
#Boxplot####
#Ensinando do mais simples ao mais elaborado
y = seq(from = 1, to= 35, by = 0.2)
x = "casa"
DADOS <- data.frame(y, x)

#Função para colocar a média na 
Média <- mean(DADOS$y)
Média

boxplot(DADOS$y)

boxplot(DADOS$y, col = "#68F2A4",
        main = "Idades 2019")
points(Média, pch=8,col="red")

##Agora trabalhando com banco de dados 

summary(Lapop2019$q1) #variável sexo
summary(Lapop2019$q2) #idade


library(ggplot2)
library(RColorBrewer)

ggplot(Lapop2019, aes(x= sexo, y= q2)) + #Linha simples 
  geom_boxplot()


ggplot(Lapop2019, aes(x= sexo, y= q2, 
                  fill= q1))+  #inserções de cor conforme a categoria
  geom_boxplot() +
  stat_summary(fun.y=mean, geom="point",  #Linha para colocar média
               shape=20, size=7, color="red", fill="red") +
  theme(legend.position="top")+ #Aqui eu escolhi o lugar da leganda, se quiser mudar é só colocar a localização em inglês
  scale_fill_brewer(palette="Set6")  #Aqui mudamos a escala de cor

## Com pontos em cima 
ggplot(Lapop2019, aes(x= q1, y= q2, 
                  fill= q1))+  #inserções de cor conforme a categoria
  geom_boxplot() + 
  stat_summary(fun.y=mean, geom="point",  #Linha para colocar média
               shape=20, size=7, color="black", fill="red") +
  theme(legend.position="top") + geom_jitter(height = 0, width = 0.1, 
                                             color ="red") +
  labs()

#Para colocar média no ggplot
#https://www.r-graph-gallery.com/269-ggplot2-boxplot-with-average-value.html


# Gráfico de linhas  ####
##Desde a criação do data frame até a utilização de banco de dados
library(tidyr)
library(ggplot2)

#Exemplo de data frame
library(tidyverse)

Objc <- data.frame (Anos = c(2014,2016,	2018, 2020), 
                    v1=	c(6.37,	6.67,	6.89,	6.39),
                    v2	=	c(8.03,8.1,7.65,7.52),
                    v3 =	c(2.65,	3.88,	4.07, 3.59),
                    v2 =	c(3.85,	4.08,	4.4, 3.12)) 


Objc.1 <- Objc %>% gather(Variáveis, Valores, -Anos)

#Operador https://blog.curso-r.com/posts/2018-07-03-tutorial-pipe/

Gra3 <- ggplot(data = Objc.1, aes(x= Anos, y=Valores, 
                                  group = Variáveis))+
  geom_line(aes(colour = Variáveis), size = 2) + 
  geom_point(aes(shape = Variáveis))

Gra3

Gra3 + theme_bw()+ theme(legend.position = "bottom") 




#Local: "bottom", "top", "left", ou "right" 

##Merge----


Procedimento1 <- merge(Arg2019, Bra2019, by = "pais")
# Essa forma eu não costumo usar, mas é uma possibilidade

Procedimento2 <- merge(Arg2019, Bra2019, all= T)
#Esse é o procedimento que eu utilizo, somo os bancos utilizando
#o TRUE, as variáveis que são idênticas ele soma, as diferentes ele 
# mantem separado no banco. O
# 
#   
# União1 <- merge(Banco1, Banco2, all= T)
# União2 <- merge(Banco3, Banco4, all= T)
# UniãoTotal <- merge(União1, União2, all=T)
# 
#
# A outra forma seria assim:
# 
# União1 <- merge(Banco1, Banco2, all= T)
# União2 <- mege(União1, Banco3, all=T)
# No final das contas acaba usando a mesma quantidade de linhas


