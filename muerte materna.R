#instalar paquetes
install.packages("tidyverse")

#activar librerías
library(tidyverse)

#traer base mortalidad
base_mortalidad <- read.csv2("MINSAL-defunciones-2005-2020.csv", encoding="latin1", sep = ",")

#mirar variables
head(base_mortalidad)
str(base_mortalidad)
table(base_mortalidad$lista_clasificacion)

#chequear que muerte materna = ID 2
table(base_mortalidad$sexo_id)

# seleccionar años 2019 y 2020
unique(muerte_materna_clasificacion)
base_mortalidad_materna_1620 <- filter(base_mortalidad, anio %in% c(2016:2020), !is.na(muerte_materna_clasificacion))
table(base_mortalidad_materna_1620$sexo_id)


###(QUITAR)
# nos quedamos con grupo edad 25 a 49 
#unique(base_mortalidad_fem$grupo_edad)

#seleccionar columnas de interés
str(base_mortalidad_fem_1920)
base_motalidad_materna <- dplyr::select(base_mortalidad_fem_1920, "anio", "jurisdicion_residencia_nombre", "lista_clasificacion", "grupo_edad", "muerte_materna_clasificacion", "cantidad")

unique(base_mortalidad$lista_clasificacion)
#sacar cols duplis


