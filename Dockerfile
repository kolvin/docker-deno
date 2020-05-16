FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip

ARG DENO_VERSION=1.0.0
RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s v${DENO_VERSION}

ENV DENO_INSTALL="/root/.deno"
ENV PATH="$DENO_INSTALL/bin:$PATH"

WORKDIR /app

COPY app/dependices.js .
RUN deno cache dependices.js

ADD app/server.js .
RUN deno cache server.js

EXPOSE 8000

ENTRYPOINT [ "deno", "run", "--allow-net", "server.js"  ]