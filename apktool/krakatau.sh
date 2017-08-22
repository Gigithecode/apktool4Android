#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix:/data/data/com.termux/files/usr/lib
#in some targets,LD_PRELOAD will cause a error.
LD_PRELOAD=
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/data/org.qpython.qpy/lib
export PYTHONHOME=/data/data/org.qpython.qpy/
export PYTHONPATH=/data/data/org.qpython.qpy/:/data/data/org.qpython.qpy/files/lib/python2.7/lib-dynload:/data/data/org.qpython.qpy/files/lib/python2.7/site-packages
cd /data/data/per.pqy.apktool
/data/data/org.qpython.qpy/files/bin/qpython.sh /sdcard/apktool/Krakatau/disassemble.py "$@"
