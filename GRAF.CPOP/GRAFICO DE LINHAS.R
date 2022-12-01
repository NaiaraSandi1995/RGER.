library("ggplot2")
#GRAFICO DE LINHAS ( ex:postagens por dia)

bd<-read.table("clipboard", header = T, dec = ",")

ggplot(bd, aes(ID, med))+
  geom_line(alpha=.5)+
  scale_x_discrete(limits=bd$dia)+ #discrete pq a variavel eh discreta, limits= menor valor do dia ate maior valor do dia
  theme(axis.text.x = element_text(angle=90, hjust = 1, size = 6))+  #deixar os dias alinhados em 90 graus em baixo
  geom_vline(xintercept = 29, col="red")+
  geom_vline(xintercept = 60, col="red")+
  geom_vline(xintercept = 89, col="red")+
  geom_text(x=15, y=55000, label="julho")+
  geom_text(x=42, y=55000, label="agosto")+
  geom_text(x=75, y=55000, label="setembro")+
  geom_text(x=100, y=55000, label="outubro")+
  scale_y_continuous(limits=c(0, 60000), breaks = seq(from=0, to=60000,by=10000))
