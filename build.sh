#!/bin/bash

cd "$(dirname "$0")"

echo "Compiling Packages...."
cd deb_builder
docker build --output type=local,dest=./artifacts .
docker build -t slurm-artifacts .
cd ..

echo "Building slurm-login image..."
cd login-node
docker build -t slurm-login .
cd ..

echo "Building slurm-d image..."
cd compute_slurmd
docker build -t slurm-d .
cd ..

echo "Building slurm-ctld image..."
cd head_slurmctld
docker build -t slurm-ctld .
cd ..

echo "Building slurm-dbd image..."
cd db_SlurmDBD
docker build -t slurm-dbd .
cd ..

echo "All builds completed."