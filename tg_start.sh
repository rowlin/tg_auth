#!/bin/bash

a=$(ls -l ~/Telegram_workdir/ | wc -l)
next=$((a+1)) 
home = $HOME
if [ ! -d ~/Telegram_workdir/$next ]; then

echo "Created directory ~/Telegram_workdir/" .$next
mkdir -p ~/Telegram_workdir/$next

data="[Desktop Entry]\n
Version=1.0\n
Name=Telegram Desktop\n
Comment=Official desktop application for the Telegram messaging service\n
TryExec=$home/src/Telegram/Telegram\n
Exec=$home/src/Telegram/Telegram -many -workdir $home/Telegram_workdir/$next \n
Icon=telegram\n
Terminal=false\n
StartupWMClass=TelegramDesktop\n
Type=Application\n
Categories=Network;InstantMessaging;Qt;\n
MimeType=x-scheme-handler/tg;\n
X-Desktop-File-Install-Version=0.23\n
Name[en_US]=tg_$next.desktop"

echo $data >  ~/Desktop/tg_$next.desktop 
chmod a+x  ~/Desktop/tg_$next.desktop
#echo "press to start new Telegram"
#ls -la ~/Desktop/
#sh ~/Desktop/tg_$next.desktop

chmod 755  ~/TG_icons/tg_$next.desktop
echo " start new Telegram"
$home/src/Telegram/Telegram -many -workdir $home/Telegram_workdir/$next 

fi

