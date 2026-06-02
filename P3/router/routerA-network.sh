#! /bin/bash
ip link add vxlan10 type vxlan id 10 dev eth0 dstport 4789 local 10.255.0.11 nolearning
ip link set vxlan10 up

ip link add br-vxlan10 type bridge
ip link set br-vxlan10 up

ip link set vxlan10 master br-vxlan10
ip link set eth1 master br-vxlan10