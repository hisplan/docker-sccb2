FROM r-base:4.1.0
LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

RUN apt-get update -y
RUN apt-get install -y build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev libxml2 libglpk-dev

# copy scripts
COPY ./scripts/install.R /opt/install.R

# install packages
RUN Rscript /opt/install.R
