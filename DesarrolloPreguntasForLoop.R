#Limpiado de variables
rm(list = ls())

#Paquetes
install.packages("tidyverse")
install.packages("lubridate")
install.packages("data.table")
install.packages("readr")

#librerias a usar
library(tidyverse)
library(lubridate)
library(tidyr)
library(data.table)
library(readxl)
library(dplyr)
library(ggplot2)
################1.-  Cargue las bases de datos incoporando en cada una de ellas la variable "tamanio",##############
################     donde indique de que tamaño es la empresa de ese país.(1 pto)#############

## Cargar las bases

gran_chile <- read_csv2("grandes_chile.csv")
gran_colombia <- read_csv2("grandes_colombia.csv")
gran_peru <- read_csv2("grandes_peru.csv")

medi_chile <- read_csv2("medianas_chile.csv")
medi_colombia <- read_csv2("medianas_colombia.csv")
medi_peru <- read_csv2("medianas_peru.csv")

micro_chile <- read_csv2("micro_chile.csv")
micro_colombia <- read_csv2("micro_colombia.csv")
micro_peru <- read_csv2("micro_peru.csv")

peque_chile <- read_csv2("pequena_chile.csv")
peque_colombia <- read_csv2("pequena_colombia.csv")
peque_peru <- read_csv2("pequena_peru.csv")

##Agregar variable del tamaño

gran_chile <- mutate(gran_chile, tamanio="Empresa grande")
gran_colombia <- mutate(gran_colombia, tamanio="Empresa grande")
gran_peru <- mutate(gran_peru, tamanio="Empresa grande")

medi_chile <- mutate(medi_chile, tamanio="Empresa mediana")
medi_colombia <- mutate(medi_colombia, tamanio="Empresa mediana")
medi_peru <- mutate(medi_peru, tamanio="Empresa mediana")

micro_chile <-mutate(micro_chile, tamanio="Micro empresa")
micro_colombia <- mutate(micro_colombia, tamanio="Micro empresa")
micro_peru <- mutate(micro_peru, tamanio="Micro empresa")

peque_chile <- mutate(peque_chile, tamanio="Pequenia empresa")
peque_colombia <- mutate(peque_colombia, tamanio="Pequenia empresa")
peque_peru <- mutate(peque_peru, tamanio="Pequenia empresa")

################ 2.- Reuna todas las bases en una sola y defina de qué tipología (tipo de datos) son cada #############
################     una de las variables que se encuentran en la data.(1 pto) #############

## me haceguro de que todas las variables tengan los mismos nombres

names(gran_chile) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(gran_colombia) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(gran_peru) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
####
names(medi_chile) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(medi_colombia) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(medi_peru) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
###
names(micro_chile) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(micro_colombia) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(micro_peru) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
###
names(peque_chile) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(peque_colombia) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")
names(peque_peru) = c("Fecha","Pais","Ingresos","Costos","Porcentaje_mujeres",
                      "Exportaciones","Importaciones","Endeudamiento","Morosidad",
                      "Reservas","Spread","Tasa_interes","Tamanio")

## Unir las bases de datos

g1_2 <- as.data.table(rbind(gran_chile,gran_colombia))
g1_3 <- as.data.table(rbind(g1_2,gran_peru))

g1_4 <- as.data.table(rbind(g1_3,medi_chile))
g1_5 <- as.data.table(rbind(g1_4,medi_colombia))
g1_6 <- as.data.table(rbind(g1_5,medi_peru))

g1_7 <- as.data.table(rbind(g1_6,micro_chile))
g1_8 <- as.data.table(rbind(g1_7,micro_colombia))
g1_9 <- as.data.table(rbind(g1_8,micro_peru))

g1_10 <- as.data.table(rbind(g1_9,peque_chile))
g1_11 <- as.data.table(rbind(g1_10,peque_colombia))
g1_12 <- as.data.table(rbind(g1_11,peque_peru))

