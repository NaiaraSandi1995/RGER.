#Filtrar pelo ano
banco %>%
  filter(year == 2007)


alw6$V2

library(gapminder)
library(dplyr)


alw6 <- alw6 %>% 
  filter(V2 == 32)

save(alw6, file = "alw6.RData")

alw61 <- alw6 %>% 
  filter(V2 ==76)

save(alw6, file = "alw6.1.RData")

BancoArgBra <- merge(alw6, alw61, all = T)

save(BancoArgBra, file = "BancoArgBra.RData")


group_by(codigo)%>%
  mutate(item=paste0('Item ',row_number()))%>%
  pivot_wider(names_from=item, values_from=WDESCRICAO)

library(dplyr)
library(tidyr)
Banco2 <- BancoArgBra %>%
  group_by(TRUE)%>%
  mutate(item=paste0("países", row_number()))%>%
  pivot_wider(names_from=item, values_from= V2)

