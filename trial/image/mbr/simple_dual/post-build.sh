#!/bin/bash
set -eu

ROOTFS=$1

# configure autologin
mkdir -p ${ROOTFS}/etc/systemd/system/getty@tty1.service.d

cat <<EOF > ${ROOTFS}/etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noclear --autologin trial %I \$TERM
Type=idle
EOF
