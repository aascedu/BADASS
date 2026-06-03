#! /bin/bash
ip link add vxlan10 type vxlan id 10 dev eth0 dstport 4789 local 10.255.0.12
ip link set vxlan10 up

ip link add br type bridge
ip link set br up

ip link set vxlan10 master br
ip link set eth1 master br
