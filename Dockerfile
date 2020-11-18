FROM rocker/verse:4.0.3

# add shiny server
#RUN export ADD=shiny && bash /etc/cont-init.d/add

################
#linux deps general
################

RUN apt-get update -y && \
	apt-get install -y \ 
		gnupg \
		curl \
		apt-transport-https \
		apt-utils \
		unixodbc

################
#odbc and MS SQL Server
################

RUN \
	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
	curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
	apt-get update -y && \
	ACCEPT_EULA=Y apt-get install -y msodbcsql17

################
# install linux dependencies of R packages
################

#RUN apt-get install -y libudunits2-dev

################
# install R dependencies
################

#modify the default MAKE setting to allow parallel compiling
#RUN sed -i "/^MAKE/c\MAKE='make -j 6'" /usr/local/lib/R/etc/Renviron

#RUN R -e "install.packages(c('odbc', 'DT', 'furrr', 'plumber', 'tidygraph', 'ggforce', 'ggraph'))"

###############
# install rstan and other dependencies using rscript
###############

#COPY ./install_rstan.R /etc/rstudio/
#RUN Rscript /etc/rstudio/install_rstan.R

################
# install rjags + others
################

#RUN apt-get install -y jags
#RUN R -e "install.packages(c('rjags', 'prophet', 'tidybayes', 'brms'))"

#############
#install rethinking
############
#RUN R -e "install.packages(c('mvtnorm', 'loo', 'coda'))"
#RUN R -e "devtools::install_github('rmcelreath/rethinking', ref='Experimental')"
#RUN R -e "devtools::install_github('mjskay/tidybayes.rethinking', dependencies=FALSE, upgrade_dependencies=FALSE)"

#############
# visualisation packages
#############

#RUN R -e "install.packages(c('shinydashboard'))"

#############
# modelling packages
#############

#RUN R -e "install.packages(c('tidymodels', 'ranger', 'C50', 'kernlab', 'nlme'))"


################
# configure shiny server
################

#COPY ./shiny-server.conf /etc/shiny-server/shiny-server.conf
#RUN mkdir -p /home/rstudio/ShinyApps && \
#	chown -hR rstudio:rstudio /home/rstudio/ShinyApps

