#Gráficos Fernanda

#AULA 1 ####

# Tutorial bem completo para usar de referência:
# https://www.cedricscherer.com/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/

# Banco de dados traduzido de:
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2018/2018-10-23/movie_profit.csv



# Entendendo a lógica das camadas do ggplot2####

## As três principais camadas: dados, estética e geom

ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial)) +
  geom_point()


## O aes pode ser definido na camada ggplot ou na geom_####
ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial))


ggplot() +
  geom_point(data = dados, aes(x = LucroLocal, y = LucroMundial))



## Possibilidades de camadas de geom_: https://ggplot2.tidyverse.org/reference/

##Histograma ####
ggplot(data = dados) +
  geom_histogram(aes(x = Orcamento))


#Gráfico de barras#### 
#(Quantidade de filmes por gênero)
ggplot(data = dados) +
  geom_bar(aes(x = Genero, y = ..count..))


### Boxplot####
#(Lucro mundial por gênero)
ggplot(data = dados) +
  geom_boxplot(aes(x = Genero, y = LucroMundial))


### Linhas####
#(Quantidade de filmes por ano)
ggplot(data = dados) +
  geom_line(aes(x = AnoLancamento, group = 1), stat = "count")



## Modificando argumentos dentro do geom (color, shape, size)
### E a diferença entre usá-los dentro ou fora do aes

ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, color = Genero))


ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, color = Genero,
                 shape = Genero))


ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, shape = Genero),
             color = "darkred")
# Cores pré-definidas no R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf



ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial, shape = Genero),
             color = "#61988E")
# Site gerador de paletas: https://coolors.co/



ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial),
             color = "#61988E", shape = 18)
# Shapes possíveis####
#: http://www.sthda.com/english/wiki/ggplot2-point-shapes


ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial),
             color = "#61988E", shape = 18, size = 1)



ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial),
             fill = "#61988E", color = "black", shape = 25, size = 1.5)
# Shape que permite color e fill####


## Adicionando outro geom
### geom_line x geom_smooth####

ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial),
             color = "#61988E", shape = 16, size = 0.7) +
  geom_line(aes(x = LucroLocal, y = LucroMundial), stat = "smooth",
            method = "lm")



ggplot(data = dados) +
  geom_point(aes(x = LucroLocal, y = LucroMundial),
             color = "#61988E", shape = 16, size = 0.7) +
  geom_smooth(aes(x = LucroLocal, y = LucroMundial), method = "lm", se = F,
              color = "black", size = 0.5)



# Deixando o código mais enxuto####
ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial)) +
  geom_point(color = "#61988E", shape = 16, size = 0.7) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5)



## Modificando a ordem das camadas####
#(a ordem dos geoms importa!)
ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial)) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5) +
  geom_point(color = "#61988E", shape = 16, size = 0.7)



## Especificando aes específicas para um dos geoms####
ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial)) +
  geom_point(color = "#61988E", shape = 16, size = 0.7) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5,
              aes(linetype = Genero))



## Usando o filtro (dplyr)####
#para selecionar dados para o gráfico
dados %>% filter(Genero == "Terror") %>% 
  ggplot(aes(x = LucroLocal, y = LucroMundial)) +
  geom_point(color = "#61988E", shape = 16, size = 0.7) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5,
              aes(linetype = Genero))


dados %>% filter(Orcamento <= 9000000 & Classificacao == "PG") %>% 
  ggplot(aes(x = LucroLocal, y = LucroMundial)) +
  geom_point(color = "#61988E", shape = 16, size = 0.7) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5,
              aes(linetype = Genero))



## Usando o geom para representar um "summary"####
### (stat = summary) x stat_summary()


ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  geom_point(stat = "summary", fun = "mean")



ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  stat_summary(geom = "point", fun = "mean")



ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  stat_summary(geom = "point", fun = "median")



## Incluindo barras de erros (usando também o summary)####


ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  geom_point(stat = "summary", fun = "mean") +
  geom_errorbar(stat = "summary", fun.data = "mean_se")


ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  geom_point(stat = "summary", fun = "mean") +
  geom_errorbar(stat = "summary", fun.min = "min", fun.max = "max")


ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  geom_point(stat = "summary", fun = "mean") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.3)


