#!/bin/bash

TO="$1"
SUBJECT="$2"
MESSAGE="$3"
DIR="/home/zabbix/sip"

rm -rf /dev/shm/*
rm -rf $DIR/sip
echo $MESSAGE > $DIR/message
text2wave -o $DIR/voice $DIR/message
ffmpeg -i $DIR/voice -ar 8000 $DIR/voice.wav
sipcmd2 -P sip -u 227 -c Kasra@227 -f $DIR/voice.wav -w 192.168.35.208 -x "c${TO};v${DIR}/voice.wav"
rm -rf $DIR/*
