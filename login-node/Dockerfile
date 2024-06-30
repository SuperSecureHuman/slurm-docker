FROM ubuntu:22.04 as build-env

WORKDIR /build
RUN apt-get update && \
    apt-get install -y wget bzip2 build-essential fakeroot devscripts equivs

ADD https://download.schedmd.com/slurm/slurm-24.05.1.tar.bz2 /build/
RUN tar -xaf slurm-24.05.1.tar.bz2 && \
    cd slurm-24.05.1 && \
    mk-build-deps -i debian/control -r -t "apt-get -y" && \
    debuild -b -uc -us

# Stage 2
FROM ubuntu:22.04

WORKDIR /tmp

COPY --from=build-env /build/slurm-smd_24.05.1-1_amd64.deb /tmp/
COPY --from=build-env /build/slurm-smd-client_24.05.1-1_amd64.deb /tmp/

RUN apt-get update && apt-get install -y /tmp/*.deb && \
    rm /tmp/*.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*