###Opções###
options(scipen = 999) #remove a exibição a notação científica
#Se os caracteres de texto estiverem sendo exibidos como caracteres especiais no lugar das letras
#acentuadas, clique em file -> "Reopen with encoding.." selecione "UTF-8" e depois clique em "ok"

###Pacotes###
#install.packages("ggplot2") #instala o pacote ggplot. Para quem possui a instalação do 
                            #Tidyverse, ele vem incluso.
#install.packages("RColorBrewer") #Instala um pacote de paleta de cores que pode ser usado em conjunto
                                 #com o Ggplot  


library(ggplot2) #carrega o ggplot na memória
library(RColorBrewer) #carrega o RColorBrewer na memória

###Base de Dados###
sen2018 <- read.csv2("sen2018.csv") #carrega a base de dados que iremos utilizar durante a aula
                                    #Esta base de dados contem todos os canditados ao senado nas
                                    #eleições gerais de 2018. Fonte: TSE.
###Análise Gráficas###
##Gráfico de Dispersão (Scatter Plot##
plot(sen2018$TOTAL_RECEITAS, sen2018$votos) #gráfico de dispersão do Rbase

dis <- ggplot(sen2018, aes(TOTAL_RECEITAS, votos)) #mapa estético do gráfico anterior
dis + geom_point() #objeto geométrico do gráfico

sen2018 <- subset(sen2018, votos > 0) #seleciona apenas os casos com votos > 0 (1 ou mais)

sen2018$logrec <- log(sen2018$TOTAL_RECEITAS) #transforma o total de receitas 
                                              #em uma base logarítmica

sen2018$logvot <- log(sen2018$votos) #transforma o total de votos em uma base logarítmica

dis <- ggplot(sen2018, aes(logrec, logvot)) #mapa estético com novas variáveis
dis + geom_point() #objeto geométrico

###Gráfico de Dispersão###
dis <- dis+geom_point() #salva no objeto "dis" o mapa estético e o objeto geométrico

##Alteração de elementos do gráfico##
#título, rótulos dos eixos x e y.

dis + labs(title = "Arrecadação e Votos Recebidos por Candidatos",
           subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
           x = "Log do Total de Receitas",
           y = "Log de Votos Recebidos",
           caption = "Fonte: Tribunal Superior Eleitoral")

##Temas##
#Classic#
dis + labs(title = "Arrecadação e Votos Recebidos por Candidatos",
           subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
           x = "Log do Total de Receitas",
           y = "Log de Votos Recebidos",
           caption = "Fonte: Tribunal Superior Eleitoral")+
           theme_classic()

#black and white
dis + labs(title = "Arrecadação e Votos Recebidos por Candidatos",
           subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
           x = "Log do Total de Receitas",
           y = "Log de Votos Recebidos",
           caption = "Fonte: Tribunal Superior Eleitoral")+
           theme_gray()

##Outros temas do ggplot##
theme_dark()
theme_grey()
theme_light()
theme_minimal()
theme_void()

##Adicionando a linha de regressão ao gráfico de dispersão
dis +  geom_smooth(method = lm)+
       labs(title = "Arrecadação e Votos Recebidos por Candidatos",
           subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
           x = "Log do Total de Receitas",
           y = "Log de Votos Recebidos",
           caption = "Fonte: Tribunal Superior Eleitoral")+
       theme_bw()

