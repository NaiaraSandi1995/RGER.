ggplot(Objc.1, aes(x = Anos, y = Valores)) +
  geom_line() +
  facet_wrap(~ Variáveis)


#DISPERSÃO1####
install.packages(ggplot2)
library(ggplot2)
# library
library(ggplot2)

# The iris dataset is provided natively by R
head(teste)

# basic scatterplot
GRA1 <- ggplot(teste, aes(x=Utilização, y=Nota, 
                          color =Utilização , 
                          size = Nota)) + 
  geom_point(shape = 21, size = 3,
             fill = "black", stroke = 2, alpha = 0.2)+
  geom_count(alpha=0.3)  + theme_classic()

Gra2 <- GRA1 + theme(text = element_text(family = "serif", size = 14),
                     rect = element_blank(),
                     panel.grid = element_blank(),
                     title = element_text(color = "black"),
                     axis.line = element_line(color = "black")) +
  theme(legend.position="none")


Gra2 +
  annotate("text", x=0, y=100, label= "", ) + 
  annotate("text", x =0, y=100,  
           label = "")



Gra2<- Gra2 +
  xlim(0,1)+
  ylim(0,10) 

Gra2 +  scale_y_continuous(
  labels = scales::number_format(accuracy = 0.01,
                                 decimal.mark = ','))

#Dispersão2####

#Banco IRIS 
iris$Sepal.Width
iris$Petal.Length
ggplot(iris, aes(x = sqrt(Sepal.Width), y =  Petal.Length^3))+ 
  geom_point() + geom_smooth(method =  "lm", se = F)

ggplot(iris, aes(x = Sepal.Width^5, y =  Petal.Length^20))+ 
  geom_point() + geom_smooth(method =  "lm", se = F)


#Banco longley
names(longley)


# [1] "GNP.deflator" "GNP"          "Unemployed"   "Armed.Forces" "Population"  
# [6] "Year"         "Employed"    

gra1 <- ggplot(longley, aes(x = Year, y =  Population*500, color = Employed, 
                            size = Population))+ 
  geom_point(shape = 21, size = 5,
             fill = "black", stroke = 2, alpha = 0.2) + 
  geom_smooth(method =  "lm", se = T, col = "green") +
  geom_count(alpha=0.3)  + theme_classic()

gra1 + theme(text = element_text(family = "serif", size = 14),
             rect = element_blank(),
             panel.grid = element_blank(),
             title = element_text(color = "#8b0000"),
             axis.line = element_line(color = "black")) +
  theme(legend.position="none")

#+ 
#geom_quantile(quantiles =
#              c(0.05, 0.50, 0.95))


#Gráfico de gatinhos####
#Habilitar o R a baixar pacotes de fora do R
install.packages("remotes")
library(remotes)

install_github("R-CoderDotCom/ggcats@main")
library(R-CoderDotCom/ggcats@main)
library(ggcats)

ggplot(sen) + geom_cat(aes(vgasto, votos), size =3,
                       cat = "hipster")
#nyancat" "pusheen"  "colonel" "venus" "toast"
#os tipos

ggplot(sen) + geom_cat(aes(
  log.vgasto, log.votos), 
  cat = "venus", size = 3)

#Gráfico####
library(ggplot2)
ggplot(data = sen, aes(x = vgasto, 
                       y = votos, 
                       fill = vgasto, 
                       col = vgasto 
)) + 
  geom_point(shape = 21, size = 2,
             fill = "black", 
             stroke = 2, alpha = 0.2)+ 
  scale_x_log10()+
  scale_y_log10()+ 
  geom_smooth(method = "lm", se = T, 
              col = "#C42126", size = 2) + 
  labs(title = "Título") + 
  theme(legend.position = "none"
  )
# Gráfico de linhas  ####
library(tidyr)
library(ggplot2)

Objc <- data.frame (Anos = c(2014,2016,	2018, "Médiaf."), 
                    Brasil=	c(6.37,	6.67,	6.89,	6.39),
                    Uruguai	=	c(8.03,8.1,7.65,7.52),
                    Guatemala =	c(2.65,	3.88,	4.07, 3.59),
                    El_Salvador =	c(3.85,	4.08,	4.4, 3.12)) 


Objc.1 <- Objc %>% gather(Países, Médias_tolerância, -Anos)

Gra3 <- ggplot(data = Objc.1, aes(x= Anos, y= Médias_tolerância, 
                                  group = Países))+
  geom_line(aes(colour = Países), size = 2) + 
  geom_point(aes(shape = Países))

