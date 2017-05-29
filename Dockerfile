FROM debian:8
MAINTAINER Daniel Ripoll <info@danielripoll.es>

# Update the Debian repository indexes
# There are some warnings (in red) that show up during the build. You can hide
# them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)
RUN (apt-get update)

RUN (DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb)

RUN (mkdir /etc/mongodb)
ADD confs/mongodb.conf /etc/mongodb/mongodb.conf

ADD run.sh /usr/local/bin/run
RUN (chmod +x /usr/local/bin/run)

EXPOSE 27017
EXPOSE 28017

CMD ["/usr/local/bin/run"]
