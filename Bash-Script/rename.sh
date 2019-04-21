#!/bin/bash

DATE=`date +%Y-%m-%d`
echo "Please enter extension"


read  ext
var1=mycat.$ext


echo "Please enter prefix"
read  key

   if [[ $key = "" ]]; then
        var2="$DATE $var1"

   else
        var2="$key $var1"

   fi

 echo "Renaming from $var1 to $var2"


