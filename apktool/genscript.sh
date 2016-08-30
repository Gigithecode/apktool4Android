#!/system/xbin/busybox sh
export ROMPATH=/data/data/per.pqy.apktool/mydata/rom
export SCRIPTPATH=$ROMPATH/META-INF/com/google/android/updater-script

if [ -e $ROMPATH ] ;then
       busybox rm -r $ROMPATH;
fi
busybox mkdir -p $ROMPATH/META-INF/com/google/android/
busybox cp $ROMPATH/../update-binary $ROMPATH/META-INF/com/google/android/

busybox cp $ROMPATH/../busybox $ROMPATH/
cd /system
busybox tar cpf $ROMPATH/system.tar *

#begin generate updater-script
echo 'show_progress(0.100000, 1);' >> $SCRIPTPATH
echo 'ui_print("extract busybox");' >> $SCRIPTPATH
echo 'package_extract_file("busybox", "/busybox");' >> $SCRIPTPATH

echo 'ui_print("set permission");' >> $SCRIPTPATH
echo 'set_perm(0, 0, 00755, "/busybox");' >> $SCRIPTPATH

echo 'ui_print("fomating partitions");' >> $SCRIPTPATH
echo 'unmount("/system");' >> $SCRIPTPATH
SYSTEMPATH="`busybox mount|busybox grep \" /system \"|busybox awk '{print $1}'`"
SYSTEMFORMAT="`busybox mount|busybox grep \" /system \"|busybox awk '{print $5}'`"
if [ "$SYSTEMFORMAT" = "ext4" ];then
	FLASHTYPE=EMMC
else
	FLASHTYPE=MTD
fi
echo "format(\"$SYSTEMFORMAT\", \"$FLASHTYPE\", \"$SYSTEMPATH\", \"0\");" >> $SCRIPTPATH
echo "mount(\"$SYSTEMFORMAT\", \"$FLASHTYPE\", \"$SYSTEMPATH\", \"/system\");" >> $SCRIPTPATH

DATAPATH="`busybox mount|busybox grep \" /data \"|busybox awk '{print $1}'`"
echo "mount(\"$SYSTEMFORMAT\", \"EMMC\", \"$DATAPATH\", \"/data\");" >> $SCRIPTPATH
echo 'show_progress(0.500000, 10);' >> $SCRIPTPATH

echo 'ui_print("extract system.tar");' >> $SCRIPTPATH
echo 'package_extract_file("system.tar", "/data/system.tar");' >> $SCRIPTPATH
echo 'show_progress(0.900000, 10);' >> $SCRIPTPATH

echo 'run_program("/busybox", "tar", "xpf", "/data/system.tar", "-C", "/system");' >> $SCRIPTPATH
echo 'delete("/data/system.tar");' >> $SCRIPTPATH

if [ -e $ROMPATH/../boot.img ];then
	busybox cp $ROMPATH/../boot.img $ROMPATH/../writebootimg.sh $ROMPATH/
	echo 'ui_print("flashing boot.img");' >> $SCRIPTPATH
	echo 'package_extract_file("boot.img", "/boot.img");' >> $SCRIPTPATH
	echo 'package_extract_file("writebootimg.sh", "/writebootimg.sh");' >> $SCRIPTPATH
	echo 'set_perm(0,0,00755,"/writebootimg.sh");' >> $SCRIPTPATH
	echo 'run_program("/busybox", "sh", "/writebootimg.sh");' >> $SCRIPTPATH
fi
echo 'show_progress(1.00000, 1);' >> $SCRIPTPATH

echo 'ui_print("finish");' >> $SCRIPTPATH
echo 'unmount("/system");' >> $SCRIPTPATH
echo 'unmount("/data");' >> $SCRIPTPATH

echo "" >> $SCRIPTPATH