#Removendo o erro padrão da linha de regressão
dis +  geom_smooth(method = lm, se = F)+
  labs(title = "Arrecadação e Votos Recebidos por Candidatos",
       subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
       x = "Log do Total de Receitas",
       y = "Log de Votos Recebidos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()

##Adicionando um texto dentro do gráfico##
reg <- lm(logvot~logrec, data = sen2018) #definindo a fórmula da equação da reta

r2lab <- bquote(R^2~"="~.(round(summary(reg)$r.squared, 2))) #transformando o r2 em expressão

dis +  geom_smooth(method = lm)+
       labs(title = "Arrecadação e Votos Recebidos por Candidatos",
           subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
           x = "Log do Total de Receitas",
           y = "Log de Votos Recebidos",
           caption = "Fonte: Tribunal Superior Eleitoral")+
       annotate(geom = 'text', x = 6, y = 15.5, label = r2lab)+
       theme_bw()
       
##Alterando o tamanho do texto##
#Alterando todos os elementos textuais#
dis +  geom_smooth(method = lm)+
  labs(title = "Arrecadação e Votos Recebidos por Candidatos",
       subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
       x = "Log do Total de Receitas",
       y = "Log de Votos Recebidos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  annotate(geom = 'text', x = 6, y = 15.5, label = r2lab, size = 5)+
  theme_bw()+
  theme(text = element_text(size = 15))

#Alterando o tamanho de um elemento específico (valores dos eixos)
dis +  geom_smooth(method = lm)+
  labs(title = "Arrecadação e Votos Recebidos por Candidatos",
       subtitle = "Função Logarítmica do Total de Arrecadado pelos Votos Recebidos por Candidato",
       x = "Log do Total de Receitas",
       y = "Log de Votos Recebidos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  annotate(geom = 'text', x = 6, y = 15.5, label = r2lab, size = 5)+
  theme_bw()+
  theme(axis.text = element_text(size = 15))

#Outros elementos
axis.text.x #apenas os valores do eixo X
axis.text.y #apenas os valores do eixo y
axis.title #O rótulo dos eixos
axis.title.x #apenas o rótulo do eixo x
axix.title.y #apenas o rótulo do eixo y
plot.title #apenas o título do gráfico
legend.text #apenas título da legenda
legend.text #apenas os rórulos da legenda
#outras informações de elementos que podem ser alterados podem ser visualizadas 
#através do comando help("theme")

###Gráfico de Barras###
#Primeiro vamos criar uma variável para servir de marcador:
sen2018$cont <- 1

#Vamos plotar o número de candidatos dos 5 maiores no senado: MDB (15), PSD (11),
#PODE (9), PP (7) e PSDB (7)

#Podemos fazer isso de duas formas:
#A primeira é criando um novo data frame usando o subset
sen2018m5 <- subset(sen2018, SIGLA_PARTIDO == "MDB" | SIGLA_PARTIDO == "PSD" |
                             SIGLA_PARTIDO == "PODE" | SIGLA_PARTIDO == "PP" |
                             SIGLA_PARTIDO == "PSDB")
table(sen2018m5$SIGLA_PARTIDO)

#A outra forma é usando a função subset dentro do próprio ggplot. 

bar <- ggplot(subset(sen2018, SIGLA_PARTIDO == "MDB" | SIGLA_PARTIDO == "PSD" |
                      SIGLA_PARTIDO == "PODE" | SIGLA_PARTIDO == "PP" |
                      SIGLA_PARTIDO == "PSDB"), aes(SIGLA_PARTIDO, cont))
bar + geom_bar(stat = "identity")

#Alterando os elementos textuais
bar + geom_bar(stat = "identity") +
      labs(title = "Número de Candidatos por Partido",
           subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
           x = "Partido",
           y = "Número de Candidatos",
           caption = "Fonte: Tribunal Superior Eleitoral")+
           theme_bw()+
           theme(text = element_text(size = 15))

#Alterando as cores do Gráfico
bar + geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Número de Candidatos por Partido",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15))

#Atribuindo uma cor para cada partido (requer alteração no mapa estético)#
bar <- ggplot(subset(sen2018, SIGLA_PARTIDO == "MDB" | SIGLA_PARTIDO == "PSD" |
                       SIGLA_PARTIDO == "PODE" | SIGLA_PARTIDO == "PP" |
                       SIGLA_PARTIDO == "PSDB"), aes(SIGLA_PARTIDO, cont, fill = SIGLA_PARTIDO))
bar + geom_bar(stat = "identity") +
  labs(title = "Número de Candidatos por Partido",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15))

#removendo a legenda#
bar + geom_bar(stat = "identity") +
  labs(title = "Número de Candidatos por Partido",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15), legend.position = "none")

#A opção legend.position pode ser usada para posicionar a legenda, substituindo
#"none" por "top" (acima), "bottom" (abaixo) ou "left" (à esquerda)

#Usando uma paleta de cores
#A função 'scale_fill_brewer()' emprega a paleta de cores do pacote 'RColorBrewer'
#Já 'scale_fill_manual()' atribui manualmente as cores. A atribuição é feita com a função
#c(), colocando o código html de cada cor, usando '#' antes do código. 
#Por fim, 'scale_fill_grey emprega uma escala de cinza

bar + geom_bar(stat = "identity") +
  labs(title = "Número de Candidatos por Partido",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15), legend.position = "none")+
  scale_fill_brewer(palette = "Dark2")

