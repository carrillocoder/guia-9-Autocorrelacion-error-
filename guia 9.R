# Guia 9: No Autocorrelacion

setwd("D:/guia 9")

library(haven)

bdcon=read_dta("consumoag.dta")

attach(bdcon)



# Regresion inicial

m1=lm(consumo~ing+m)

summary(m1)



# Deteccion

# grafica errores

error=residuals(m1)

library(zoo)

e=zoo(error) #transformacion a series de tiempo 

e_r=lag(e,-1) #retorna el rezoga 

plot (e,e_r)  







# Durbin Watson solo detecta AC de 1er grado (orden)

library(lmtest)

dwtest(consumo~ing+m)

# analizar con el grafico

# pvalue=0.001215 < 0.05 ==> AC en los errores





# Solucion

library(prais)

m2=prais_winsten(consumo~ing+m,twostep=TRUE,data=bdcon, index=n)

summary(m2)
