# Notes on compiling slurm on container

## Compiling SLURM

[Slurm 24.05.1](https://download.schedmd.com/slurm/slurm-24.05.1.tar.bz2)

```bash
apt install wget bzip2 build-essential fakeroot devscripts equivs       

wget https://download.schedmd.com/slurm/slurm-24.05.1.tar.bz2
tar -xaf slurm*tar.bz2
cd slurm-24.05.1
mk-build-deps -i debian/control 
cd ..
mkdir artifacts
mv *.deb artifacts/
```
