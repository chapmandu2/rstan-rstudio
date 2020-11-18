# R script to install RStan
# based on instructions here - https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Mac-or-Linux

#create personal makevars file
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)

#configure compiler flags
cat("\nCXXFLAGS=-O3 -mtune=native -march=native",
    "CXXFLAGS= -Wno-unused-variable -Wno-unused-function  -Wno-macro-redefined",
    file = M, sep = "\n", append = TRUE)


#install RStan and dependencies
install.packages("rstan",  dependencies=TRUE)

q()
