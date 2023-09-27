FROM buildpack-deps:stable

RUN apt-get update \
  && apt-get install -yqq --no-install-recommends \
    clang \
    libgc-dev \
  && rm -rf /var/lib/apt/lists/*

ENV VFlAGS="-cc clang"
RUN mkdir -p /opt && cd /opt \
  && git clone https://github.com/vlang/v \
  && cd v \
  && make \
  && ./v symlink

COPY . /kaico
WORKDIR /kaico
