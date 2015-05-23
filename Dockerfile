FROM ubuntu:14.04.2

MAINTAINER da9l https://github.com/da9l

RUN apt-get update -y && \
        apt-get install -y \
        autoconf \
        automake \
        g++ \
        gcc \
        gcc-multilib \
        libtool \
        m4 \
        make \
        perl \
        wget

RUN adduser --gecos 'PocketMine-MP' --disabled-password --home /pocketmine pocketmine

WORKDIR /pocketmine
RUN mkdir /pocketmine/PocketMine-MP
RUN chown -R pocketmine:pocketmine /pocketmine

COPY assets/server.properties /pocketmine/server.properties.original
COPY assets/entrypoint.sh /pocketmine/entrypoint.sh
COPY assets/plugins.sh /pocketmine/plugins.sh

RUN chmod 755 /pocketmine/plugins.sh
RUN chmod 755 /pocketmine/entrypoint.sh

USER pocketmine

ENV GNUPGHOME /pocketmine

RUN gpg --keyserver pgp.mit.edu --recv-key 2280B75B
RUN cd PocketMine-MP && wget -q -O - http://cdn.pocketmine.net/installer.sh | bash -s - -v beta
RUN /pocketmine/plugins.sh

EXPOSE 19132
EXPOSE 19132/udp

ENTRYPOINT ["./entrypoint.sh"]
