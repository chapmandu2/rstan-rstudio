# R script to install RStan
# based on instructions here - https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Mac-or-Linux

#create personal makevars file
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)

#configure compiler flags
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
    "CXX14=g++", # or clang++ but you may need a version postfix
    file = M, sep = "\n", append = TRUE)

#install RStan and dependencies
install.packages("rstan",  type="source", dependencies=TRUE)

q()
