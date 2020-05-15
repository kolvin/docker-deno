FROM ubuntu:latest
ARG DENO_VERSION=1.0.0

WORKDIR /

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip

RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s v${DENO_VERSION}

ENV export DENO_INSTALL="/root/.deno"
ENV export PATH="$DENO_INSTALL/bin:$PATH"

RUN deno --help