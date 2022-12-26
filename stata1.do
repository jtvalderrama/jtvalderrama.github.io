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
save "misnotas.dta", replace
//_8
use "misnotas.dta", clear
//_9
codebook ex1
//_10
sum ex1
//_11
tabulate ex1 if ex1 > 10
//_12
list ex1 in 1/10
//_13
drop id
//_14
use "misnotas.dta", clear
//_15
label data "ECV-Datos básicos de la persona"
//_16
label var ex1 "Examen 1"
//_17
label define sexo_lab 1 "Hombre" 2 "Mujer"
label values ex1 sexo_lab
//_18
rename ex1 examen1
//_19
generate nota = (examen1+ex2+ex3+ex4+ex5)/4

// Etiquetamos la variable

label var nota "Nota del curso"

//  Observamos los estadísticos descriptivos de la nueva variable

summarize nota
//_20
generate gnota = 1 if nota <= 10
replace gnota = 2 if nota >= 11 & nota <= 15
replace gnota = 3 if nota >= 16 

// Etiqueamos la variable y sus valores

label var gnota "Grupo de nota"
label define gnota_lab 1 "Menor que 10" 2 "De 11 a 15" 3 "De 16 y más"
label values gnota gnota_lab

tabulate gnota
//_21
recode gnota (1  = 1) (2 3 = 2)

// Etiquetamos la nueva variable y sus valores

label drop gnota_lab
label define gnota_lab 1 "Menos de 10" 2 "11 y más"
label values gnota gnota_lab

tabulate gnota
//_22
egen notam = mean(nota)
//_23q
quietly{
use "enaho01a-2021-500", clear
}
//_24
tabulate p524a1,m
//_25
net search poverty
ssc install povdeco
//_26q
quietly: cd "C:\Users\jvald\Dropbox\MISCURSOS\Analisis de Datos con Stata\jtvalderrama.github.io"
//_^
log close
