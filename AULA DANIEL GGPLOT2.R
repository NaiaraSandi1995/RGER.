##AULA GGPLO2 PARA O DANIEL ####

#Cores: https://color.adobe.com/pt/create/color-wheel

#Gráfico1 de barras simples####
Alimentação <- c("Salada", "Carne", "Legumes", "Doces")  
Frequência <- c(50, 41, 32, 42)  
Data <- data.frame(Alimentação, Frequência)

#Fazer por partes 
#1ª parte
Gráfico <-  ggplot(Data, aes(y=Frequência, x= Alimentação, 
                              labe = Frequência)) + #Podemos colocar o fill aqui
  geom_bar(stat = "identity") #Ou colocar o fill aqui / Aqui podemos 
# A largura das barras ", width = .75"

Gráfico

#2ª parte
Gráfico1 <-  ggplot(Data, aes(y=Frequência, x= Alimentação, 
                              labe = Frequência, fill = Frequência)) +
  geom_bar(stat = "identity", width = .25) + 
  scale_y_continuous(limits = c(0, 50)) #Inserimos até onde queremos 
#que nossa escala vá

Gráfico1

#3ª parte

Gráfico2 <-  ggplot(Data, aes(y=Frequência, x= Alimentação, 
                               labe = Frequência)) +
  geom_bar(stat = "identity", width = .75, fill = "#2297E6") + 
  scale_y_continuous(limits = c(0, 51))+
  geom_text(aes(label = Frequência), vjust=2.5, color="white",size=4)+ #, vjust=1.9, color="white",size=3.5
  xlab("Comidas_mensais") + ggtitle("Título")
Gráfico2 + theme_classic() 
Gráfico2 + theme_gray()

#Com o LAPOP

summary(X2019$q1)

Gráfico2 <-  ggplot(X2019, aes(y=q2, x=q1, 
                              labe = q1, fill= q1)) +
  geom_bar(stat = "identity", width = .75) + 
  scale_y_continuous(limits = c(0, 1550))+
  xlab("sexo") + ylab("Idade") + labs(title = "Título")
Gráfico2 + theme_classic() 


#geom_text(aes(label = q1), vjust=0.5, color="white",size= 3.5) + 
#Provavelmente pelo fato de existirem muitos casos, o cada frame
#coloca todos os casos na mesma barra, então não conseguimos inserir
#o labs da barra
# SAÍDA 
summary(X2019$q1)

Idades = c(748, 750)
Sexo = c("Homem", "Mulher")
DADOSX <- data.frame(Idades, Sexo)

Gráfico2 <-  ggplot(DADOSX, aes(y=Idades, x=Sexo, 
                               labe = Sexo, fill= Sexo)) +
  geom_bar(stat = "identity", width = .75) + 
  scale_y_continuous(limits = c(0, 800))+
  geom_text(aes(label = Idades), vjust=1.9, color="white",size= 3.5)+
  xlab("sexo") + labs(title = "Título")
Gráfico2 + theme_classic()

#Boxplot####

#Ensinando o mais simples
#https://www.ufrgs.br/wiki-r/index.php?title=Gr%C3%A1fico_Boxplot
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

summary(X2019$q1) #variável sexo
summary(X2019$q2) #idade

X2019$q1 <- as.factor(X2019$q1)

library(ggplot2)
library(RColorBrewer)

ggplot(X2019, aes(x= q1, y= q2)) + #Linha simples 
  geom_boxplot()

 
ggplot(X2019, aes(x= q1, y= q2, 
                       fill= q1))+  #inserções de cor conforme a categoria
  geom_boxplot() + ggtitle("Coloque o título")+
  stat_summary(fun.y=mean, geom="point",  #Linha para colocar média
               shape=20, size=7, color="red", fill="red") +
  theme(legend.position="top")+ #Aqui eu escolhi o lugar da leganda, se quiser mudar é só colocar a localização em inglês
  scale_fill_brewer(palette="Set6")  #Aqui mudamos a escala de cor

## Com pontos em cima 
ggplot(X2019, aes(x= q1, y= q2, 
                  fill= q1))+  #inserções de cor conforme a categoria
  geom_boxplot() + ggtitle("Coloque o título")+
  stat_summary(fun.y=mean, geom="point",  #Linha para colocar média
               shape=20, size=7, color="black", fill="red") +
  theme(legend.position="top") + geom_jitter(height = 0, width = 0.1, 
                                             color ="red")

#Para colocar média no ggplot
#https://www.r-graph-gallery.com/269-ggplot2-boxplot-with-average-value.html



# Gráfico de linhas  ####
##Desde a criação do data frame até a utilização de banco de dados
library(tidyr)
library(ggplot2)

#Exemplo de data frame
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


ggplot(Objc.1, aes(x = Anos, y = Valores)) +
  geom_line() +
  facet_wrap(~ Variáveis)

#Local: "bottom", "top", "left", ou "right" 

##Merge----


Procedimento1 <- merge(Arg2019, Bra2019, by = "pais")
# Esse procedimento 1, é o que o Ednaldo costuma usar, para 
# o meu caso não deu certo, porque as minhas observações eram 
# simplesmente apagadas, mas deixo aqui a possibilidade se 
# você quiser testar.

Procedimento2 <- merge(Arg2019, Bra2019, all= T)
#Esse é o procedimento que eu utilizo, somo os bancos utilizando
#o T, as variáveis que são idênticas ele soma, as diferentes ele 
# mantem separado no banco. Ou seja, se seu interesse for analisar 
# alguma coisa específica envolvendo 5 variáveis, não se preocupe, 
# porque essas variáveis serão somadas, basta que você verifique 
# se o nome delas está igual, se não estiver renomeia. 
# 
# 
# Agora o que eu te expliquei por áudio é o procedimento de 
# somar as variáveis assim:
#   
# União1 <- merge(Banco1, Banco2, all= T)
# União2 <- merge(Banco3, Banco4, all= T)
# UniãoTotal <- merge(União1, União2, all=T)
# 
# Como eu te disse, eu acho que esse é melhor jeito, apesar
# de dessa forma aparecerem mais variáveis, e eu não sei o motivo, 
# você pode testar desse jeito e verificar, mas foi assim q eu achei 
# melhor para depois analisar as descritivas, por exemplo. 
# A outra forma seria assim:
# 
# União1 <- merge(Banco1, Banco2, all= T)
# União2 <- mege(União1, Banco3, all=T)
# No final das contas você acaba usando a mesma quantidade de linhas
# e depois, no meu caso, não consegui rodar as descritivas, mas os testes 
# de regressão da certo usando as 2 formas.








