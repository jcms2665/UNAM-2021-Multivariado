#--------------------------------------------------------------------------------
# Tema:       An�lisis de Componentes Principales
# Autor:      Julio Cesar <jcms2665@gmail.com>
# Fecha:      10-08-2021
# Datos:      calificacion.csv
# Github:     https://github.com/jcms2665/UNAM-2021-Multivariado


#               CONTENIDO

#     0. Entorno de trabajo
#     1. Cargar base
#         1.1 Opci�n 1
#         1.2 Opci�n 2
#     2. Normalizaci�n
#     3. Ajuste del modelo
#         3.1 Gr�fico de sedimentaci�n 
#         3.2 Componentes principales
#     4. Correlaci�n: CP vs Datos originales

#--------------------------------------------------------------------------


#0.  Entorno de trabajo

rm(list=ls())     
graphics.off()    

library(foreign)
library(factoextra)
library(dplyr)
library(knitr)


#1. Cargar base

#1.1 Opci�n 2
horario<-read.csv(".../horario.csv", sep=",",header = TRUE)
View(horario)

#2. Ajuste del modelo

#2.1 Correlaciones
cor(horario)%>%round(2)

#2.2 Normalizaci�n
norm01 <- function(x){(x-min(x))/(max(x)-min(x))}
horario_norm<-data.frame(apply(horario,2,norm01))
apply(horario_norm, 2, min)%>%round(2)
apply(horario_norm, 2, mean)%>%round(2)
apply(horario_norm, 2, max)%>%round(2)

#2.3 An�lisis de componentes principales
acp<-prcomp(horario_norm)
acp

#2.4 Valores de los componentes
acp$x



#3. Resultados

#3.1 Gr�fico de sedimentaci�n (Varianza)
screeplot(acp,type="lines")


#3.2 Componentes principales (los 2 primeros)
cp<-data.frame(acp$x)
cp<-cp[,1:2]


#4. Correlaci�n: Constructos vs Datos originales
cor(horario_norm, cp,use = "everything",method = c("pearson"))







