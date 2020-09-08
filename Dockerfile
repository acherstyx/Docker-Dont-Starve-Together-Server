FROM ubuntu

# rely
RUN apt-get update &&\
    apt-get install lib32gcc1 screen -y
    # rm -rf /var/lib/apt/lists/*

RUN apt-get install wget tar -y

# steamcmd
RUN mkdir /steamcmd &&\
    cd /steamcmd &&\
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz &&\
    tar -xvzf steamcmd_linux.tar.gz &&\
    rm steamcmd_linux.tar.gz
# dst
RUN taskset -c 0 /steamcmd/steamcmd.sh \
            +login anonymous \
            +force_install_dir /dst \
            +app_update 343050  validate \
            +quit

# test
RUN cd /dst/bin &&\
    ldd dontstarve_dedicated_server_nullrenderer &&\
    ./dontstarve_dedicated_server_nullrenderer

# create exec script
RUN cd /dst/bin/ &&\
    echo ./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Master > start.sh &&\
    echo ./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Caves > start.sh &&\
    chmod +x start.sh

VOLUME /root/.klei/DoNotStarveTogether/Cluster_1
VOLUME /root/DST/mods

WORKDIR /dst/bin
CMD "/dst/bin/start.sh"
