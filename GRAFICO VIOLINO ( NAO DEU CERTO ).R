library("ggplot2")
#GRAFICO DE violin ( g1 esta compartilhando link de quem ?)

bd<-read.table("clipboard", header = T, dec = ",")

ggplot(bd, aes(link, coment))+
  geom_violin(trim=F)+
  stat_summary(fun.y=median, geom="points", size=4, shape=sem)+
  geom_point(aes(link, coment, shape=sem), size=3, alpha=.5)
  