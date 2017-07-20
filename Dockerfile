FROM debian:stable-slim

ARG CHEF_VER
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    curl -LO https://omnitruck.chef.io/install.sh && \
    bash ./install.sh -v ${CHEF_VER} && \
    rm install.sh && \
    apt-get purge -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
