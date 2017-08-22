#!/system/bin/sh
export JAVA_HOME=/data/data/per.pqy.apktool/lix/jvm/java-7-openjdk-armhf/jre
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
#in some targets,LD_PRELOAD will cause a error.
LD_PRELOAD=
$JAVA_HOME/bin/java -jar /data/data/per.pqy.apktool/mydata/signapk.jar /data/data/per.pqy.apktool/mydata/x509 /data/data/per.pqy.apktool/mydata/pk8 "$@" && echo "OK!"

