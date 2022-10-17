
echo "PC Scanner";
echo "================================";

echo "SCAN STARTED >>";

function pauza () {
	x=1
	while [ $x -le 3 ]
	do
		sleep 1
		echo "*"
		x=$(( $x + 1 ))

	done
}
echo "================================";
echo "CPU";
cpu="$( lscpu | grep 'Model name'| awk '{print $3 " " $4 " " $5 " " $8}' )";
pauza
echo "================================"; 
echo "MEM";
mem="$( lsmem | grep 'Total online memory' | awk '{print $4}' )";
pauza
echo "================================";
echo "IP:";
host="$( hostname -i | awk '{print $2}' )";
pauza
echo "================================";
echo "USER";
user="$( whoami )";
pauza
echo "================================";
echo "GPU:";
gpu="$( sudo lshw -C display | grep 'product' | cut -d ':' -f 2 )";
pauza
echo "================================";
echo "DONE ...";
data="$(date | awk '{print $2 " " $3 " " $7}')"

curl -X POST -d "user=$user&mem=$mem&cpu=$cpu&host=$host&gpu=$gpu&os="Linux"&data=$data" http://192.168.7.211/pc-data;

printf "\n";
