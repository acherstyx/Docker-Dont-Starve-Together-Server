FROM ubuntu:18.04

# steamcmd
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc1 libcurl4-gnutls-dev:i386 curl tar && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /root/DST && \
    mkdir -p /root/steamcmd && \
    cd /root/steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - 
# dst
RUN taskset -c 0 /root/steamcmd/steamcmd.sh \
            +login anonymous \
            +force_install_dir /root/DST \
            +app_update 343050  validate \
            +quit

# fix lib
RUN ln -s /root/steamcmd/linux32/libstdc++.so.6 /root/DST/bin/lib32/

# # test
# RUN cd /root/DST/bin &&\
#     ldd dontstarve_dedicated_server_nullrenderer &&\
#     ./dontstarve_dedicated_server_nullrenderer

# create exec script
RUN cd /root/DST/bin/ &&\
    echo ./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Master > start.sh &&\
    echo ./dontstarve_dedicated_server_nullrenderer -console -cluster MyDediServer -shard Caves > start.sh &&\
    chmod +x start.sh

COPY ./config /root/.klei/DoNotStarveTogether

VOLUME /root/.klei/DoNotStarveTogether/Cluster_1
VOLUME /root/DST/mods

WORKDIR /root/DST/bin
CMD "./start.sh"