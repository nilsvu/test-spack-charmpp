FROM ubuntu:20.04

RUN apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git curl python3 autoconf automake cmake gcc-10 g++-10 gfortran-10

RUN git clone https://github.com/spack/spack \
  && ./spack/bin/spack debug report \
  && ./spack/bin/spack compiler find \
  && ./spack/bin/spack compiler info gcc@10 \
  && ./spack/bin/spack external find --not-buildable \
  && ./spack/bin/spack install charmpp@develop%gcc
