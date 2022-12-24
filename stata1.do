capture log close
log using "stata1", smcl replace
//_1
clear all
//_2
clear all // Liberar el espacio de trabajo

// Liberar el espacio de trabajo

clear all

* Liberar el espacio de trabajo

clear all
//_3
cd "C:\Users\jvald\Dropbox\MISCURSOS\Analisis de Datos con Stata\MATERIALES\sesion1"
pwd
//_4
import delimited using "NOTAS.csv", clear varnames(1)
//_5
browse
//_6q
quietly{
  destring _all, replace
}
//_7
save "ecv18r.dta", replace
//_8
use "ecv18r.dta", clear
//_9
codebook 
//_10
sum
//_11
tabulate rb210 if rb090 == 2
//_12
label data "ECV-Datos básicos de la persona"
//_13
label var rb090 "Sexo"
//_14
label define sexo_lab 1 "Hombre" 2 "Mujer"
label values rb090 sexo_lab
//_15
rename rb090 sexo
//_16
generate edad = 2018 - rb080

// Etiquetamos la variable

label var edad "Edad"

//  Observamos los estadísticos descriptivos de la nueva variable

summarize edad
//_17
generate gedad = 1 if edad <= 29
replace gedad = 2 if edad >= 30 & edad <= 49
replace gedad = 3 if edad >= 50 & edad <= 64
replace gedad = 4 if edad >= 65

// Etiqueamos la variable y sus valores

label var gedad "Grupo de edad"
label define gedad_lab 1 "Menor que 30 años" 2 "De 30 a 49 años" 3 "De 50 a 64 años" 4 "65 y más años"
label values gedad gedad_lab

tabulate gedad
//_18
recode gedad (1 2 = 1) (3 4 = 2)

// Etiquetamos la nueva variable y sus valores

label drop gedad_lab
label define gedad_lab 1 "Menor de 50 años" 2 "50 y más años"
label values gedad gedad_lab

tabulate gedad
//_19
egen edadm = mean(edad)
//_20q
quietly{
import delimited using "esudb18p.csv", clear delimiter(",")
destring _all, replace
}
//_21
browse p78a_u
tabulate p78a_u
//_22
recode p78a_u (-2 -1 = .)
//_23
net search poverty
ssc install povdeco
//_24q
quietly: cd "C:\Users\jvald\Dropbox\MISCURSOS\Analisis de Datos con Stata\jtvalderrama.github.io"
//_^
log close
