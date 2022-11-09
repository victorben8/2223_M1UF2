#!/bin/bash

PORT="3745"

echo "Servidor Transfer Unite Recursive International Protocol (TURIP)"

echo "(0)LISTEN"

MSG=`nc -l $PORT`

HANDSHAKE=`echo $MSG | cut -d " " -f 1`
IP_CLIENT=`echo $MSG | cut -d " " -f 2`

echo "(3) comprobación del handshake"
if [ "$HANDSHAKE" != "HOLI_TURIP" ]
then
	
	echo "ERROR 1: Handshake incorrecto"

	echo "KO_TURIP" | nc $IP_CLIENT $PORT
	
	exit 1
fi

echo "OK_TURIP" | nc $IP_CLIENT

echo "(4) LISTEN"

MSG=`nc -l $PORT`

FILE_NAME=`echo $MSG | cut -d " " -f 2`



exit 0
