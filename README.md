Temperature driven dynamics of Arboviral diseases, Version 1
============================================================

### Content:

* `DESCRIPTION` 
* `CITATION`
* `DATA FORMAT`
* `FUNCTIONS`
* `REFERENCES`

### DESCRIPTION:

This RData file contains data and functions used in the published work: 

Siraj AS, Oidtman RJ, Huber JH, Kraemer MUG, Brady OJ, Johansson MA, Perkins TA. Temperature modulates dengue virus epidemic growth rates through its effects on reproduction numbers and generation intervals. PLOS Negl Trop Dis. 2017. 

All code contained within this repository is released under the [CRAPL v0.1 License](http://matt.might.net/articles/crapl/). 

This is the release of version 1 of the package. If you should discover any problems or errors, please inform us at: asiraj@nd.edu or taperkins@nd.edu.

====================

### CITATION

We recommend the following for citing the package:

Siraj AS, Oidtman RJ, Huber JH, Kraemer MUG, Brady OJ, Johansson MA, Perkins TA. Temperature modulates dengue virus epidemic growth rates through its effects on reproduction numbers and generation intervals. PLOS Negl Trop Dis. 2017.  Available at `----------`. (Accessed `Date of download`).


### DATA FORMAT

The data and functions are packaged in the format RData, readable by the R statistical and computational program (R Core Team, 2016). The package requires the R package pracma to run.

### FUNCTIONS

Following are the functions included in the package. A demonstration .R file (`arbo_dynamics_demo.R`), included with the package, facilitates getting started with the basic functions in the package.

* `biterate.1st`: This function returns the inverse length (in days) of the first gonotrophic cycle for Aedes aegypti for a given temperature (Focks et al., 1993). It has one required argument: `temp` (temperature in oC).
* `biterate.2nd`: This function returns the inverse length (in days) of the second gonotrophic cycle for Aedes aegypti for a given temperature (Otero et al., 2006). It has one required argument: `temp` (temperature in oC).
* `biterate.avg`: This function has two dependencies: with the functions `biterate.1st` and `biterate.2nd`. For a given temperature it returns the mean biting rate (1/ length of the gonotrophic cycle) over the length of a mosquito’s life time. It has one required argument: `temp` (i.e. temperature in oC).
* `iploc`: This function generates the location parameter for a log-normal distributed incubation period (in days) for a given temperature (Chan & Johansson, 2012). It has three required arguments: `temp` (temperature in oC), `b0` (the intercept of the linear model, fixed at 2.9 and 0.56 for DENV EIP and IIP respectively), and `bt` (the coefficient of temperature, fixed at -0.08 and 0 for DENV EIP and IIP respectively).
* `eip.mean`: This function generates the mean of the distribution of extrinsic incubation period (in days) for a given temperature (Chan & Johansson, 2012). It has one required argument: `temp` (temperature in oC).
* `hinfectiousness`: This function returns histogram value and two parameters for the infectious period in humans: a histogram of probability of infections initiated from bites occurring x days from the day of symptoms onset, r (1/the length of infectious period), c (the average probability of infections among mosquitoes after an infectious bite) (Nishiura & Halstead, 2007). It has one required argument: `vir` (the virus considered, 1=DENV, 2=CHIKV, 3=ZIKV)
* `mle.norm`: This function returns the maximum likelihood parameters of a normal distribution based on values of a standardized histogram. It has one required argument: `hist` (a n x 2 matrix with columns for the x-axis values and the histogram values respectively).
* `mortalityRT`: This function generates the mean of the mortality rate at for a given temperature (Brady et al., 2013). It has one required arguments: `temp` (temperature in oC); and one optional argument: `fldcxn` (the correction factor for morality in the field). This function uses a GAM model to generate mortality estimates in laboratory setting, and adds a correction factor with a default value of 0.0897.
* `eip`: This function has one dependency: with the function `iploc`. It generates the distribution of extrinsic incubation period (in days) for a given temperature (Chan & Johansson, 2012). It has one required argument: `temp` (temperature in oC); and two optional arguments: `tmax` (the maximum time length), and `tby` (the time step size). The default `tmax` value is 120 d spaced at a default `tby` value of 0.01 d. Note that optional arguments take the default values unless users specify customized values in the function call statement. 
* `hmtp`: This function has two dependencies: with the functions `hinfectiousness` and `mle.norm`. It generates the distribution of human to mosquito transmission period (in days). It has no required argument, but has two optional arguments: `tmax` (the maximum time length), and `tby` (the time step size). The default `tmax` value is 120 d spaced at a default `tby` value of 0.01 d.
* `iip`: This function has one dependency: with the function `iploc`. It generates the distribution of intrinsic incubation period (in days) (Chan & Johansson, 2012). It has one required argument: `temp` (temperature in oC); and two optional arguments: `tmax` (the maximum time length), and `tby` (the time step size). The default `tmax` value is 120 d spaced at a default `tby` value of 0.01 d.
* `mhtp`: This function has one dependency: with the function `mortalityRT`. It generates the distribution of mosquito to human transmission period (in days) for a given temperature. It has one required argument: `temp` (temperature in oC); and three optional arguments: `fldcxn` (the correction factor for morality in the field), `tmax` (the maximum time length), and `tby` (the time step size). The default `tmax` value is 120 d spaced at a default `tby` value of 0.01 d, while the default field correction factor is 0.0897.
* `formalR0`: This function has four dependencies: with the function `eip.mean`, `mortalityRT`, `biterate.avg`, and `hinfectiousness`. It generates the basic reproduction number (R0) for a given temperature and a given measure of mosquito abundance, `λ` (i.e. the average daily number of new adults per humans). It has two required argument: `temp` (temperature in oC) and `lambda` (the daily ratio of new adults to humans); and three optional arguments:  `vi` (the virus considered),  `b` (the probability of infection in humans after an infectious bite), and  `fldcxn` (the correction factor for morality in the field). The default `vi` is 1 (DENV), while `b` and `fldcxn`  have defaults values of 0.4 and 0.0897 respectively.
* `gt.function`: This function has four dependencies: with the function `iip`, `hmtp`, `eip`, and `mhtp`. For a given temperature, it generates the generation interval’s probability distribution function. It has one required argument: `temp` (temperature in oC); and three optional arguments: `ldcxn` (the correction factor for morality in the field), `tmax` (the maximum time length), and `tby` (the time step size). The default `tmax` value is 120 d spaced at a default `tby` value of 0.01 d, while `fldcxn` has a default value of 0.0897. Since the return value is a function, we need to follow the function call by an argument (in days) `t` (or a vector of t values) to generate the probability at that/those specific time/s.
* `solve.r`: This function has two dependencies: with the functions `formalR0` and `gt.function`. Given a reproduction number, `R0`, and a generation interval distribution function `gt.function` at a given temperature, it solves for little `r`. It has two required arguments: `temp` (temperature in oC) and `lambda` (the daily ratio of new adults to humans); and three optional arguments: `tll` (tolerance value for integration over the function `exp (r*t) * gt.function`, `minr` (the lower bound of little `r` to be searched by the optimizer), and `maxr` (the upper bound or `r`). The default values for `tll`, `minr` and `maxr` are 0.001, -0.15 and 0.15 respectively. Since this function involves both optimization and integration, it is computationally the largest function of all.

### REFERENCES

* Brady OJ, Johansson, MA, Guerra CA, Bhatt S, Golding N, Pigott DM, et al. Modelling adult Aedes aegypti and Aedes albopictus survival at different temperatures in laboratory and field settings. Parasites & Vectors 2013; 6:1-12.
* Chan M, Johansson MA. The incubation periods of dengue viruses. PLoS ONE 2012; 7:e50972.
* Focks DA, Haile DG, Daniels E, Mount GA. Dynamic Life Table Model for Aedes aegypti (Dprera: Culicidae): Analysis of the Literature and Model Development. Journal of Medical Entomology 1993; 30:1003-17.
* Nishiura H, Halstead SB. Natural History of Dengue Virus (DENV)–1 and DENV-4 Infections: Reanalysis of Classic Studies. The Journal of Infectious Diseases 2007; 195:1007–13.
* Otero M, Solari HG, Schweigmann N. A Stochastic Population Dynamics Model for Aedes Aegypti: Formulation and Application to a City with Temperate Climate. Bulletin of Mathematical Biology 2006; 68:1945-74.
