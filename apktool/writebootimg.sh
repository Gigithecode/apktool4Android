#!/busybox sh
BOOTIMG="`/busybox cat /etc/recovery.fstab |/busybox grep "/boot[[:space:]]"|/busybox awk '{print $3}'`"
/busybox cat /boot.img > $BOOTIMG
