#!/system/bin/sh
export JAVA_HOME=/data/data/per.pqy.apktool/lix/jvm/java-7-openjdk-armhf/jre
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
#in some targets,LD_PRELOAD will cause a error.
LD_PRELOAD=
cd /data/data/per.pqy.apktool
$JAVA_HOME/bin/java -Djava.io.tmpdir=/data/data/per.pqy.apktool -jar /data/data/per.pqy.apktool/mydata/jadx-cli.jar "$@"