Gra3


Gra3 + theme_bw()+ theme(legend.position = "bottom")

#Local: "bottom", "top", "left", ou "right" 



#Gráficos de barras sobrepostas####

Religiões <- c(rep(c("Católico", "Protestante", "Outras", "Ateu")))  
TolHomo <- c(rep(c("Intolerante", "Neutro", "Tolerante")))
Frequência <-c( 6385,2955,1837,1111,2707, 668,398, 531,  5955, 1279, 919, 1939)
Data <- data.frame(Religiões, TolHomo, Frequência)

Gráfico <- ggplot(Data, aes(x = Religiões, y = Frequência,
                            fill = TolHomo, label = Frequência)) +
  geom_bar(stat = "identity") +
  geom_text(size = 3, position = position_stack(vjust = 0.5))

Gráfico

Gráfico + theme_blank() + labs(x = "Denominações religiosas") +
  theme(legend.position = "bottom")

#Extras####
#Para colocar a legenda
#geom_text(size = 2, position = position_stack(vjust = 0.5))
#Para colocar cor
library(RColorBrewer) # Tem um site 
#scale_fill_brewer(palette = 2, type = "seq")
#Para dados divergentes: type = "div"; 
#para dados em sequência: type = "seq"; para dados 
#categóricos em geral: type = "qual".

#Caso o Ednaldo peça pra tirar as cores:
#+ 
#  scale_color_manual(values = c(El_salvador = 'red', 
#                                Guatemala = 'grey',
#                                Haiti = 'red',
#                                Honduras= 'red')) +
#  guides(colour = 'none')

#Também posso pintar os pontinhos com cores diferentes, ao invés de preto
# é só inserir em geom_point(aes(color = Países))


#Gráfico1 de barras simples####
Religiões <- c("Católico", "Protestante", "Outras", "Ateu")  
Frequência <- c(15381, 5041, 3260, 3642)  
Data2 <- data.frame(Religiões, Frequência)

Gráfico2 <-  ggplot(Data2, aes(y=Frequência, x= Religiões, 
                               labe = Frequência)) +
  geom_bar(stat = "identity", width = .75, fill = "#848A62") + 
  scale_y_continuous(limits = c(0, 16000))+
  geom_text(aes(label = Frequência), vjust=1.6, color="white",size=3.5)+
  xlab("Denominações religiosas")
Gráfico2 + theme_classic()

#Nuvens de palavras####
#Se queremos analisar apenas a profissão das mulheres,
#então vamos criar um banco extraindo essas informações 
#nome <- Banco[Banco$sexo =="CATEGORIA", c("profissão")] 

table(Banco2008Vereadores$descricao_sexo)
#FEMININO MASCULINO 
#52459    192648 
table(Banco2008Vereadores$descricao_ocupacao)
table(Banco2008Vereadores$ano_eleicao)


Prof.fem <- Banco2008Vereadores [Banco2008Vereadores$descricao_sexo ==
                                   "FEMININO", c("descricao_ocupacao", 
                                                 "ano_eleicao")] 
#Criamos o banco com 2 variáveis, porque se tiver menos do que 2 não crirá 
#um banco, acontece que nós precisamos de apenas uma, a ocupação então vamos
#usar a função subset

subset()

Banco <- subset (Prof.fem, select =c(descricao_ocupacao))
#Pronto agora criamos esse banco apenas com as profissões
#das mulheres, agora vamos salvar esse banco

save(Banco, file = "BancoF2008.RData")

#Para verificar as maiores frequências absolutas
sort(table(BancoC2$Descrição_Ocupação), decreasing = T)


###
#Salvar o banco em em xls, abrir o banco
write_excel_csv2(Banco, "Banco1.xls")#Arrumar o banco e os nomes
#das primeiras profissões
#SALVAR O BANCO EM XLSX (última opção do save no excel)

#Agora é possível abrir o banco no excel e pedir para mudar
#os nomes das profissões que eu quero. - No caso pela ordem
#da frequência
####

##Pacotes####

library(tm)
library(SnowballC)
library(wordcloud)

##Nuvem1####
##Primeiro, precisamos criar um corpus:
Nuvem1 <- Corpus(VectorSource(BancoC2))
##Em seguida, vamos converter
#o corpus em um documento de texto simples.
Nuvem1 <- tm_map(Nuvem1, PlainTextDocument)