## Usando IC 95% ao invés de erro-padrão (pacote ggpubr)####

pacman::p_load(ggpubr)

ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  geom_point(stat = "summary", fun = "mean") +
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width = 0.3)


ggplot(data = dados, aes(x = Genero, y = LucroLocal)) +
  geom_point(stat = "summary", fun = "mean") +
  geom_errorbar(stat = "summary", fun.data = "mean_sd", width = 0.3)


## Incluindo a classificação####

dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>% 
  ggplot(aes(x = Genero, y = LucroLocal, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(0.4)) +
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width = 0.3,
                position = position_dodge(0.4))


## Renomeando os eixos e legenda####

dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>% 
  ggplot(aes(x = Genero, y = LucroLocal, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(0.4)) +
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width = 0.3,
                position = position_dodge(0.4)) +
  labs(y = "Lucro local (US$)", x = "Gênero do filme", color = "Classificação")



## Adicionando título, subtítulo e legenda####


dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>% 
  ggplot(aes(x = Genero, y = LucroLocal, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(0.4)) +
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width = 0.3,
                position = position_dodge(0.4)) +
  labs(y = "Lucro local (US$)", x = "Gênero do filme", color = "Classificação",
       title = "Lucro local em US$, de acordo com o gênero e classificação do filme",
       subtitle = "Dados representados como média e IC 95%",
       caption = "Fonte: FiveThirtyEight")

#AULA 2 ####

gm <- dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>%
  ggplot(aes(x = Genero, y = LucroLocal, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(.4)) +
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width = 0.3,
                position = position_dodge(.4)) +
  labs(y = "Lucro Local (US$)", x = "Gênero", color = "Classificação")


gm


## Modificando os limites dos eixos####
### coord_cartesian x scale_y_continuous####

gm + coord_cartesian(ylim = c(0, 100000000))

gm + scale_y_continuous(limits = c(0, 100000000))



## Modificando a expansão####

gb <- ggplot(data = dados) +
  geom_bar(aes(x = Genero, y = ..count.., fill = Genero), show.legend = F) +
  labs(y = "Quantidade de filmes", x = "Gênero")


gb + scale_y_continuous(expand = expansion(add = c(0,100)))

gb + scale_y_continuous(expand = expansion(mult = c(0,0.05)))



## Modificando a quantidade de dígitos e os separadores (milhar e decimal)####


gb + scale_y_continuous(expand = expansion(add = c(0,100)),
                        labels = scales::number_format(accuracy = 0.1,
                                                       decimal.mark = ",",
                                                       big.mark = "."))



## Usando porcentagens nos eixos####

gbp <- ggplot(data = dados) +
  geom_bar(aes(x = Genero, y = (..count..)/sum(..count..),
               fill = Genero), show.legend = F) +
  labs(y = "Quantidade de filmes", x = "Gênero")


gbp <- gbp + scale_y_continuous(expand = expansion(mult = c(0,0.05)),
                                labels = scales::percent_format(accuracy = 0.1,
                                                                decimal.mark = ","))



## Modificando os rótulos do eixo x (categórico)####

gbp + scale_x_discrete(labels = c("Ação", "Aventura", "Comédia",
                                  "Drama", "Terror"))



## Modificando as ordens das categorias do eixo x (categórico)####

gbp + scale_x_discrete(limits = c("Drama", "Comedia", "Acao",
                                  "Aventura", "Terror"),
                       labels = c("Drama", "Comédia", "Ação",
                                  "Aventura", "Terror"))


## Outra opção: usando o pacote forcats####
pacman::p_load(forcats)

ggplot(data = dados) +
  geom_bar(aes(x = fct_infreq(Genero), y = (..count..)/sum(..count..),
               fill = Genero), show.legend = F) +
  labs(y = "Quantidade de filmes", x = "Gênero") +
  scale_y_continuous(expand = expansion(mult = c(0,0.05)),
                     labels = scales::percent_format(accuracy = 0.1,
                                                     decimal.mark = ","))


## Modificando o intervalo entre os valores do eixo (variável numérica)####

gl <- ggplot(data = dados) +
  geom_line(aes(x = as.numeric(AnoLancamento), group = 1), stat = "count") +
  labs(y = "Quantidade de filmes", x = "Ano de lançamento")


