FROM debian:latest
SHELL ["/bin/bash", "-c"]

ENV QUERYPORT 15777
ENV BEACONPORT 15000
ENV GAMEPORT 7777

RUN printenv

# Install SteamCMD
WORKDIR /steamcmd
RUN apt-get -qq update && apt-get -qq -y install curl lib32gcc-s1 \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
RUN ln -s /steamcmd/linux32/steamcmd /usr/bin/steamcmd && chmod a+x /usr/bin/steamcmd
RUN steamcmd +quit | true


WORKDIR /game
RUN steamcmd +login anonymous +force_install_dir /game +app_update 1690800 +quit | true

VOLUME /game/FactoryGame/Saved/Config/LinuxServer

EXPOSE $QUERYPORT/tcp $QUERYPORT/udp
EXPOSE $BEACONPORT/tcp $BEACONPORT/udp
EXPOSE $GAMEPORT/tcp $GAMEPORT/udp

ENTRYPOINT ./FactoryServer.sh