#Então, vamos remover toda a pontuação e palavras irrelevantes. 
#Stopwords são comumente usadas no português, como:  eu, meu e etc.
Nuvem1 <- tm_map(Nuvem1, removePunctuation) 
Nuvem1 <- tm_map(Nuvem1, removeWords, stopwords('pt')) 

#Em seguida iremos verificar as palavras e seus sinônimos 
#(Ex: Aprendizagem -> aprender, caminhou -> caminhada, etc.). 
#Isto irá garantir que as diferentes formas da palavra em 
#questão serão convertidos para a mesma forma e 
#plotadas apenas uma vez no wordcloud.
Nuvem1 <- tm_map(Nuvem1, stemDocument)

#Agora, criamos a wordcloud, e inserir itens a ele.
wordcloud(Nuvem1, max.words = XXX) #Versão simples

#Mais elaborado
wordcloud(Nuvem1,max.words=XXX,colors=c("#B31B2D","#805358",
                                        "#DA39E6",
                                        "#CFE974","black",
                                        "#B3AD1B"))

wordcloud (Nuvem1,
           max.words=50,
           random.order = FALSE,
           rot.per = 0.35,
           colors = brewer.pal(8,'Dark2'),
           backgroundColor = "darkcyan", 
           scale = c(2,0.7))

#title("Ocupações femininas 2008")

##Adicionais####

#title("Ocupações femininas 2008"
#scale=c(5,0.5)
#Para tirar problema de gramática enc2native(BANCO)

##Outras possibilidades 
#Letra: 
#vfont=c("gothic english","plain")
# vfont=c("script","plain") #Letra de mão
#Outro tipo de cor (9,"BuGn")
# Para deixar o fundo preto: par(bg ="black")


par(bg ="white")
wordcloud (Nuvem1, 
           max.words=45, random.order = FALSE,
           rot.per = 0.35,
           col= terrain.colors(length(Nuvem1) , alpha=0.9),
           backgroundColor = "darkcyan", 
           scale=c(2,0.7),
           min.freq = 5)



##Descritivas
##Análise do banco antes da criação da nuvem####
Banco$descricao_ocupacao[3]
#[1] "SECRETÁRIO E DATILÓGRAFO"

#Acesso às observações 2, 3 e 7
Banco$descricao_ocupacao[c(2, 3, 7)]
#[1] "PROFESSOR DE ENSINO MÉDIO"       "SECRETÁRIO E DATILÓGRAFO"       
#[3] "PROFESSOR DE ENSINO FUNDAMENTAL"

## Modificando valores de vetores
alt2 <- alunos$alt[c(2, 3, 7)]  ## criando uma réplica de alunos$alt
alt2[c(2, 3, 7)] <- c(1.5, 1.72, 1.8)  ## alterando as observações 2, 3 e 7
prop.table(table(alunos$sex))

#Para verificar as maiores frequências absolutas
sort(table(BancoC2$Descrição_Ocupação), decreasing = T)

#Para mudar o nome 
levels(Banco$Variavel) <- c("novonome1", "novonome2") 
levels(Banco$variavel)  ## mostrando os novos nomes, já alterados na variável

#NUVEMwordcloud2####
#Nuvens de palavras com frequência

library(wordcloud2)
wordcloud2(frases)
wordcloud2(data=frases, size=0.3, color='random-light')

#random-light
#random-dark
wordcloud2(frases, size=0.1, 
           color=rep_len( c("#730C85","#5EE063",
                            "#254B00","#076ACF"), 
                          nrow(frases) ) )

wordcloud2(frases, size=1.6,
           color = "random-light", 
           backgroundColor = "grey")

wordcloud2(frases, size = 0.2, shape = 'star',
           color = "random-light",
           backgroundColor = "grey")



wordcloud2(frases, size=0.5, minRotation = -pi/80, 
           maxRotation = -pi/80, minSize = 0,
           rotateRatio = 0,
           color=colorVec)

#EXEMPLO PARA A CRIAÇÃO DE VETOR DE COR

colorVec = rep(c('red', 'skyblue'), length.out=nrow(demoFreq))
wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")


##
#Boxplot####

#Ensinando mais simples
#https://www.ufrgs.br/wiki-r/index.php?title=Gr%C3%A1fico_Boxplot
#Função para colocar a média na 
Média <- mean(Lapop2019$q2)


boxplot(Lapop2019$q2, col = "#68F2A4",
        main = "Idades 2019")
points(Média, pch=15,col="red")

boxplot(Lapop_2012$idnum)

summary(Lapop_2012$q1)
Lapop_2012$q1 <- as.factor(Lapop_2012$q1)