gl + scale_x_continuous(n.breaks = 10)


gl + scale_x_continuous(breaks = seq(1935, 2020, by = 5))


gl + scale_x_continuous(breaks = seq(min(dados$AnoLancamento),
                                     max(dados$AnoLancamento),
                                     by = 5))


## Formatando a unidade para moeda####

gs <- ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial)) +
  geom_point(color = "#61988E", shape = 16, size = 1) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5) +
  labs(y = "Lucro Mundial (US$)", x = "Lucro Local (US$)")


gs + scale_y_continuous(labels = scales::number_format(big.mark = ".",
                                                       decimal.mark = ",")) +
  scale_x_continuous(labels = scales::number_format(big.mark = ".",
                                                    decimal.mark = ","))


gs + scale_y_continuous(labels = scales::number_format(big.mark = ".",
                                                       decimal.mark = ",",
                                                       prefix = "US$ ")) +
  scale_x_continuous(labels = scales::number_format(big.mark = ".",
                                                    decimal.mark = ",",
                                                    prefix = "US$ "))


gs + scale_y_continuous(labels = scales::dollar_format()) +
  scale_x_continuous(labels = scales::dollar_format())




## Formatando a unidade para "em milhões"####


gs + scale_y_continuous(labels = scales::number_format(big.mark = ".",
                                                       decimal.mark = ",",
                                                       prefix = "US$ ",
                                                       scale = 1e-6,
                                                       suffix = " M")) +
  scale_x_continuous(labels = scales::number_format(big.mark = ".",
                                                    decimal.mark = ",",
                                                    prefix = "US$ ",
                                                    scale = 1e-6,
                                                    suffix = " M"))



gs <- gs + scale_y_continuous(labels = scales::number_format(big.mark = ".",
                                                             decimal.mark = ",",
                                                             prefix = "US$ ",
                                                             scale = 1e-6)) +
  scale_x_continuous(labels = scales::number_format(big.mark = ".",
                                                    decimal.mark = ",",
                                                    prefix = "US$ ",
                                                    scale = 1e-6)) +
  labs(y = "Lucro mundial em milhões", x = "Lucro local em milhões")




## Facet wrap x facet grid####


### Wrap####
gs + facet_wrap(~ Genero)


### Modificando a quantidade de colunas ou linhas####
gs + facet_wrap(~ Genero, ncol = 2)


### Escala fixa ou livre (fixed, free, free_y, free_x)####
gs + facet_wrap(~ Genero, ncol = 2, scales = "free")


### Grid####
gs + facet_grid(Classificacao ~ Genero)


### Escala fixa ou livre (fixed, free, free_y, free_x)####
gs + facet_grid(Classificacao ~ Genero, scales = "free")


#AULA 3####

gs <- ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial)) +
  geom_point(color = "#61988E", shape = 16, size = 1) +
  geom_smooth(method = "lm", se = F, color = "black", size = 0.5) +
  labs(y = "Lucro Mundial (US$)", x = "Lucro Local (US$)") +
  scale_y_continuous(labels = scales::number_format(big.mark = ".",
                                                    decimal.mark = ",",
                                                    prefix = "US$ ",
                                                    scale = 1e-6)) +
  scale_x_continuous(labels = scales::number_format(big.mark = ".",
                                                    decimal.mark = ",",
                                                    prefix = "US$ ",
                                                    scale = 1e-6)) +
  labs(y = "Lucro mundial em milhões", x = "Lucro local em milhões")




## Mudando o theme para um pronto####

gs + theme_classic()
# https://ggplot2-book.org/polishing.html



## Modificando elementos do theme####

### Tamanho, estilo e tipo da fonte####

gs + theme_classic() +
  theme(axis.title = element_text(size = 13, face = "bold", color = "navy"),
        axis.text = element_text(size = 11, family = "Courier"))
# Opções: axis.title.y, axis.title.x, axis.text.y, axis.text.x
# Outras modificações possíveis: plot.title, plot.subtitle, plot.caption
# Fontes: Times, Helvetica, Courier


### Removendo elementos do gráfico####

gs + theme_classic() +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank())


### Usando uma fonte personalizada####

pacman::p_load(extrafont)
font_import()
loadfonts()


