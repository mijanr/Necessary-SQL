FROM ubuntu:latest

# run update and install dependencies
RUN apt-get update && \
    apt-get install wget git -y 

# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b && \
    rm Miniconda3-latest-Linux-x86_64.sh

# set path to conda
ENV PATH /root/miniconda3/bin:$PATH

# update conda
RUN conda update -y conda

# install jupyternotebook
RUN conda install -y jupyter

# Create new environment from requirements.yaml
COPY requirements.yml .
RUN conda env create -f requirements.yml
# Clone the repo "https://github.com/mijanr/SQL.git"
# First create a directory projects at the home directory
RUN mkdir /home/projects
WORKDIR /home/projects

# Clone the repo
RUN git clone https://github.com/mijanr/SQL.git

# Activate the environment
RUN echo "source activate sql" > ~/.bashrc
ENV PATH /opt/conda/envs/sql/bin:$PATH

# Set the working directory
WORKDIR /home/projects/SQL