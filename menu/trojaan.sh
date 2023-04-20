#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="GH-reyz"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/registerv3/main/ip.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/registerv3/main/ip.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TOTAL ACC CREATE  TROJAN
total=$(grep -c -E "^#trx " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN GO
total2=$(grep -c -E "^#trgrpc " "/usr/local/etc/xray/config.json")
MYIP=$(wget -qO- ifconfig.me/ip);
source /var/lib/premium-script/ip.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi

# FUCTION CREATE USER TROJAN
function menu1 () {
clear
xtr="$(cat ~/log-install.txt | grep -w "Trojan Tcp Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[30m[\e[$box CREATE USER XRAY TROJAN TCP TLS\e[30m ]\e[1m          \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "   Password: " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/akunxtr.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojan$/a\#trx '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
echo -e "### $user $exp $harini $uuid" >> /usr/local/etc/xray/akunxtr.conf
systemctl restart xray
trojanlink="trojan://${user}@${sts}${domain}:${xtr}?sni=$sni#reyzvpn@${user}"
clear
echo -e ""
echo -e "\e[$line════════[▫️XRAY TROJAN TCP▫️]════════\e[m"
echo -e "Remarks       : ${user}"
echo -e "Domain        : ${domain}"
echo -e "IP/Host       : ${MYIP}"
echo -e "Port          : ${xtr}"
echo -e "Key           : ${user}"
echo -e "Network       : TCP"
echo -e "AllowInsecure : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Torrent"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Sharing Premium ID\e[m"
echo -e "\e[31m🔰 Script By @GHReyz 🔰"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Trojan : ${trojanlink}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created : $harini"
echo -e "Expired : $exp"
echo -e "Script By $creditt"
}
# FUCTION TRIAL USER TROJAN
function menu2 () {
clear
xtr="$(cat ~/log-install.txt | grep -w "Trojan Tcp Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[30m[\e[$box TRIAL USER XRAY TROJAN TCP TLS\e[30m ]\e[1m           \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#trojan$/a\#trx '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
echo -e "### $user $exp $harini $uuid" >> /usr/local/etc/xray/akunxtr.conf
systemctl restart xray
trojanlink="trojan://${user}@${sts}${domain}:${xtr}?sni=$sni#${user}"
clear
echo -e ""
echo -e "\e[$line═════[▫️TRIAL XRAY TROJAN TCP▫️]═════\e[m"
echo -e "Remarks       : ${user}"
echo -e "Domain        : ${domain}"
echo -e "IP/Host       : ${MYIP}"
echo -e "Port          : ${xtr}"
echo -e "Key           : ${user}"
echo -e "Network       : TCP"
echo -e "AllowInsecure : True/Allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Torrent"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Sharing Premium ID\e[m"
echo -e "\e[31m🔰 Script By @GHReyz 🔰"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Trojan : ${trojanlink}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created : $harini"
echo -e "Expired : $exp"
echo -e "Script By $creditt"
}
function menu3 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akunxtr.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " DELETE XRAY TROJAN TCP"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
CLIENT_NAME=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/d" /usr/local/etc/xray/akunxtr.conf
sed -i "/^#trx $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
systemctl restart xray
service cron restart
clear
clear
echo " Xray Trojan TCP Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
}
function menu4 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akunxtr.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Renew User Xray Trojan Tcp"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/akunxtr.conf
sed -i "s/#trx $user $exp $harini $uuid/#trx $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
service cron restart
clear
echo ""
echo " XRAY TROJAN TCP Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
}
function menu5 () {
xtr="$(cat ~/log-install.txt | grep -w "Trojan Tcp Tls" | cut -d: -f2|sed 's/ //g')"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akunxtr.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY TROJAN TCP TLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patch=/xray
xtr="$(cat ~/log-install.txt | grep -w "Trojan Tcp Tls" | cut -d: -f2|sed 's/ //g')"
user=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/akunxtr.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
trojanlink="trojan://${user}@${domain}:${xtr}?sni=bug.com#${user}"
clear
echo -e ""
echo -e "\e[$line════════[▫️XRAY TROJAN TCP▫️]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port           : ${xtr}"
echo -e "Key            : ${user}"
echo -e "Network        : TCP"
echo -e "AllowInsecure  : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Torrent"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Sharing Premium ID\e[m"
echo -e "\e[31m🔰 Script By @GHReyz 🔰"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Trojan  : ${trojanlink}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
}
function menu6 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^#trx' | cut -d ' ' -f 2`);
echo "----------------------------------------------";
echo "-----=[ Xray Trojan Tcp Tls User Login ]=-----";
echo "----------------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/iptrojan.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/iptrojan.txt
done
}
# TROJAN GRPC
function menu7 () {
clear
uuid=$(cat /proc/sys/kernel/random/uuid)
source /var/lib/premium-script/ip.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
trgrpc="$(cat ~/log-install.txt | grep -w "Trojan Grpc Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[0;30m[\e[$box CREATE USER XRAY TROJAN GRPC TLS\e[0;30m ]\e[0m\e[$back_text         \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "   Password: " -e user
		user_EXISTS=$(grep -w $user /usr/local/etc/xray/akunxtrgrpc.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
patch=grpc
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
read -p "   Expired (days) : " masaaktif
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojangrpc$/a\#trgrpc '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
echo -e "### $user $exp $harini $uuid" >> /usr/local/etc/xray/akunxtrgrpc.conf
systemctl restart xray
trojanlink="trojan://${user}@${sts}${domain}:$trgrpc/?security=tls&type=grpc&serviceName=${patch}&sni=$sni#reyzvpn${user}"
clear
echo -e ""
echo -e "\e[$line═══════[▫️XRAY TROJAN GRPC▫️]══════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port           : ${trgrpc}"
echo -e "Key            : ${user}"
echo -e "Network        : TCP"
echo -e "serviceName    : $patch"
echo -e "AllowInsecure  : True"
echo -e "\e[$line═══════════════════════════════\e[m"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Torrent"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Sharing Premium ID\e[m"
echo -e "\e[31m🔰 Script By @GHReyz 🔰"
echo -e "\e[$line═══════════════════════════════\e[m"
echo -e "Link Trojan : ${trojanlink}"
echo -e "\e[$line═══════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
}
# TROJAN GRPC TRIAL
function menu8 () {
clear
uuid=$(cat /proc/sys/kernel/random/uuid)
source /var/lib/premium-script/ip.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
trgrpc="$(cat ~/log-install.txt | grep -w "Trojan Grpc Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
echo -e   "  \e[$back_text          \e[0;30m[\e[$box CREATE USER XRAY TROJAN GRPC TLS\e[0;30m ]\e[0m\e[$back_text         \e[m"
echo -e   "  \e[$line═══════════════════════════════════════════════════════\e[m"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

patch=grpc
read -p "   Bug Address (Example: www.google.com) : " address
read -p "   Bug SNI (Example : m.facebook.com) : " sni
bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#trojangrpc$/a\#trgrpc '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","password": "'""$user""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
echo -e "### $user $exp $harini $uuid" >> /usr/local/etc/xray/akunxtrgrpc.conf
systemctl restart xray
trojanlink="trojan://${user}@${sts}${domain}:$trgrpc/?security=tls&type=grpc&serviceName=${patch}&sni=$sni#reyzvpn${user}"
clear
echo -e ""
echo -e "\e[$line═══════[▫️TRIAL XRAY TROJAN GRPC▫️]══════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port           : ${trgrpc}"
echo -e "Key            : ${user}"
echo -e "Network        : TCP"
echo -e "serviceName    : $patch"
echo -e "AllowInsecure  : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Torrent"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Sharing Premium ID\e[m"
echo -e "\e[31m🔰 Script By @GHReyz 🔰"
echo -e "\e[$line═══════════════════════════════\e[m"
echo -e "Link Trojan : ${trojanlink}"
echo -e "\e[$line═══════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
}
function menu9 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " DELETE XRAY TROJAN GRPC TLS"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
harini=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
CLIENT_NAME=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp $harini $uuid/d" /usr/local/etc/xray/akunxtrgrpc.conf
sed -i "/^#trojangrpc $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json
systemctl restart xray
service cron restart
clear
clear
echo " Xray Trojan Grpc Tls Account Deleted Successfully"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="
}
function menu10 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Renew User Xray Trojan Grpc Tls"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
harini=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp $harini $uuid/### $user $exp4 $harini $uuid/g" /usr/local/etc/xray/akunxtrgrpc.conf
sed -i "s/#trgrpc $user $exp $harini $uuid/#trgrpc $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json
service cron restart
clear
echo ""
echo " XRAY TROJAN GRPC TLS Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
echo ""
}
function menu11 () {
clear
trgrpc="$(cat ~/log-install.txt | grep -w "Trojan Grpc Tls" | cut -d: -f2|sed 's/ //g')"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY TROJAN GRPC TLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
patch=/xray
trgrpc="$(cat ~/log-install.txt | grep -w "Trojan Grpc Tls" | cut -d: -f2|sed 's/ //g')"
user=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
harini=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
uuid=$(grep -E "^### " "/usr/local/etc/xray/akunxtrgrpc.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
trojanlink="trojan://${user}@${domain}:${xtr}?sni=bug.com#${user}"
clear
echo -e ""
echo -e "\e[$line════════[▫️XRAY TROJAN GRPC▫️]════════\e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "IP/Host        : ${MYIP}"
echo -e "Port           : ${xtr}"
echo -e "Key            : ${user}"
echo -e "Network        : TCP"
echo -e "AllowInsecure  : True"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[31m❌ PS4"
echo -e "\e[31m❌ Porn"
echo -e "\e[31m❌ Torrent"
echo -e "\e[31m❌ Ddos Server"
echo -e "\e[31m❌ Abuse Usage"
echo -e "\e[31m❌ Multi-Login ID"
echo -e "\e[31m❌ Mining Bitcoins"
echo -e "\e[31m❌ Sharing Premium ID\e[m"
echo -e "\e[31m🔰 Script By @GHReyz 🔰"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link Trojan  : ${trojanlink}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo -e "Script By $creditt"
}
function menu12 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^#trgrpc' | cut -d ' ' -f 2`);
echo "----------------------------------------------";
echo "-----=[ Xray Trojan Grpc Tls User Login ]=-----";
echo "----------------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/iptrojan.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp | grep xray | awk '{print $4}' | cut -d: -f 1,2 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f 1,2 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo "-------------------------------"
fi
rm -rf /tmp/iptrojan.txt
done
}
# MENU TROJAN
clear
echo -e ""
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text          \e[30m═[\e[$box TROJAN TCP TLS\e[30m ]═          \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$number (•1)\e[m \e[$below Create Trojan TCP TLS Account\e[m"
echo -e "   \e[$number (•2)\e[m \e[$below Trial Trojan TCP TLS Account\e[m"
echo -e "   \e[$number (•3)\e[m \e[$below Deleting Trojan TCP TLS Account\e[m"
echo -e "   \e[$number (•4)\e[m \e[$below Renew Xray Trojan TCP TLS Account\e[m"
echo -e "   \e[$number (•5)\e[m \e[$below Show Config Trojan TCP TLS Account\e[m"
echo -e "   \e[$number (•6)\e[m \e[$below Check User Login Trojan TCP TLS\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total} Client\e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text         \e[30m═[\e[$box TROJAN GRPC TLS\e[30m ]═          \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$number (•7)\e[m \e[$below Create Trojan GRPC TLS Account\e[m"
echo -e "   \e[$number (•8)\e[m \e[$below Trial Trojan GRPC TLS Account\e[m"
echo -e "   \e[$number (•9)\e[m \e[$below Deleting Trojan GRPC TLS Account\e[m"
echo -e "   \e[$number (10)\e[m \e[$below Renew Trojan GRPC TLS Account\e[m"
echo -e "   \e[$number (11)\e[m \e[$below Show Config Trojan GRPC TLS Account\e[m"
echo -e "   \e[$number (12)\e[m \e[$below Check User Login Trojan  GRPC TLS\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)   MENU                             \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -rp "      Please Input Number  [1-12 or x] :  "  num
echo -e ""
if [[ "$num" = "1" ]]; then
menu1
elif [[ "$num" = "2" ]]; then
menu2
elif [[ "$num" = "3" ]]; then
menu3
elif [[ "$num" = "4" ]]; then
menu4
elif [[ "$num" = "5" ]]; then
menu5
elif [[ "$num" = "6" ]]; then
menu6
elif [[ "$num" = "7" ]]; then
menu7
elif [[ "$num" = "8" ]]; then
menu8
elif [[ "$num" = "9" ]]; then
menu9
elif [[ "$num" = "10" ]]; then
menu10
elif [[ "$num" = "11" ]]; then
menu11
elif [[ "$num" = "12" ]]; then
menu12
elif [[ "$num" = "x" ]]; then
menu
else
clear
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
trojaan
fi
