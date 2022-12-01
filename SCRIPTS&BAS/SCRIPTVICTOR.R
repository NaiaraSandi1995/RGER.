#Nuvens de palavras com frequência####
#Pacote wordcloud2

library(wordcloud2)

#model simples
wordcloud2(data=frases, size=0.3, color='random-light')

#Opção de cor de fundo
#random-light
#random-dark

#modificando o modelo
#1
wordcloud2(frases, size=0.1, 
           color=rep_len( c("#730C85","#5EE063",
                            "#254B00","#076ACF"), 
                          nrow(frases) ) )
#2
wordcloud2(frases, size=1.6,
           color = "random-light", 
           backgroundColor = "grey")
#3
wordcloud2(frases, size = 0.2, shape = 'star',
           color = "random-light",
           backgroundColor = "grey")

#modelo usado
wordcloud2(frases, size=7, minRotation = -pi/80, 
           maxRotation = -pi/80, minSize = 3,
           rotateRatio = 0,
           fontWeight = "bold")

#modelo PARA A CRIAÇÃO DE VETOR DE COR

colorVec = rep(c('red', 'skyblue', "grey"))
wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")

#modelo não usado
wordcloud2(frases, size=1, minRotation = -pi/80, 
           maxRotation = -pi/80, minSize = 0,
           rotateRatio = 0,
           color=colorVec,
           fontWeight = "bold")



