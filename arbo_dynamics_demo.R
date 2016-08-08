#### generate and r as a function of temperature
if(!require(pracma)){install.packages('pracma')}
library(pracma)
setwd("~")
setwd(dirname(list.files(pattern='epidemicGrowth.RData', recursive=TRUE, full.names=TRUE)))
load("./epidemicGrowth.Rdata")

# Syntax
gt.function(25)(0:50) ##(temperature in oC) (time_1: time_n)    
formalR0(25,0.4)   ## (temperature in oC, lambda)
solve.r(32.9,0.2)  ## (temperature in oC, lambda)


####### Demo #####################

# generation interval
plot(gt.function(20)(1:100), type='l') ## using the default time length (120 days)
lines(gt.function(20,,402,.01)(1:100),lty=2)  ## custom time length

# R0
formalR0(32,1.35)  # custom default virus (DENV)
formalR0(32,1.35,2,,)  # custom virus (CHIKV)

# epidemic growth
system.time(solve.r(25,0.35)) # using the default r range = [-0.15, 0.15]
solve.r(32,1.35,,-0.15,.25)  # custom range

