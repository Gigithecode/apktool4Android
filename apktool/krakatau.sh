#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix:/data/data/com.termux/files/usr/lib
#in some targets,LD_PRELOAD will cause a error.
LD_PRELOAD=
cd /data/data/per.pqy.apktool
/data/data/com.termux/files/usr/bin/python2 /data/data/com.termux/files/home/Krakatau/decompile.py "$@"
