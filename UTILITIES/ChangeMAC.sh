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
echo "Write the new MAC addr"
read mac_addr;


# Desactiva la interfaz: No puedes cambiar la MAC mientras la tarjeta está activa.
sudo ip link set dev $eth_interface down

# Cambia la MAC: Sustituye XX:XX... por la MAC autorizada que hayas obtenido.
sudo ip link set dev $eth_interface address $mac_addr

# Reactiva la interfaz:
sudo ip link set dev $eth_interface up

echo "Successfully changed to $mac_addr"
echo "---------------------CHANGE MAC ADDRESS LINUX-----------------------"