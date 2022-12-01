#Nuvens de palavras####


#wordcloud mais simples####
##Pacotes####

library(tm)
library(SnowballC)
library(wordcloud)

#Comentário:

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

#Mais elaborado 1
wordcloud(Nuvem1,max.words=XXX,colors=c("#B31B2D","#805358",
                                        "#DA39E6",
                                        "#CFE974","black",
                                        "#B3AD1B"))

#Mais elaborado 2
wordcloud (Nuvem1,
           max.words=50,
           random.order = FALSE,
           rot.per = 0.35,
           colors = brewer.pal(8,'Dark2'),
           backgroundColor = "darkcyan", 
           scale = c(2,0.7))


##Adicionais####

#title("Ocupações femininas 2008"
#scale=c(5,0.5)


##Outras possibilidades 
#Letra: 
#vfont=c("gothic english","plain")
# vfont=c("script","plain") #Letra de mão
#Outro tipo de cor (9,"BuGn")
# Para deixar o fundo preto: par(bg ="black")


#Mais elaborado 2
par(bg ="white")
wordcloud (Nuvem1, 
           max.words=45, random.order = FALSE,
           rot.per = 0.35,
           col= terrain.colors(length(Nuvem1) , alpha=0.9),
           backgroundColor = "darkcyan", 
           scale=c(2,0.7),
           min.freq = 5)

#PARA USAR 
#wordcloud2####
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