plot(Lapop_2012$q1, Lapop_2012$q2)

library(ggplot2)
ggplot(Lapop_2012, aes(x= q1, y= idnum))+  #Linha simples
  geom_boxplot()

ggplot(Lapop_2012, aes(x= q1, y= idnum, 
                       fill= q1))+  #inserções de cor conforme a categoria
  geom_boxplot() + ggtitle("Coloque o título")+
  stat_summary(fun.y=mean, geom="point",  #Linha para colocar média
               shape=20, size=7, color="red", fill="red") +
  theme(legend.position="top")+ #Aqui eu escolhi o lugar da leganda, se quiser mudar é só colocar a localização em inglês
  scale_fill_brewer(palette="Set6") #Aqui mudamos a escala de cor

#Tamanho
table(Lapop_2012$tamano)
Lapop_2012$tamano <- as.factor(Lapop_2012$tamano)

ggplot(Lapop_2012, aes(x= tamano, y= idnum))+  #Linha simples
  geom_boxplot()


ggplot(Lapop_2012, aes(x= tamano, y= idnum, 
                       fill= tamano))+  #inserções de cor conforme a categoria
  geom_boxplot() + ggtitle("Coloque o título")+
  stat_summary(fun.y=mean, geom="point",  #Linha para colocar média
               shape=20, size=7, color="red", fill="red") +
  theme(legend.position="top")+ #Aqui eu escolhi o lugar da leganda, se quiser mudar é só colocar a localização em inglês
  scale_fill_brewer(palette="Set6") #Aqui mudamos a escala de cor


ggplot(Lapop_2012, aes(x= q2, y= idnum))+  #Linha simples
  geom_boxplot()


## Exemplo

#Para colocar média no ggplot
#https://www.r-graph-gallery.com/269-ggplot2-boxplot-with-average-value.html

# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)

data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), 
        rep("C",20), rep('D', 100)  ),
value=c(rnorm(500, 10, 5), rnorm(500, 13, 1), 
        rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1)))


# Plot
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)) +
  ggtitle("A boxplot with jitter") +
  xlab("")

# Boxplot basic
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Basic boxplot") +
  xlab("")

# Violin basic
data %>%
  ggplot( aes(x=name, y=value, fill=name)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="A") +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")


#Coefplot####
obj1 <- coefplot(Teste1beta, title = "2008",
                 xlab = "Valor",
                 ylab = "Coefficient",
                 color = "black",
                 outerCI = T,
                 innerCI = 5)

obj1 + theme_classic() + geom_point(size=3, pch=21, fill="red",
                                    alpha=105) 



#FUNÇÕES ####
#Para arredondar valores de modelo

round(summary(ModelTol.Denom.TNaH)$tTable,dig=3)

#Para exponenciar valores de um modelo
exp(coef(GLM.3))

#PAra montar modelos em html ou excel


stargazer(Model.Comp1, type="html",
          title = "Teste",
          dep.var.labels=c("TolerHomo"),
          covariate.labels=c("Denom", 
                             "AtRelig",
                             "IntRelig", 
                             "Dem",
                             "ConfInt",
                             "Ed\\_sup",
                             "Ed\\_sup",
                             "Idade",
                             "Sexo",
                             "TNaH",
                             "Desemprego"), 
          out="Model.Comp1.htm", apply.coef = exp, digits = 2, p.auto = T) 

#
#coração####
dat<- data.frame(t=seq(0, 2*pi, by=0.1) )
xhrt <- function(t) 16*sin(t)^3
yhrt <- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
dat$y=yhrt(dat$t)
dat$x=xhrt(dat$t)
with(dat, plot(x,y, type="l", ylab = "Turma de 2020", xlab = "Metologia quanti"))
title (main= "O R pode ser legal") 
with(dat, polygon(x,y, col="red"))
points(c(10,-10, -15, 15), c(-10, -10, 10, 10), pch=169, font=5)

#
#Cartinha
library(Cairo)

clubs <- expression(symbol('\247'))
hearts <- expression(symbol('\251'))
diamonds <- expression(symbol('\250'))
spades <- expression(symbol('\252'))
csymbols <- c(clubs, hearts, diamonds, spades)

plot( 0, xlim=c(0,5), ylim=c(0,2), type="n" )
clr <- c("black", "red", "red", "black") 
for (i in 1:4) {
  hline <- function( yloc, ... ) 
    for (i in 1:length(yloc)) 
      lines( c(-1,6), c(yloc[i],yloc[i]), col="gray")  
  hline(0.9); 
  hline(1.0);
  hline(1.1);
  hline(1.2)  
  text( i, 1, csymbols[i], col=clr[i], cex=5 )  
  text( i, 0.5, csymbols[i], col=clr[i] ) }

