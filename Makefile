
build:
	docker build --file=./Dockerfile --tag=rstan-rstudio .
	
run: build
	docker run -d -p 8787:8787 -p 3839:3838 \
		-e DISABLE_AUTH=true \
		--name='rstan-rstudio' \
		-v ${HOME}:/home/rstudio/hostdata \
		activity-explore-bayes

stop:
	docker stop rstan-rstudio

start:
	docker start rstan-rstudio

remove: stop
	docker rm rstan-rstudio


