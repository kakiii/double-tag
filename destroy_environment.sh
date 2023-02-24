#!/bin/bash
sudo lxc-stop host01
sudo lxc-stop host02
sudo lxc-destroy host01
sudo lxc-destroy host02

sudo ip link del br0
sudo ip link del br1
sudo ip link del veth1
