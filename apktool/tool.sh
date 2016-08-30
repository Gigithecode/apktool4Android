#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
#in some targets,LD_PRELOAD will cause a error.
LD_PRELOAD=
cd "$1"
/data/data/per.pqy.apktool/lix/7za x -tzip "$2" META-INF 
