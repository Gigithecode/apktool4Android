#!/system/bin/sh
#export LD_LIBRARY_PATH=/data/data/per.pqy.apktool/lix
func_common(){
#1为boot.img-ramdisk路径或recovery.img-ramdisk路径
cd "$1/ramdisk"
busybox find . | busybox cpio -o -H newc | busybox gzip > ../ramdisk.cpio.gz
cd ..
sh -c "`cat /data/data/per.pqy.apktool/buildimg`" &&echo "OK!" 
}

func_mt65xx(){
cd "$1/ramdisk"
busybox find .|busybox cpio -o -H newc|busybox gzip > ../ram
cd ..
/data/data/per.pqy.apktool/lix/revise ram ramdisk.cpio.gz
sh -c "`cat /data/data/per.pqy.apktool/buildimg`" &&echo "OK!" 
rm ram
}

[ -n "$3" ] && func_mt65xx "$@";
[ -z "$3" ] && func_common "$@";

#rm -r kernel ramdisk.cpio.gz ramdisk