#!/usr/bin/env bash
# Ver puertos locales sin netcat ni nmap
# @wvverez
# Abusar de /dev/tcp para enumerar puertos internos

if [ $EUID -ne 0 ]; then
echo "[i] sudo"
exit 1
fi

for puerto in {1..65535}; do
        (bash -c 'echo "" > /dev/tcp/127.0.0.1/"$1"' _ "$puerto" 2>/dev/null && echo "[i] Puerto '"$puerto"' abierto") &
        while [ "$(jobs -rp | wc -l)" -ge 100 ]; do wait -n; done
done
wait
