user="$( whoami )"

N=4
mem1="$(systeminfo | findstr 'Total' | awk -v N=$N '{print $N}' )"

cpu="$( wmic cpu get name )"

gpu="$(wmic path win32_VideoController get name)"

ip1="$(ipconfig | findstr  "v4" | awk -v N=14 '{print $N}')"

echo $user

echo $mem1

echo $cpu

echo $gpu

ip2="$(echo $ip1 | awk -v N=2 '{print $N}')"

echo $ip2

data="$( date | awk '{print $3 " " $2 " " $6}')"

echo $data
 curl -X POST -d "user=$user&mem=$mem1&cpu=$cpu&host=$ip2&gpu=$gpu&os="Windows"&data=$data" http://192.168.7.2111/pc-data;
