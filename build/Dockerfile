FROM jupyter/datascience-notebook
LABEL maintainer="Alessandro Aimi <alleaimi95@gmail.com>"
LABEL Description="Docker image for NS-3 Network Simulator and Jupiter Notebooks"

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# General dependencies (namely, boost)
RUN mamba install --quiet --yes \
    'boost' 'ortools-cpp' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
  
# Configure environment
ENV NS3DIR="${HOME}/ns-3-dev"

COPY waff /usr/local/bin/waff
RUN chmod a+rx /usr/local/bin/waff
    
WORKDIR "${HOME}"

# Switch back to jovyan to avoid accidental container runs as root
USER ${NB_UID}

RUN git clone https://gitlab.com/non-det-alle/ns-3-dev.git && \
  waff configure -d optimized && \
  waff &&\
	fix-permissions "${HOME}/ns-3-dev"