bar + geom_bar(stat = "identity") +
  labs(title = "Número de Candidatos por Partido",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15), legend.position = "none")+
  scale_fill_manual(values = c("#FFFF00","#90EE90", "#87CEFA","#FFD700", "#000080"))

##Adicionando uma terceira variável no Gráfico de Barras##
#É necessário alterar o mapa estético
sen2018$DESCRICAO_SEXO <- as.factor(sen2018$DESCRICAO_SEXO)
bar <- ggplot(subset(sen2018, SIGLA_PARTIDO == "MDB" | SIGLA_PARTIDO == "PSD" |
                       SIGLA_PARTIDO == "PODE" | SIGLA_PARTIDO == "PP" |
                       SIGLA_PARTIDO == "PSDB"), aes(as.factor(SIGLA_PARTIDO), cont,
                                                     fill = DESCRICAO_SEXO))
                                                     

bar+ geom_bar(stat = "identity")

#Alterando os elementos textuais e a posição da legenda
bar+ geom_bar(stat = "identity")+
  labs(title = "Número de Candidatos por Partido e Sexo",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15), legend.position = "bottom")+
  scale_fill_discrete(name = "Sexo")

#Alterando a posição das barras

#O ggplot não faz o computo automático de duas categorias. Para isso precisamos organizar a base
#de dados, sumarizando os casos de modo que apresente as somas por cada par de categorias
#(partido e sexo). Este procedimento pode ser feito por meio de um trible com o comando
#"mudate" do tidyverse.

bar1 <- aggregate(cont~SIGLA_PARTIDO+DESCRICAO_SEXO, 
                  data = subset(sen2018, SIGLA_PARTIDO == "MDB" | SIGLA_PARTIDO == "PSD" |
                                         SIGLA_PARTIDO == "PODE" | SIGLA_PARTIDO == "PP" |
                                        SIGLA_PARTIDO == "PSDB"), FUN = "sum")

bar <- ggplot(bar1, aes(SIGLA_PARTIDO, cont,fill = DESCRICAO_SEXO))

bar+ geom_bar(stat = "identity", position=position_dodge(preserve = "single"))+
  labs(title = "Número de Candidatos por Partido e Sexo",
       subtitle = "Candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Número de Candidatos/Candidatas",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15), legend.position = "bottom")+
  scale_fill_discrete(name = "Sexo")

##Plotando médias em gráficos de barras##
bar.m <- ggplot(subset(sen2018, SIGLA_PARTIDO == "MDB" | SIGLA_PARTIDO == "PSD" |
                         SIGLA_PARTIDO == "PODE" | SIGLA_PARTIDO == "PP" |
                         SIGLA_PARTIDO == "PSDB"), aes(SIGLA_PARTIDO, TOTAL_RECEITAS))

bar.m + geom_bar(stat = "identity") #plota a soma dos gastos por categoria (partidos)

bar.m + geom_bar(stat = "summary", fun = "mean") #plota a média por categoria (partidos)

#Adicionando elementos textuais
bar.m + geom_bar(stat = "summary", fun = "mean", fill = "steelblue")+
    labs(title = "Média de Arrecadação por Candidatura",
         subtitle = "Valor médio arrecadado das candidaturas ao Senado em 2018 das cinco maiores bancadas",
         x = "Partido",
         y = "Média de Arrecadação (R$)",
         caption = "Fonte: Tribunal Superior Eleitoral")+
    theme_bw()+
    theme(text = element_text(size = 15))

