FROM ubuntu:18.04

RUN mkdir -p /root/dst && \
    mkdir -p /root/steamcmd

# Install requirements
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y curl tar ca-certificates lib32gcc1 lib32stdc++6 libcurl4-gnutls-dev:i386 && \
    # steamcmd
    cd /root/steamcmd && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
    # cleanup
    apt-get autoremove --purge -y wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
# Install Don't Starve Together
RUN taskset -c 0 /root/steamcmd/steamcmd.sh \
    +@ShutdownOnFailedCommand 1 \
    +@NoPromptForPassword 1 \
    +login anonymous \
    +force_install_dir /root/dst \
    +app_update 343050 validate \
    +quit

# Create exec script
RUN cd /root/dst/bin/ && \
    echo '/root/steamcmd/steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /root/dst +app_update 343050 +quit' >> start.sh && \
    echo './dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard $SHARD_NAME' >> start.sh && \
    chmod +x start.sh

VOLUME /root/.klei/DoNotStarveTogether/MyDediServer
VOLUME /root/dst/mods
VOLUME /root/dst/ugc_mods

WORKDIR /root/dst/bin
CMD "./start.sh"