#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
func_common(){ 
cd "$1"
/data/data/per.pqy.apktool/lix/exbootimg "$2" > /data/data/per.pqy.apktool/buildimg
[ -e ramdisk ] && rm -r ramdisk
mkdir ramdisk
cd ramdisk
cat ../ramdisk.cpio.gz |busybox gunzip -c|busybox cpio -i
}

func_mt65xx(){
cd "$1"
/data/data/per.pqy.apktool/lix/exbootimg "$2"  > /data/data/per.pqy.apktool/buildimg || exit
[ -e ramdisk ] && rm -r ramdisk
mkdir ramdisk
cd ramdisk
busybox dd if=../ramdisk.cpio.gz bs=512 skip=1|busybox gunzip -c|busybox cpio -i
}

[ -z "$4" ] && func_common "$@";
[ -n "$4" ] && func_mt65xx "$@";