#Adicionando o valor de cada barra
bar.m + geom_bar(stat = "summary", fun = "mean", fill = "steelblue")+
  stat_summary(aes(label=round(..y.., 2)), fun=mean, geom="text", size=4,vjust = 10, 
               color = "black")+
  labs(title = "Média de Arrecadação por Candidatura",
       subtitle = "Valor médio arrecadado das candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Média de Arrecadação (R$)",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15))

#Adicionando barras de erro

bar.m + geom_bar(stat = "summary", fun = "mean", fill = "steelblue")+
  stat_summary(aes(label=round(..y.., 2)), fun=mean, geom="text", size=4,vjust = 10, 
               color = "black")+
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5)+
  labs(title = "Média de Arrecadação por Candidatura",
       subtitle = "Valor médio arrecadado das candidaturas ao Senado em 2018 das cinco maiores bancadas",
       x = "Partido",
       y = "Média de Arrecadação (R$)",
       caption = "Fonte: Tribunal Superior Eleitoral")+
  theme_bw()+
  theme(text = element_text(size = 15))

##Gráficos de Linhas##
#Em geral, o gráfico de linhas é melhor utilizado para a visualização de dados
#de séries temporais. Para outros tipos de informação, recomenda-se não empregá-lo.
#Aqui, para propositos didáticos, não vamos empregar uma série temporal aqui.

#Preparação dos dados - Total de candidaturas por sexo e estado#
lin1 <- aggregate(cont~DESCRICAO_SEXO+SIGLA_UF, data = sen2018, FUN = "sum")

#Mapa Estético do gráfico de linhas - Totalde Candidaturas
lin <- ggplot(lin1, aes(SIGLA_UF, cont, group = 1))
lin+geom_line()

#adicionando um segundo objeto geométrico no gráfico
lin+geom_line()+
    geom_point()

#adicionando duas linhas ao gráfico
lin <- ggplot(lin1, aes(SIGLA_UF, cont, group = DESCRICAO_SEXO))
lin+geom_line()

#identificando quais as linhas dos gráficos
lin <- ggplot(lin1, aes(SIGLA_UF, cont, group = DESCRICAO_SEXO))
lin+geom_line(aes(colour = DESCRICAO_SEXO))+
    geom_point(aes(colour = DESCRICAO_SEXO))

#Alterando elementos textuais e legenda
lin+geom_line(aes(colour = DESCRICAO_SEXO))+
    geom_point(aes(colour = DESCRICAO_SEXO))+
    labs(title = "Total de Candidaturas por Sexo",
         subtitle = "Candidaturas masculinas e femininas por Unidade da Federação",
         x = "UF",
         y = "Média de Arrecadação (R$)",
         caption = "Fonte: Tribunal Superior Eleitoral",
         color = "Sexo")+
    theme_bw()+
    theme(text = element_text(size = 15), legend.position = "bottom")

#Alterando a espessura e tipo de linha e ponto
lin+geom_line(aes(colour = DESCRICAO_SEXO, linetype = DESCRICAO_SEXO), size = 1.5)+
  geom_point(aes(colour = DESCRICAO_SEXO, shape = DESCRICAO_SEXO), size = 3)+
  labs(title = "Total de Candidaturas por Sexo",
       subtitle = "Candidaturas masculinas e femininas por Unidade da Federação",
       x = "UF",
       y = "Média de Arrecadação (R$)",
       caption = "Fonte: Tribunal Superior Eleitoral",
       color = "Sexo")+
  theme_bw()+
  theme(text = element_text(size = 15), legend.position = "bottom")+
  guides(linetype = F, shape = F)

###Outros objetos geométricos###
#Além do geom_poin() (gráficos de dispersão), geom_bar() (gráficos de barras) e 
#geom_line() (gráficos de linhas), o ggplot possui outros objetos, que podem ser consultados
#aqui: https://ggplot2.tidyverse.org/reference/


