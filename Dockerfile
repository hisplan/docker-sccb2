FROM r-base:4.1.0
LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

RUN apt-get update -y
RUN apt-get install -y build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev libxml2 libglpk-dev

# copy installation script
COPY ./scripts/install.R /opt/install.R

# install packages
RUN Rscript /opt/install.R

# copy processing scripts
COPY ./scripts/process-10x-mtx.R /opt/process-10x-mtx.R
COPY ./scripts/process-seqc-mtx.R /opt/process-seqc-mtx.R
