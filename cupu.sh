#!/bin/bash
export CHATID="-991502977"
export KEY="6267953344:AAE5w2yJnp9B0enblu7bmh0a8ZgnP6mhSYU"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
rm -rf cupu.sh
rm -rf XolPanel.session
rm -rf service.session
rm -rf xolpanel
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/askykenza/xolpanel
unzip xolpanel/xolpanel.zip
pip3 install -r xolpanel/requirements.txt
pip3 install pillow
echo ""
read -e -p "[*] Masukan Bot Token Kamu : " bottoken
read -e -p "[*] Masukan Id Telegram Kamu :" admin
read -e -p "[*] Masukan Domain VPSmu :" domain
read -e -p "[*] Masukan NSdomain kamu :" sldomain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/xolpanel/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel/var.txt
#echo -e SLDOMAIN='"'$sldomain'"' >> /root/xolpanel/var.txt
#echo -e PUB='"fa436bf98f3a477ddfd981c1e80014b46cd1861502d341bc65b488d7622c4d36"' >> /root/xolpanel/var.txt

clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Bot Token     : $bottoken"
echo "Id Telegram   : $admin"
echo "Subdomain     : $domain"
#echo "NSdomain      : $sldomain"
#echo "PUBKEY        : fa436bf98f3a477ddfd981c1e80014b46cd1861502d341bc65b488d7622c4d36"
echo -e "==============================="
echo "Setting done Please wait 5s"
sleep 5
cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @XolPanel
After=network.target
[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=always
[Install]
WantedBy=multi-user.target
END
systemctl start xolpanel
systemctl enable xolpanel
systemctl restart xolpanel
clear
echo -e "==============================================="
echo " Installations complete, type /menu or /start on your bot"
echo -e "==============================================="
read -n 1 -s -r -p "Press any key to Back Menu"
rm -rf cupu.sh
clear
menu
