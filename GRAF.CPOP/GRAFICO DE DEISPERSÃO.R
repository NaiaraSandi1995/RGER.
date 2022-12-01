library("ggplot2")
#GRAFICO DE dispersao

bd<-read.table("clipboard", header = T, dec = ",")

ggplot(bd, aes(comp, like))+
  geom_point()+
  geom_smooth(method="lm", se=F, col="red", linetype="dashed")+ #linha pontilhada
  geom_text(x=7000, y=0, label= "r = 0,596", col= "darkred", size=6)+
  geom_hline(yintercept = 2541,05)+
  geom_vline(xintercept = 256,17)
    
  
    
  

  