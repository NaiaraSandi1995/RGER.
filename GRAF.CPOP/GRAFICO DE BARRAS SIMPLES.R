library("ggplot2")
#GRAFICO DE BARRAS 
bd<-read.table("clipboard", header = T, dec = ",") # Leia a tabela salva no cntrC ctrlV ( cipboard = salvo na area dde trabaho), hearder= primeira linha como nomes e nao como dados. Dec para ler vigulas como casa decimal

ggplot(bd, aes(mês, Total))+
  geom_bar(stat = "identity",position="dodge", alpha=.5)+ #stat = que estatística vc quer;"identity = soma" , alpha=transparencia
  geom_text(aes(label=Total), vjust=-1,position = position_dodge(.9))+ # PEGAR o valor que cada barra possui
  theme(axis.text.y=element_blank(), axis.ticks.y=element_blank())+ #Tirar as informações do eixo y pq elas ja estao em cima do grafico 
  labs(title = "Número de postagens por mês em 2018 - G1", subtitle = "Facebook", caption ="Fonte: @cpop", x="mês", y="número de posts") #informações entorno do graico

  
  
  