# https://satisfactory.fandom.com/wiki/Dedicated_servers

FROM steamcmd/steamcmd:latest

ENV QUERYPORT 15777
ENV BEACONPORT 15000
ENV GAMEPORT 7777

# Install Satisfactory
WORKDIR /game
RUN steamcmd +login anonymous +force_install_dir /game +app_update 1690800 +quit
RUN ls -lah /game

VOLUME /game/FactoryGame/Saved/Config/LinuxServer

EXPOSE $QUERYPORT/tcp $QUERYPORT/udp
EXPOSE $BEACONPORT/tcp $BEACONPORT/udp
EXPOSE $GAMEPORT/tcp $GAMEPORT/udp

ENTRYPOINT ./FactoryServer.sh
CMD ""
