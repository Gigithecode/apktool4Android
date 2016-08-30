#!/system/bin/sh
export JAVA_HOME=/data/data/com.termux/files/home/jdk1.7.0_75
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
$JAVA_HOME/bin/java -Xmx1024m -jar /data/data/per.pqy.apktool/mydata/smali.jar  "$@" && echo "OK!"
