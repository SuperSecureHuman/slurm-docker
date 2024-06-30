#!/bin/bash

# change into the master directory
cd master

# build the Docker container for the master
docker build -t  slurm_master .

# change into the worker directory
cd ../node

# build the Docker container for the worker
docker build -t slurm_worker .