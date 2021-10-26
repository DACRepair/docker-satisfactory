FROM arch:latest

ENV QUERYPORT 15777
ENV BEACONPORT 15000
ENV GAMEPORT 7777

RUN pkg --no-cache add git makepkg








WORKDIR /game
VOLUME /game/FactoryGame/Saved/Config/LinuxServer

EXPOSE $QUERYPORT/tcp $QUERYPORT/udp
EXPOSE $BEACONPORT/tcp $BEACONPORT/udp
EXPOSE $GAMEPORT/tcp $GAMEPORT/udp

ENTRYPOINT ./FactoryServer.sh
