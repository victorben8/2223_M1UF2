#!/bin/bash

PORT="3745"
SERVER_AD="localhost"

echo "Cliente TURIP"

echo "(1)SEND MSG: HOLI_TURIP"

echo "HOLI_TURIP 127.0.0.1" | nc $SERVER_AD $PORT

echo "(2) Listen: comprobación del handshake"

MSG=`nc -l $PORT`

echo $MSG

if [ $MSG != "OK_TURIP" ]
then

	echo "ERROR 1: Handshake incorrecto"
	
	exit 1
fi

echo "(5)SEND"
echo "FILE_NAME vaca.vaca" | nc -l $PORT
echo "(6)listen"


exit 0
