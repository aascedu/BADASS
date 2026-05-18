#! /bin/bash

set -e

busybox --install

if [ -f /network.sh ]; then
    chmod +x /network.sh
    /network.sh
fi

exec busybox sh