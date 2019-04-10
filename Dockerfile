#FROM debian:jessie
FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/' /etc/apt/sources.list
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

EXPOSE 873
VOLUME /data
ADD ./run /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]
