#### generate and r as a function of temperature
if(!require(pracma)){install.packages('pracma')}
library(pracma)
setwd("~")
setwd(dirname(list.files(pattern='epidemicGrowth.RData', recursive=TRUE, full.names=TRUE)))
load("./epidemicGrowth.Rdata")

# Syntax
set.seed(123)
gt.function(25)(0:50) ##(temperature in oC) (time_1: time_n)    
formalR0(25,0.4)   ## (temperature in oC, lambda)
solve.r(32.9,0.2)  ## (temperature in oC, lambda)


####### Demo #####################

# generation interval
plot(gt.function(20)(1:400), type='l') ## using the default time length (120 days)
lines(gt.function(20,,400,.01)(1:400),lty=2)  ## custom time length (400 days)

# R0
formalR0(32,1.35)  # custom default virus (DENV)
formalR0(32,1.35,2,,)  # custom virus (CHIKV)

# epidemic growth
system.time(solve.r(25,0.35)) # at 25 oC and lambda=0.35, using the default r range = [-0.15, 0.15]
solve.r(32,1.35,,-0.15,.25)  # 32 oC and lambda = 1.35, using custom range = [-0.15, 0.25]

