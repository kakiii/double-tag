#!/bin/bash
sudo ip link add br0 type bridge
sudo ip link add br1 type bridge

sudo ip link set br0 type bridge vlan_filtering 1
sudo ip link set br1 type bridge vlan_filtering 1
sudo ip link add veth0 type veth peer name veth1

sudo ip link set veth0 master br0
sudo ip link set veth1 master br1
sudo bridge vlan add dev veth0 vid 20 master
sudo bridge vlan add dev veth1 vid 20 master

sudo ifconfig br0 up
sudo ifconfig br1 up
sudo ifconfig veth0 up
sudo ifconfig veth1 up

sudo lxc-start host01
sudo lxc-start host02

sudo lxc-attach host01 ip addr add 192.168.55.2/24 dev eth1
sudo lxc-attach host02 ip addr add 192.168.13.3/24 dev eth1

sudo bridge vlan add dev vhost02 vid 20 pvid untagged master
sudo bridge vlan del dev vhost02 vid 1 pvid untagged master
