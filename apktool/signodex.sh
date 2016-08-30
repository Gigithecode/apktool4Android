#!/data/data/per.pqy.apktool/lix/busybox sh
BUSYBOX="/data/data/per.pqy.apktool/lix/busybox"
TARGET_ODEX="$1"
if [ -e /system/framework/"`$BUSYBOX basename $TARGET_ODEX`" ];then
ORIGIN_ODEX=/system/framework/"`$BUSYBOX basename $TARGET_ODEX`" 
elif [ -e /system/app/"`$BUSYBOX basename $TARGET_ODEX`" ];then
ORIGIN_ODEX=/system/app/"`$BUSYBOX basename $TARGET_ODEX`" 
else
echo "cannot find original odex file in /system!"
exit
fi

$BUSYBOX dd if="$ORIGIN_ODEX" of="$TARGET_ODEX"  bs=1 count=20 skip=52 seek=52 conv=notrunc && echo "OK!"