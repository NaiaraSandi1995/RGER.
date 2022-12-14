library("ggplot2")
#GRAFICO DE BARRAS POR CATEGORIAS 

bd<-read.table("clipboard", header = T, dec = ",") # Leia a tabela salva no cntrC ctrlV ( cipboard = salvo na area dde trabaho), hearder= primeira linha como nomes e nao como dados. Dec para ler vigulas como casa decimal

ggplot(cwb, aes(name_neighborhood, pessoas))+
  geom_bar(stat = "identity", position="dodge", alpha=.5)+ #stat = que estat?stica vc quer;"identity = soma" , alpha=transparencia, positiondodge= barras laterais
  geom_text(aes(label=pessoas), position = position_dodge(.9), vjust=-2)+ #Position_dodge=texto tambem tem que ser lateral PEGAR o valor que cada barra possui
  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank())+ #Tirar as informa??es do eixo y pq elas ja estao em cima do grafico 
  theme(legend.position = "bottom")+ #colocar a legenda paara baixo
  labs(title = "N?mero de postagens por m?s em 2018 - G1", subtitle = "Facebook", caption ="Fonte: @cpop", x="m?s", y="n?mero de posts") #informa??es entorno do grafico