## guardo la nueva base de datos
write.csv(g1_12, file="Datoscombinados.csv")

Data <- g1_12
Data <- read_csv("Datoscombinados.csv")
Data$X1 <- NULL
names(Data)

## Tipologia de cada una de las variables

class(Data$Fecha)
class(Data$Pais)
class(Data$Ingresos)
class(Data$Costos)
class(Data$Porcentaje_mujeres)
class(Data$Exportaciones)
class(Data$Importaciones)
class(Data$Endeudamiento)
class(Data$Morosidad)
class(Data$Reservas)
class(Data$Spread)
class(Data$Tasa_interes)
class(Data$Tamanio)
Data

################ 3.- Determine a través del uso de condicionales y/o for cuántas obervaciones tiene Peru #############
################     versus Chile.(2 pto) #############

comparacion <- "PeruvsChile"

if(comparacion=="PeruvsChile"){
  Peru <- nrow(Data%>%filter(Pais == "peru"))
  Peru_grande <- nrow(Data%>%filter(Pais == "peru")%>%filter(Tamanio == "Empresa grande"))
  Peru_mediana <- nrow(Data%>%filter(Pais == "peru")%>%filter(Tamanio == "Empresa mediana"))
  Peru_micro <- nrow(Data%>%filter(Pais == "peru")%>%filter(Tamanio == "Micro empresa"))
  Peru_peque <- nrow(Data%>%filter(Pais == "peru")%>%filter(Tamanio == "Pequenia empresa"))
  
  Chile <- nrow(Data%>%filter(Pais == "chile"))
  Chile_grande <- nrow(Data%>%filter(Pais == "chile")%>%filter(Tamanio == "Empresa grande"))
  Chile_mediana <- nrow(Data%>%filter(Pais == "chile")%>%filter(Tamanio == "Empresa mediana"))
  Chile_micro <- nrow(Data%>%filter(Pais == "chile")%>%filter(Tamanio == "Micro empresa"))
  Chile_peque <- nrow(Data%>%filter(Pais == "chile")%>%filter(Tamanio == "Pequenia empresa"))
  print(paste("El total de empresas en Perú es", Peru,"y esta compuesto de",
              Peru_grande,"grandes empresas,",Peru_mediana, "medianas empresas,",
              Peru_micro,"micro empresas y finalmente",Peru_peque,
              "pequeñas empresas.","En comparación en Chile existe un total de",
              Chile,"que se desglosan en",Chile_grande,"grandes empresas,",
              Chile_mediana,"medianas empresas,",Chile_micro,"micro empresas y finalmente",
              Chile_peque,"pequeñas empresas."))
}

################ 4.- Determine a través del uso de condicionales y/o for ¿cuál es el país con mayor ################ 
################    ingresos de explotación para los años que considera la muestra.(2 pto) ################ 

## LOS VALORES DE INGRESO ESTAN EN PORCENTAJE??
## POR LO TANTO, PARA SABER QUE PAIS TIENE MAYOR INGRESO
##DEBO "SUMAR" O SACAR EL "PROMEDIO"

V_ingresos <- c(Data$Ingresos)

input <- "ingreso"

if(input == "ingreso"){
  Pe <- Data%>%filter(Pais == "peru")
  Chi <- Data%>%filter(Pais == "chile")
  Col <- Data%>%filter(Pais == "colombia")
  
  V_ing_per <- c(Pe$Ingresos)
  V_ing_chi <- c(Chi$Ingresos)
  V_ing_col <- c(Col$Ingresos)
  
# suma
  ingre_peru <- sum(V_ing_per)
  ingre_chile <- sum(V_ing_chi)
  ingre_colombia <- sum(V_ing_col)

# promedio    
  por_peru <- mean(V_ing_per)
  por_chile <- mean(V_ing_chi)
  por_colombia <- mean(V_ing_col)
  
## trabajo con la suma
  if(ingre_colombia>ingre_chile && ingre_colombia>ingre_peru){
    print(paste("El país con mayores ingresos de explotación en el periodo es Colombia, con un ingreso de",
                ingre_colombia,"unidades monetarias"))
  }else if(ingre_peru>ingre_chile && ingre_peru>ingre_colombia){
    print(paste("El país con mayores ingresos de explotación en el periodo es Perú, con un ingreso de",
                ingre_peru,"unidades monetarias"))
  }else if(ingre_chile>ingre_peru && ingre_chile>ingre_colombia){
    print(paste("El país con mayores ingresos de explotación en el periodo es Chile, con un ingreso de",
                ingre_chile,"unidades monetarias"))
  }
}


