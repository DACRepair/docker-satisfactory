FROM debian:latest

ENV QUERYPORT 15777
ENV BEACONPORT 15000
ENV GAMEPORT 7777

# Install SteamCMD
WORKDIR /steamcmd
RUN apt-get -qq update && apt-get -qq -y install curl lib32gcc-s1 \
	  && rm -rf /var/lib/apt/lists/*
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

RUN ls -lah /app
RUN ln -s /app/steamcmd.sh /bin/steamcmd
RUN steamcmd +quit


#WORKDIR /game
#RUN steamcmd +login anonymous +force_install_dir /game +app_update 1690800 +quit

VOLUME /game/FactoryGame/Saved/Config/LinuxServer

EXPOSE $QUERYPORT/tcp $QUERYPORT/udp
EXPOSE $BEACONPORT/tcp $BEACONPORT/udp
EXPOSE $GAMEPORT/tcp $GAMEPORT/udp

ENTRYPOINT ./FactoryServer.sh
