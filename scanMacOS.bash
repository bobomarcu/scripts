user="$(whoami)"

mem="$(sysctl hw.memsize | awk '{print $2}')" 

mem1=$((($mem / 1024) / 1024 / 1024 ));

cpu="$(sysctl -a | grep machdep.cpu.brand_string: | awk '{print $2 " "$3" "$4 " "$6 " "$7}')"

gpu="$(system_profiler SPDisplaysDataType | grep 'Chipset Model' | awk '{print $3 " " $4 " "  $5 " "  $6}')"


ip="$(ipconfig getifaddr en0)"

data="$(date | awk '{print $2 " "  $3 " " $4}')"

echo $user $mem1 $cpu $gpu $ip 


curl -X POST -d "user=$user&mem=$mem1&cpu=$cpu&gpu=$gpu&host=$ip&os="MacOS"&data=$data" http://192.168.100.52/pc-data
