#!/usr/bin/env bash
# @wvverez
# Abusar de /dev/tcp para escaner puertos 

if [ $EUID -ne 0 ]; then
echo "[i] sudo"
exit 1
fi

IP="$1"

for puerto in {1..65535}; do
        (bash -c 'echo "" > /dev/tcp/"$1"/"$2"' _ "$IP" "$puerto" 2>/dev/null && echo "[i] Puerto '"$puerto"' abierto") &
        while [ "$(jobs -rp | wc -l)" -ge 100 ]; do wait -n; done
done
wait
