#!/system/bin/sh
export JAVA_HOME=/data/data/per.pqy.apktool/lix/jvm/java-7-openjdk-armhf/jre
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
$JAVA_HOME/bin/java -Xmx1024m -jar /data/data/per.pqy.apktool/mydata/smali.jar  "$@" && echo "OK!"
