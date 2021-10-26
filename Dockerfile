FROM cm2network/steamcmd

ENV QUERYPORT 15777
ENV BEACONPORT 15000
ENV GAMEPORT 7777

WORKDIR /game
RUN /home/steam/steamcmd +login anonymous +force_install_dir /game +app_update 1690800 +quit

VOLUME /game/FactoryGame/Saved/Config/LinuxServer

EXPOSE $QUERYPORT/tcp $QUERYPORT/udp
EXPOSE $BEACONPORT/tcp $BEACONPORT/udp
EXPOSE $GAMEPORT/tcp $GAMEPORT/udp

ENTRYPOINT ./FactoryServer.sh
