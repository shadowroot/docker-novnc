#!/bin/bash
export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1920x1060x16 &
sleep 5
awesome &
x11vnc -display $DISPLAY -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /root/noVNC && ln -s vnc_auto.html index.html && ./utils/launch.sh --vnc localhost:5900
