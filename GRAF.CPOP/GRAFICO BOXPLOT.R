library("ggplot2")
#GRAFICO DE BOXPLOT

bd<-read.table("clipboard", header = T, dec = ",")

ggplot(bd, aes(tip,engaj))+
  geom_boxplot(notch=F, varwidth = T, alpha=.5)+
  stat_summary(fun=median, geom="point", size= 3, shape=15, color="black")+
  geom_point(aes(tip, engaj, shape=sem), size=3, alpha=.5)+
  geom_hline(yintercept = 4015, linetype = "dashed")+
  labs(title="Média de engajamento por tipo e postagem", subtitle = "Facebook", shape="Semana do mês", y="média", x="tipo de post", caption = "Fonte: @cpop")
  