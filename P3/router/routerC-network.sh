#! /bin/bash
ip link add vxlan10 type vxlan id 10 dev eth0 dstport 4789
ip link set vxlan10 up

ip link add br0 type bridge
ip link set br0 up

ip link set vxlan10 master br0
ip link set eth1 master br0
