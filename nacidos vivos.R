#instalar paquetes
install.packages("tidyverse")

#activar librerías
library(tidyverse)

#traer base mortalidad
base_nacidos_vivos <- read.csv2("MINSAL - Nacidos vivos 2005-2020 jurisdicción residencia de la madre.csv", encoding="latin1", sep = ",")

#mirar variables
str(base_nacidos_vivos)

#seleccionar variables
base_nacidos_vivos2 <- dplyr::select(base_nacidos_vivos, "anio", "jurisdicion_residencia_nombre", "nacimientos_cantidad")

#filtrar años 2019 y 2020
unique(base_nacidos_vivos2$anio)
base_nacidos_vivos_1920 <- dplyr::filter(base_nacidos_vivos2, anio == "2019" | anio == "2020")

head(base_nacidos_vivos_1920)

base_nacidos_vivos_agrupado <- base_nacidos_vivos_1920%>%
  group_by(anio, jurisdicion_residencia_nombre)
  
base_nacidos_vivos_final <- base_nacidos_vivos_agrupado%>%
  summarise(n = sum(nacimientos_cantidad))
  
#son 52 filas porque están las columnas NA y Sin información de provincia
