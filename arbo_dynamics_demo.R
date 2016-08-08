#### generate and r as a function of temperature
if(!require(pracma)){install.packages('pracma')}
library(pracma)
setwd("~")
setwd(dirname(list.files(pattern='epidemicGrowth.RData', recursive=TRUE, full.names=TRUE)))
load("./epidemicGrowth.Rdata")

# Syntax

#     gt.function(temperature)(time) where (temperature in oC)  time is a vector (time initial:final in days)    

#     formalR0(temperature,lambda)  where (temperature in oC, lambda is the daily number of new adults mosquitoes per person)

#     solve.r(temperature,lamda)  ## where (temperature in oC, lambda)


####### Demo #####################
set.seed(123)

# generation interval
plot(gt.function(25)(1:400), type='l') ## at 25 oC, using the default time length (120 days)
lines(gt.function(25,,400,.01)(1:400),lty=2)  ## at 25 oC, custom time length (400 days)

# R0
formalR0(32,1.35)  # at 32 oC, default virus (DENV)
formalR0(32,1.35,2,,)  # at 32 oC, custom virus (2=CHIKV, temporarily set with DENV parameters)

# epidemic growth
system.time(solve.r(25,0.35)) # at 25 oC and lambda=0.35, using the default r range = [-0.15, 0.15]
solve.r(32,1.35,,-0.15,.25)  # at 32 oC and lambda = 1.35, using custom range = [-0.15, 0.25]

