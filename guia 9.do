*guia 9 
cd "D:\guia 9"
clear all 
use consumoag
tset n 
*regresion inicial 
reg consumo ing m 
*detteccion graf 
predict errores, residuals 
gen error_r = l.errores 
scatter errores error_r 
*deteccion durbin watson 
reg consumo ing m 
estat dwatson 
*solucion 
prais consumo ing m 