# Also try this
plot(1,1)
text(x=1+0.2*cos(seq(0, 2*pi, by=.5)), 
     y=1+0.2*sin(seq(0, 2*pi, by=.5)), 
     expression(symbol('\251') ) )

#GráficosRegressão####
#Gráficos para analisar a normalidade da regressão linear

library(ggplot2)
library(ggfortify)
obj1 <- autoplot(modelo1,
                 which = 1:4,
                 nrow = 2,
                 ncol = 2
) 

obj1 + theme_classic()  

#REMOVE NAS####
library(tidyr)
library(dplyr)
#Remove NAs apenas da coluna TolerHomoP
BancoFinal <- drop_na(BancoFinal, TolerHomoP)
BancoFinal <- drop_na(BancoFinal, Denom)

#Mudar de ponto para vírgula####
options(scipen = 1000, digits = F, OutDec = ",")

#Como excluir linhas no r####

X2008_APTOS<- X2008_APTOS[-3, ] 
# deleta a terceira linha
#Essa é uma maneira de fazer a exclusão


#Colocar ID####
library(scales)

Banco2008Vereadores$idade_data_eleicao
Banco2008Vereadores$descricao_sexo

Banco2008Vereadores$Id <- seq(from= 1, to=245107, by =1)
Banco2008Vereadores$Id2 <- 1

ggplot(Banco2008Vereadores, aes(x=Id , 
                                y= idade_data_eleicao,
                                fill= codigo_sexo, 
                                group = descricao_sexo, 
                                color = descricao_sexo))+
  geom_line()


Banco2008Vereadores$codigo_sexo
data %>% 
  arrange(a)

Banco2008Vereadores <- Banco2008Vereadores %>% 
  arrange(idade_data_eleicao)



ggplot(Banco2008Vereadores) +
  geom_line(aes(x= idade_data_eleicao, y = constanteid), 
            stat = "identity") +
  
  
  #criar uma variável contínua com valor 1 e depois somar 
  #, inherit.aes = FALSE
  
  ?count

#Gráficos de seção####

# Create test data.
data <- data.frame(
  category=c("Sim", "Não"),
  count=c(4, 24)
)

# Compute percentages
data$fraction <- data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax <- cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin <- c(0, head(data$ymax, n=-1))

# Compute label position
data$labelPosition <- (data$ymax + data$ymin) / 2

# Compute a good label
data$label <- paste0(data$category, "\n valor: ", data$count)

# Make the plot
Obj <- ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_label( x=3.5, aes(y=labelPosition, label=label), size=4) +
  scale_fill_brewer(palette=4) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")

Obj + labs(title = "Possui local para aguardar? ", 
           caption = "Delegacias,2021")


#Anotação nas barras####
#Gráfico de barras
+
  annotate("text", x=1, y=16, label= "33%", ) + 
  annotate("text", x =2, y=33,  
           label = "66%")

#RecortandoBanco####
#tidyverse
#Salvando 
#Ordenando

MaisRicos2008 <- Banco2008Vereadores %>%
  filter(receitas_total > 1837) 

save(MaisRicos2008, file = "MaisRicos2008.RData")


MaisRicos2008[order("receitas_total", decreasing = TRUE),]




#GraficoComLegendaAjustada####
+
#Gráficos vários e pequenos####

#Gráfico de barras simples
library(tidyr)
library(ggplot2)



Dani <-ggplot (ID_M, aes(y=ID, x = ano)) + 
  geom_bar(stat= "identity", alpha = 0.5) + #Criação do objeto com o banco
  facet_wrap(~ ID_M$CIDADE, nrow = 2) # Organização de todos os gráficos 
#em uma única projeção, com 2 linhas 

Dani + labs(y ="Índice de Democratização", x= "Ano") +  #Colocar títulos no rótulos
  theme_classic() +  theme(axis.text.x = 
                             element_text(angle = 90, 
                                          vjust = 0, size= 7,  hjust = 1)) #Colocar o tema, 
#E ajustar os angulos dos anos

#Gráfico mexendo####
#Descritiva2####

table(BancoFinal$pais)
table(BancoFinal$TolerHomo)
summary(BancoFinal$TolerHomo)
BancoFinal$TolerHomo <- as.factor(BancoFinal$TolerHomo)

