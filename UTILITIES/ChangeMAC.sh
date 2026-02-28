#!/bin/bash

# Get ethernet interface (normally eth0 or enp3sX)
eth_interface=$(ip -br l | awk '$1 !~ "lo|vir|wl" {print $1}');
# Get current mac address
current_mac=$(cat /sys/class/net/"$eth_interface"/address);

echo ""
# echo "$'ip link show: '"
# ip link show
echo ""
echo "---------------------CHANGE MAC ADDRESS ETHERNET LINUX-----------------------"
echo ""
echo "Your ethernet interface is [$eth_interface]"
echo ""
echo "Your current MAC address is [$current_mac]" 
echo ""
echo "Known MAC address are:"
echo "F: C-222 - B0:22:7A:21:D1:41"
echo "F: C-220 - B0:22:7A:22:F5:23"
echo "F: C-219 - B0:22:7A:22:F5:FD"
echo ""
echo "Write the new MAC addr"
read mac_addr;


# Desactiva la interfaz: No puedes cambiar la MAC mientras la tarjeta está activa.
sudo ip link set dev $eth_interface down

# Cambia la MAC: Sustituye XX:XX... por la MAC autorizada que hayas obtenido.
sudo ip link set dev $eth_interface address $mac_addr

# Reactiva la interfaz:
sudo ip link set dev $eth_interface up

echo "Successfully changed to [$mac_addr]"
echo "---------------------CHANGE MAC ADDRESS LINUX-----------------------"
