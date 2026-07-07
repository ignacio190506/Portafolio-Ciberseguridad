#!/bin/bash
# Si no se especifican IPS
if [[ $# -eq 0 ]]
then
	echo -e "Error no especificaste ninguna IP"
	echo -e "Uso: $0 <IP1> <IP2> <IP3> ..."
	exit 1
fi
for ip in "$@"
do
	echo "$ip"
	ping -c 2 -W 2 "$ip" > /dev/null 2>1
	if [[ $? -eq 0 ]]
	then
		echo -e "Estado: En linea"
	else
		echo -e "Estado: Fuera de linea"
	fi
done