BancoFinal$TolerHomoP <- recode(BancoFinal$TolerHomo, 
                                "Intolerante" <- c(1, 2, 3, 4,5), "Tolerantes" <- 
                                  c(6,7,8,9,10))

table(BancoFinal$TolerHomoP)
summary(BancoFinal$TolerHomoP)

save(BancoFinal, file = "BancoFinal.RData")

library(tidyr)
library(dplyr)
library(ggplot2)
#Remove NAs apenas da coluna TolerHomoP

BancoFinal <- drop_na(BancoFinal, TolerHomoP)
BancoFinal <- drop_na(BancoFinal, Denom)

#Recodificações para criação dos gráficos

table(BancoFinal$Denom)
BancoFinal$Denom <- as.factor(BancoFinal$Denom)
BancoFinal$Denom1 <- recode(BancoFinal$Denom,
                            "Catól" <- 1, "Protes." <- 2, "Outras." <- 3, 
                            "Ateu" <- 4)


table(BancoFinal$pais)

# 1    2    3    4    5    6    7    9   10   11   12   13   14   15 
# 1524 1500 1480 1516 1498 1471 1532 1513 1644 1502 1484 1594 1563 1471 
# 16   17   21   22 
# 1510 1502 1479 2144 

BancoFinal$PaisD <- recode(BancoFinal$pais, 
                           "México" <- 1, "Guat." <- 2, "ElSalv." <-3,
                           "Hondu." <- 4, "Nicar." <- 5, "Cost.R" <-6,
                           "Panamá" <- 7, "Ecuador" <- 9, "Bolívia" <- 10,
                           "Peru"<- 11, "Parag." <- 12, "Chile" <- 13, 
                           "Urug."<- 14, "Brasil" <- 15, "Venez." <-16,
                           "Argent." <- 17, "Rep.Dom." <- 21, "Haiti" <-22)

BancoFinal$PaisD <- as.factor(BancoFinal$PaisD)
table(BancoFinal$PaisD)

Gráfico <-  ggplot(BancoFinal, aes(x = TolerHomoP, 
                                   fill = Denom1)) +
  geom_bar(width = .75) + 
  labs(x ="Tolerância Homossexuais")


Gra2 <- Gráfico  +
  theme_grey() +
  transition_states(
    frame,
    transition_length = 2,
    state_length = 1) +
  ease_aes('sine-in-out')

  


Gra2 <- Gráfico  +
  theme_grey() + facet_wrap( ~ PaisD, nrow = 3) +
  theme(axis.text.x = 
          element_text(angle = 90, 
                       vjust = 0, size= 10,  hjust = 1, 
                       color = "black", family = "Times New 
             Roman")) +
  scale_fill_brewer(palette ="Paired", name= "Religião") 




Gra2 + 
  theme(text = element_text(
    family = "Times New Roman", size = 13))




library(RColorBrewer) # Tem um site 
#scale_fill_brewer(palette = 2, type = "seq")
#Para dados divergentes: type = "div"; 
#para dados em sequência: type = "seq"; para dados 
#categóricos em geral: type = "qual".

#Smooth barplot transition####
#Aqui é continuidade das linhas de cima, com gráficos que se movem
library(ggplot2)
library(gganimate)



# gganimate specific bits:
# transition_states(
#   frame,
#   transition_length = 2,
#   state_length = 1
# ) +
#   ease_aes('sine-in-out')


Gra2 + transition_states(
  frame,
  transition_length = 2,
  state_length = 1) +
  ease_aes('sine-in-out')



# libraries:
library(ggplot2)
library(gganimate)

# Make 2 basic states and concatenate them:
a <- data.frame(group=c("A","B","C"), values=c(3,2,4), frame=rep('a',3))
b <- data.frame(group=c("A","B","C"), values=c(5,3,7), frame=rep('b',3))
data <- rbind(a,b)  

# Basic barplot:
ggplot(a, aes(x=group, y=values, fill=group)) + 
  geom_bar(stat='identity')

# Make a ggplot, but add frame=year: one image per year
animated <- ggplot(data, aes(x=group, y=values, fill=group)) + 
  geom_bar(stat='identity') +
  theme_bw() +
  # gganimate specific bits:
  transition_states(
    frame,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')

ggplot

# Save at gif:
anim_save("animated.gif")


library(gifski)
library(png)    
animate(animated, duration = 5, fps = 20, 
        width = 200, height = 200, renderer = gifski_renderer())
