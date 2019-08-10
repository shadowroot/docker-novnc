FROM ubuntu:19.04

ENV DEBIAN_FRONTEND noninteractive

COPY startup.sh /startup.sh

RUN     apt-get update -y && apt-get install apt-transport-https git x11vnc python3 wget python python-numpy unzip xvfb firefox awesome terminator geany menu \
                        libnss3 gnupg libsecret-1-0 && \
                        clang docker.io rustc golang -y && \
        cd /root && git clone https://github.com/kanaka/noVNC.git && \
        cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
        chmod 0755 /startup.sh && \
        cd /root && \
        apt-get autoclean && \
        apt-get autoremove && \
        rm -rf /var/lib/apt/lists/*

RUN     wget https://github.com/VSCodium/vscodium/releases/download/1.37.0/codium_1.37.0-1565373212_amd64.deb && \
        dpkg -i codium_1.37.0-1565373212_amd64.deb && \
        cd /root
#apt-get update -y && apt-get install codium -y


CMD /startup.sh
EXPOSE 6080
