# About this repo

This repo provides a Dockerfile and Makefile that generate a docker image with RStudio, RStan and other bayesian modelling packages installed.

To use clone the repo and type `make build`.  Then `make run` and navigate to localhost:8787.  

Alternatively run on an cloud VM as described but SSH to the VM as follows to SSH tunnel and permit access to RStudio from a local browser:

`ssh -L 8787:localhost:8787 remoteuser@remotevm`

