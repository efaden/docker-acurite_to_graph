# == Dockerized RTLSDR 433 to Prometheus
#

FROM rtlsdr-433:latest

MAINTAINER Eric Faden <efaden@gmail.com>

ENV DEBIAN_FRONTEND="noninteractive" 

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install Required Stuff
RUN apt-get -y update && apt-get -y install \
      golang \
      git \
	&& rm -rf /var/lib/apt/lists/*

# Add Chronix Service
RUN mkdir /etc/service/acurite_to_graph
COPY acurite_to_graph.sh /etc/service/acurite_to_graph/run
RUN chmod +x /etc/service/acurite_to_graph/run

# Download and Install Chronix
RUN mkdir /acurite_to_graph && \
      export GOPATH=/acurite_to_graph && \
      cd acurite_to_graph && \
      go get github.com/efaden/acurite_to_graph && \
      cd /acurite_to_graph/src/github.com/efaden/acurite_to_graph && \
      go build && \
      cp acurite_to_graph /usr/local/bin && \
      cd / && \
      rm -rf /acurite_to_graph

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose Port
EXPOSE 44010

