#!/bin/bash

tinc_name=`pwd | xargs basename`
tinc_port="655"
net_ip="10.143.0"
master_hostname="uniquestudio"

# judge whether continue
echo "*** Run this script will clear your old configure. Continue (y/n)? ***"
read answer
if [ -z $answer ] || [ $answer != 'y' ] ; then
  echo "Exit..."
  exit
fi


# generate tinc.conf
echo "*** Enter your hostname:"
read hostname
if [ -z $answer ] ; then
  echo "empty hostname"
  exit
fi

echo "# configure" > tinc.conf
echo "Name = $hostname" >> tinc.conf
echo "ConnectTo = $master_hostname" >> tinc.conf
echo "Device = /dev/net/tun" >> tinc.conf


# generate tinc-up and tinc-down script
echo "*** Enter your subnet ip:"
echo "*** e.g. $net_ip.233, you should enter 233:"
read subnet_ip
if [ -z $subnet_ip ] ; then
  echo "empty subnet ip"
  exit
fi

echo "#!/bin/sh" > tinc-up
echo "ip link set \$INTERFACE up" >> tinc-up
echo "ip addr add $net_ip.$subnet_ip/32 dev \$INTERFACE" >> tinc-up
echo "ip route add $net_ip.0/24 dev \$INTERFACE" >> tinc-up

echo "#!/bin/sh" > tinc-down
echo "ip route del $net_ip.0/24 dev \$INTERFACE" >> tinc-down
echo "ip addr del $net_ip.$subnet_ip/32 dev \$INTERFACE" >> tinc-down
echo "ip link set \$INTERFACE down" >> tinc-down

chmod +x tinc-up tinc-down

# create host file, and generate key
echo "Port = $tinc_port" > hosts/$hostname
echo "Subnet = $net_ip.$subnet_ip/32" >> hosts/$hostname
/usr/local/sbin/tincd -n $tinc_name -K

# end
echo "Generate complete."

