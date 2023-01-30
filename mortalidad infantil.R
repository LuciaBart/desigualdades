#instalar paquetes
install.packages("tidyverse")
install.packages("readxl")

#activar librerías
library(tidyverse)
library(readxl)

##Columna grupos etarios
grupoetario <- readxl::read_xls("INDEC - c2_proyecciones_prov_2010_2040.xls", sheet = "01-TOTAL DEL PAÍS", range = "A31:A56")
str(grupoetario)
head(grupoetario)
grupoetario <- na.omit(grupoetario)

##2019
#traer base INDEC
poblacion2019 <- readxl::read_xls("INDEC - c2_proyecciones_prov_2010_2040.xls", col_names = FALSE, sheet = "01-TOTAL DEL PAÍS", range = "N34:P56")
poblacion2019 <- na.omit(poblacion2019)
colnames(poblacion2019)<- c("AMBOS","VARONES","MUJERES")

grupoetario_poblacion <- cbind(grupoetario, poblacion2019)

POB2019 <- grupoetario_poblacion %>% 
  gather("SEXO", "Pob", 2:4)

POB2019 <- POB2019 %>%
  mutate(Año = 2019)

##loop

sheets <- excel_sheets("INDEC - c2_proyecciones_prov_2010_2040.xls")

sheetList <- as.list(sheets) #convert sheets to list

for (s in sheetList){
  poblacion2019 <- readxl::read_xls("INDEC - c2_proyecciones_prov_2010_2040.xls", sheet = s, range = "N34:P56")
  poblacion2019 <- na.omit(poblacion2019)
  colnames(poblacion2019)<- c("AMBOS","VARONES","MUJERES")
  
  grupoetario_poblacion <- cbind(grupoetario, poblacion2019)
  
  POB2019 <- grupoetario_poblacion %>% 
    gather("SEXO", "Pob", 2:4)
  
  POB2019 <- POB2019 %>%
    mutate(Año = 2019)
    assign( paste("POB2019", s, sep = "_") , POB2019) 
    #assign(sheetList[[s]], prueba2)
    } 

?assign

