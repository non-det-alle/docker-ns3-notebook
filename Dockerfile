FROM jupyter/datascience-notebook
LABEL maintainer="Alessandro Aimi <alleaimi95@gmail.com>"
LABEL Description="Docker image for NS-3 Network Simulator and Jupiter Notebooks"

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# General dependencies
RUN apt-get update --yes && \
  apt-get install --yes --no-install-recommends g++ && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
  
# Configure environment
ENV NS3DIR="${HOME}/ns-3-dev"

COPY waff /usr/local/bin/waff
RUN chmod a+rx /usr/local/bin/waff
    
WORKDIR "${HOME}"

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}

RUN git clone https://gitlab.com/non-det-alle/ns-3-dev.git && \
	waff configure --build-profile=optimized && \
	waff && \
	chmod -R g=u ns-3-dev/
