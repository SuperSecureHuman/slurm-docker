FROM ubuntu:22.04 as build-env

WORKDIR /build
RUN apt-get update && \
    apt-get install -y wget bzip2 build-essential fakeroot devscripts equivs

ADD https://download.schedmd.com/slurm/slurm-24.05.1.tar.bz2 /build/
RUN tar -xaf slurm-24.05.1.tar.bz2 && \
    cd slurm-24.05.1 && \
    mk-build-deps -i debian/control -r -t "apt-get -y" && \
    debuild -b -uc -us


FROM scratch AS export-stage

COPY --from=build-env /build/*.deb ./