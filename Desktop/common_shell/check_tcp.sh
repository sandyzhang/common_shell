#!/bin/sh
hostname=$1
port=$2
timestamp=`date +%s`
nc -z -w1 $hostname $port > /dev/null 2>&1
echo -e  "$timestamp\t result=$?"