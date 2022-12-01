library("ggplot2")
library("ggcorrplot")
#GRAFICO DE CORRELAÇÃO 

bd<-read.table("clipboard", header = T, dec = ",")

ggcorrplot(bd, method = "square", type ="Tower", la b=T, lab_size= 5)+
  scale_fill_gradient2(low="red", high = "blue", mid="white", midpoint = 0, limit= c(-1,1), space="lab", name="")

  