gs + theme_classic() +
  theme(axis.title = element_text(size = 13, face = "bold", family = "Montserrat"),
        axis.text = element_text(size = 11, family = "Nunito"))



## Margens####

gs + theme_classic() +
  theme(axis.title.y = element_text(size = 13, family = "Nunito",
                                    margin = margin(r = 7)),
        axis.title.x = element_text(size = 13, family = "Nunito",
                                    margin = margin(t = 8)),
        axis.text = element_text(size = 11, family = "Nunito"))



## Adicionar angulação aos textos dos eixos####

gs + theme_classic() +
  theme(axis.title.y = element_text(size = 13, family = "Nunito",
                                    margin = margin(r = 7)),
        axis.title.x = element_text(size = 13, family = "Nunito",
                                    margin = margin(t = 8)),
        axis.text = element_text(size = 11, family = "Nunito"),
        axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
# https://qastack.com.br/programming/7263849/what-do-hjust-and-vjust-do-when-making-a-plot-using-ggplot



## Remover grades + mudar fonte e fundo do facet####

gs + facet_wrap(~ Genero) +
  theme_bw() +
  theme(panel.grid = element_blank(),
        strip.background = element_rect(fill = "lavenderblush3"),
        strip.text = element_text(size = 10))
# Opções: strip.text.x, strip.text.y
# Opções: panel.grid.major, panel.grid.minor



## Modificando a legenda: fonte, posição, background####
### https://www.r-graph-gallery.com/239-custom-layout-legend-ggplot2.html

gm + theme_classic() +
  theme(text = element_text(size = 13, family = "Nunito"),
        legend.title = element_text(face = "bold"),
        legend.text = element_text(size = 10))


gm + theme_classic() +
  theme(text = element_text(size = 13, family = "Nunito"),
        legend.title = element_blank(),
        legend.text = element_text(size = 10))



gm + theme_classic() +
  theme(text = element_text(size = 13, family = "Nunito"),
        legend.direction = "horizontal")


gm + theme_classic() +
  theme(text = element_text(size = 13, family = "Nunito"),
        legend.position = "bottom")
# Opções: bottom, top, left, right


gm + theme_classic() +
  theme(text = element_text(size = 13, family = "Nunito"),
        legend.position = "none")



### Modificando a ordem e o texto da legenda####

gm + scale_color_discrete(breaks = c("R", "PG-13", "PG"),
                          labels = c("17 anos", "13 anos", "10 anos")) +
  theme_classic() +
  theme(text = element_text(size = 13, family = "Nunito"))



### Modificando a posição da legenda para dentro do gráfico####

gm + theme_classic() +
  theme(legend.position = c(0.5,0.8),
        legend.justification = c(0.5, 0.5),
        legend.background = element_rect(fill = "gray95"),
        legend.margin = margin(20,20,20,20))
# legend.position varia de 0 a 1, considerando o espaço dentro dos eixos (h, v)
# legend.justification: ponto considerado pelo position para o deslocamento
# Opções: c("right", "top"), c(0,0)
# Ordem margin: t r b l (top, right, bottom, left)
# legend.background = element_blank() para deixar transparente (o padrão é branco)




### Excluindo um dos elementos (geoms) da legenda####
#### show.legend = FALSE
dados %>% filter(Classificacao %in% c("PG", "PG-13", "R")) %>%
  ggplot(aes(x = Genero, y = LucroLocal, color = Classificacao)) +
  geom_point(stat = "summary", fun = "mean", position = position_dodge(.4)) +
  geom_errorbar(stat = "summary", fun.data = "mean_ci", width = 0.3,
                position = position_dodge(.4), show.legend = FALSE) +
  labs(y = "Lucro Local (US$)", x = "Gênero", color = "Classificação") +
  theme_classic()





## Salvar os gráficos em alta resolução####

### ggsave - por padrão, salva o último gráfico rodado

ggsave("Lucro_por_genero.png", height = 4.5, width = 6, units = "in", dpi = 600)
# Formatos aceitos: tiff, png, pdf, jpeg, eps, svg...
# Unidades aceitas: in, cm, mm, px


ggsave(plot = gs, "Lucro_local_mundial.tiff",  height = 4.5, width = 6,
       units = "in", dpi = 600)
