library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)

mipaleta <- c("#98FC78", "#FFA961", "#FD839C", "#27F9FF", "#FF00A6")

#Medias anuales IPV _INE
ipvm <- as.data.frame(read_excel("media_ipv.xlsx")) 
ipvm

ipvm %>% ggplot(aes(x = Año, y = Media_IPV)) +
  geom_line(group = "",  col =mipaleta[5], size = 1.5) + scale_x_discrete() +
  theme_minimal()+
  labs(y = "Indice del precio de la vivienda mecio (miles de euros)")

#Variación IPV con medias anuales en miles de euros _INE
ipv2 <- as.data.frame(read_excel("var_ipv2.xlsx")) 

ipv2

ipv2 %>% 
  gather(key = "Tipo", value = "IPV", -Año) %>% 
  ggplot(aes(x = Año, y = IPV , group = Tipo)) +
  geom_line(aes(color = Tipo), size = 1.3) + 
  scale_color_manual(values = c("#FD839C", "#FFA961")) +
  theme_minimal()

#Evolución de la concesión de hipotecas en españa:
nh <- as.data.frame(read_excel("num_hipotecas.xlsx")) 
nh

ggplot(data = nh) +
  geom_bar(mapping = aes(x = Año, y = Num_hipotecas), stat = "identity",fill = "#FFA961" )+
  theme_minimal()+
  geom_text(aes(x = Año, y = Num_hipotecas, label =  Num_hipotecas), vjust = -1) +
  labs(y = "Número de hipotecas concedidas") 

#numero compraventas realizadas
ncm <- as.data.frame(read_excel("num_compraventa.xlsx")) 
ncm

ggplot(data = ncm, as.numeric = FALSE) +
  geom_bar(mapping = aes(x = Año, y = Num_compraventas), stat = "identity",fill = mipaleta[3] )+
  theme_minimal() +
  geom_text(aes(x = Año, y = Num_compraventas, label = Num_compraventas), vjust = -1)+
  labs(y = "Número de compraventas realizadas")

# importe medio de las tasaciones en España, EXPRESADO EN MILLONES DE EUROS 
imp2 <- as.data.frame(read_excel("importe_tas2.xls")) 


imp2 %>% ggplot(aes(x = Año, y = Valor_total_tasaciones)) +
  geom_line(group = "",  col =mipaleta[5], size = 1.5 ) +
  theme_minimal()+
  labs(y = "Importe medio de las tasaciones en España (en miles de euros)")


#importe medio de tasacion por vivienda y comunidades autonomas EN MILES DE EUROS

pmtv <- as.data.frame(read_excel("importe_tas_ccaa.xlsx"))

pmtv

pmtv %>% 
  gather(key = "CCAA", value = "Importe_medio_tasación", -Año) %>% 
  mutate(Importe_medio_tasacion_miles = Importe_medio_tasación/1000) %>% 
  ggplot(aes(x = Año, y = Importe_medio_tasacion_miles , group = CCAA)) +
  geom_line(aes(color = CCAA), size = 1.3) + 
  scale_color_manual(values = c("#98FC78", "#FFA961", "#FD839C", "#27F9FF", "#F78F47", "#FF00A6", "violet", "skyblue1", "darkolivegreen3", "deeppink2", "lightpink", "mediumturquoise", "#98FC78", "#FFA961", "#FD839C", "#27F9FF", "#56F6B4")) +
  theme_minimal() +
  labs(y = "Importe medio tasación (miles de euros)")


#Importe medio de tasación por por municipios

pmtv2 <- as.data.frame(read_excel("Tasaciones_pormun.xlsx"))

pmtv2

pmtv2 %>% 
  gather(key = "CCAA", value = "Importe_medio_tasación", -Año) %>% 
  ggplot(aes(x = Año, y = Importe_medio_tasación , group = CCAA)) +
  geom_line(aes(color = CCAA), size = 1.3) + 
  scale_color_manual(values = c("#FFA961","#98FC78", "#FD839C", "#27F9FF", "#FF00A6")) +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 10))+
  labs(y = "Importe medio de tasación (miles de euros)")

#tasacion por tipo de cliente:
tc <- as.data.frame(read_excel("num_tas_cli.xlsx"))

tc

tc %>% 
  gather(key = "Cliente", value = "num_tasación", -Año) %>% 
  mutate(num_tasación_miles = num_tasación/1000) %>% 
  ggplot(aes(x = Año, y = num_tasación_miles , group = Cliente)) +
  geom_line(aes(color = Cliente), size = 1.3) + 
  scale_color_manual(values = c("#FFA961","#98FC78", "#FD839C", "#27F9FF", "#FF00A6")) +
  theme_minimal() +
  labs(y = "Número de tasaciones según la distribucción de la clientela (en miles)")

#finalidad tas, hacerlo con gráfico de barras y % de colores.

ft <- as.data.frame(read_excel("finalidad_tas.xlsx"))

ft

ft %>% 
  gather(key = "Cliente", value = "Importe_medio_tasación", -Año) %>% 
  mutate(Importe_medio_tasacion_miles = Importe_medio_tasación/1000) %>% 
  ggplot(aes(x = Año, y = Importe_medio_tasacion_miles , group = Cliente)) +
  geom_line(aes(color = Cliente), size = 1.3) + 
  scale_color_manual(values = c("#FFA961","#98FC78", "#FD839C", "#27F9FF", "#FF00A6")) +
  theme_minimal() +
  labs(y = "Finalidad de las tasaciones")




#Número de tasaciones realizadas en españa según el periodo!!!!! bde DE VIVIENDAS
nts <- as.data.frame(read_excel("num_tas_es.xlsx")) 

nts %>% ggplot(aes(x = Año, y = num_tas)) +
  geom_line(group = "",  col =mipaleta[1], size = 1.5 ) +
  theme_minimal()+
  labs(y = "Numero de tasaciones de viviendas en españa")


#numero de tasaciones DE VIVIENDAS por CCAA
it <- as.data.frame(read_excel("num_tas__ccaa.xlsx"))

it

it %>% 
  gather(key = "CCAA", value = "Numero_medio_tasación", -Año) %>% 
  mutate(Numero_medio_tasacion_miles = Numero_medio_tasación/1000) %>% 
  ggplot(aes(x = Año, y = Numero_medio_tasacion_miles , group = CCAA)) +
  geom_line(aes(color = CCAA), size = 1.3) + 
  scale_color_manual(values = c("#98FC78", "#FFA961", "#FD839C", "#27F9FF", "#F78F47", "#FF00A6", "violet", "skyblue1", "darkolivegreen3", "deeppink2", "lightpink", "mediumturquoise", "#98FC78", "#FFA961", "#FD839C", "#27F9FF", "#56F6B4")) +
  theme_minimal() +
  labs(y = "Número de tasaciones de viviendas realizadas por CCAA (en miles)")




