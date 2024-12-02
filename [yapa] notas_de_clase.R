

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##------------------------------ NOTAS DE CLASE---------------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Función para limpiar nombre de columnas clean_names() del paquete {janitor}
library(janitor)

tabaco_edad %>%
  clean_names() %>%
  mutate(si_est = round(si_est, digits = 3) * 100,
         si_li = round(si_li, digits = 3) * 100,
         si_est = round(si_li, digits = 3) * 100,
         si_est = round(si_li, digits = 3) * 100,
         si_est = round(si_li, digits = 3) * 100,
         si_est = round(si_li, digits = 3) * 100,
         si_est = round(si_li, digits = 3) * 100,
         )

### Función across(). Sirve para correr la misma tarea (función) sobre más de una columna, 
#### sin tener que escribir una sentencia para cada variable
tabaco_edad %>% 
  clean_names() %>% 
  mutate(across(.cols = c(si_est, si_li, si_ls, no_est, no_li, no_ls),
                ~ round(., digits = 3) * 100))



tabaco_edad %>% 
  clean_names() %>% 
  mutate(across(.cols = c(2,5,7),
                ~ round(., digits = 3) * 100))


tabaco_edad <- tabaco_edad %>% 
  clean_names()

### Distintos operadores para seleccionar columnas de una base de datos
tabaco_edad %>% 
  select(si_est, si_li)

tabaco_edad %>% 
  select(si_est:no_est)

tabaco_edad %>% 
  select(starts_with("si_"))

tabaco_edad %>% 
  select(ends_with("_ls"))

tabaco_edad %>% 
  select(contains("o_"))

tabaco_edad %>% 
  select(everything())

tabaco_edad %>% 
  mutate(si_ls = as.character(si_ls)) %>% 
  select(where(is.character))

tabaco_edad %>% 
  select(si_est, 4, ends_with("ls"))




tablita <- tabaco_edad %>% 
  mutate(across(.cols = 2:7,
                ~ round(., digits = 3)))

library(gt)

tablita %>% 
  gt() %>% 
  tab_header(title = "Esta es una bella tablita") %>% 
  cols_label(
    edad_agrupada = md("**Edad agrupada**"),
    si_est = "Sí - Estimación",
    si_li = "Sí - Límite inferior"
  ) %>% 
  fmt_percent(columns = 2:7, decimals = 1, sep_mark = ".", dec_mark = ",") %>% 
  tab_source_note("Fuente: Elaboración propia en base a la ENFR-INDEC")
