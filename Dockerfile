# Use miniconda as base image
FROM continuumio/miniconda3

# install postgresql
RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib

# start postgresql service
RUN service postgresql start

# Install jupyternotebook
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

# Expose the port
EXPOSE 8888