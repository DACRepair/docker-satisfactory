# https://satisfactory.fandom.com/wiki/Dedicated_servers

FROM steamcmd/steamcmd:latest

ENV UID 2000

ENV QUERYPORT 15777
ENV BEACONPORT 15000
ENV GAMEPORT 7777

# Install Satisfactory
WORKDIR /game
RUN steamcmd +login anonymous +force_install_dir /game +app_update 1690800 +quit

# Add run user
RUN adduser --disabled-password --gecos '' --uid $UID satisfactory
RUN chown -R satisfactory /game
USER satisfactory

RUN ls -lah /game

VOLUME /game/FactoryGame/Saved/Config/LinuxServer

EXPOSE $QUERYPORT/tcp $QUERYPORT/udp
EXPOSE $BEACONPORT/tcp $BEACONPORT/udp
EXPOSE $GAMEPORT/tcp $GAMEPORT/udp

ENTRYPOINT ./FactoryServer.sh
CMD ""