################ 5.- Genere una variable(columna) , donde si el país es Chile multiplique la tasa de interes ################ 
################     por 0,1, cuando sea Peru le sume 0,3 y, y finalmente si es Colombia divida por 10 ################ 
################     2 ptos).Use condicionales y/o for. ################ 

variacion <- "SI"

if(variacion=="SI"){
  Chi1 <- Data%>%filter(Pais == "chile")
  Chi1 <- mutate(Chi1, nuevo_interes=0.1*Tasa_interes)
  Pe1 <- Data%>%filter(Pais == "peru")
  Pe1 <- mutate(Pe1, nuevo_interes=0.3+Tasa_interes)
  Col1 <- Data%>%filter(Pais == "colombia")
  Col1 <- mutate(Col1, nuevo_interes=Tasa_interes/10)
  
  Data1_2 <- as.data.table(rbind(Chi1,Pe1))
  Data1_3 <- as.data.table(rbind(Data1_2,Col1))
  
  Data <- Data1_3
}

################ 6.- Reemplace en la columna exportaciones con 1 cuando es mayor a 2,1, con un 2 ################ 
################     cuando es menor 2,1y un 3 cuando es igual a 2,1, redondee al primer decimal la ################ 
################     variable(2 ptos). Use condicionales y/o for ################ 

var <- "SI"

if(var=="SI"){
  Data <- mutate(Data, Exportaciones=round(Exportaciones,1))
  
  D1 <- Data%>%filter(Exportaciones>2.1)
  D1 <- mutate(D1, Exportaciones=1)

  D2 <- Data%>%filter(Exportaciones<2.1)
  D2 <- mutate(D2, Exportaciones=2)
  
  D3 <- Data%>%filter(Exportaciones==2.1)
  D3 <- mutate(D3, Exportaciones=3)
  
  D1_2 <- as.data.table(rbind(D1,D2))
  D1_3 <- as.data.table(rbind(D1_2,D3))

  
  Data <- D1_3
}

names(Data)

################ 7.- Gráfique algunas variables seleccionadas, las cuales puedan responder a una ################ 
################     pregunta que se haga con respecto a los datos. ################ 

ingreso <- "normal"
ad <- "distribucion"

##se define como ingreso normal
if(ingreso=="normal"){
  D_ingreso <- Data%>%filter(Ingresos>=10)
  D_ingreso <- Data%>%filter(Ingresos<=17)
  
  ggplot(data = D_ingreso) + geom_bar(mapping = aes(x=Pais), stat = "count",
                              fill=c("red", "yellow", "grey") ,col="black")+
    labs(title = "Numero de empresas con un nivel de ingresos normal",
         subtitle = "Ingreso normal:[10-17]")
  if(ad=="distribucion"){
    ggplot(D_ingreso, aes(x=Pais, y=Ingresos))+ 
      geom_boxplot(color="black", fill=c("red", "yellow", "grey"))+
      ggtitle("Numero de empresas con un nivel de ingresos normal")
    print(paste("La concentracion de datos normales de los 3 paices es similar,",
                "pero la media de los datos de Chile y Perú, son mas altas que las de Colombia,",
                "sin embargo, Colombia presenta outliers"))
  }
}

