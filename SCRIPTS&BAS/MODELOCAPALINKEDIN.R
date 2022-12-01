##Pacotes####

library(tm)
library(SnowballC)
library(wordcloud)



##Nuvem1####
##Primeiro, precisamos criar um corpus:
Nuvem1 <- Corpus(VectorSource(Pasta1))
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
wordcloud(Nuvem1,max.words=30) #Versão simples

#Mais elaborado
wordcloud(Nuvem1,max.words=50,colors=c("#B31B2D","#805358",
                                        "#DA39E6",
                                        "#CFE974","black",
                                        "#B3AD1B"))

wordcloud (Nuvem1,
           max.words=50,
           random.order = FALSE,
           rot.per = 0.95,
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


par(bg ="black")
wordcloud (Nuvem1, 
           max.words=45, random.order = FALSE,
           rot.per = 0.35,
           col= terrain.colors(length(Nuvem1) ,
                               alpha=0.9),
           backgroundColor = "darkcyan", 
           scale=c(2,0.7),
           min.freq = 5)

wordcloud2(Pasta3)
wordcloud2(data=Pasta3, size=0.3, color='random-dark')

wordcloud2(Pasta3, size=1.6,
           color = "random-light", 
           backgroundColor = "grey")

wordcloud2(Pasta3, size = 0.2, shape = 'star',
           color = "random-light",
           backgroundColor = "grey")



wordcloud2(Pasta3,size=0.3, minRotation = -pi/6, 
           maxRotation = -pi/6, minSize = 10,
           rotateRatio = 1, color = "random-light", 
           backgroundColor = "grey")

