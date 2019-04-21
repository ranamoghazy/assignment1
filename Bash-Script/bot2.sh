#!/bin/bash
log="/root/log"
result="/root/bots.result"
temp_file="/root/temp"

# a simple redirect can clear the output file
> $result

# read every line of the log file
while read line; do
   # split fields with 'cut' using whitespace as a delimiter
   date=`echo "$line" | cut -d' ' -f1-5`

   # split using pipe as a delimiter
   ip=`echo "$line" | cut -d'|' -f2`
   user=`echo "$line" | cut -d'|' -f3`
   event=`echo "$line" | cut -d'|' -f5`

   # report results
   echo "date:$date user:$user from ip:$ip"  >> "$result"
   cat $result | awk '{print $5,$6}' >> "$temp_file"
   
done < "$log"
   cat $result | awk '{print $5,$6}'| uniq -c  > "$temp_file"
   #Filtering bot user 
   IFS=$'\n'
   for i in $(cat $temp_file)
   do

     	number=$(echo $i | awk '{print $1}')

	if [ $number == 3 ]
	then
		bot=$(echo $i | awk '{print $3}')
	fi
  done
echo "$bot is bot"

