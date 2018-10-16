#!/bin/bash

a=$(ls -l ~/Telegram_workdir/ | wc -l)
next=$((a+1))
echo $next
if [ ! -d ~/Telegram_workdir/$next ]; then

echo "Created directory ~/Telegram_workdir/" .$next
mkdir ~/Telegram_workdir/$next

data="#!/usr/bin/env xdg-open \n

[Desktop Entry] \n
Version=$next.0 \n
Name=Telegram Desktop  $next \n
Comment=не хочет запускаться через ярлык \n
TryExec=/home/alice/src/tg_app/Telegram/Telegram \n
Exec=/home/alice/src/tg_app/Telegram/Telegram -many -workdir /home/alice/Telegram_workdir/$next \n
Icon=telegram \n
Terminal=false \n
StartupWMClass=TelegramDesktop \n
Type=Application \n
Categories=Network;InstantMessaging;Qt; \n
MimeType=x-scheme-handler/tg; \n
X-Desktop-File-Install-Version=0.23 \n
Name[en_US]=tg_$next.desktop"

echo -e $data >  ~/TG_icons/tg_$next.desktop
chmod 755  ~/TG_icons/tg_$next.desktop
echo " start new Telegram"
/home/alice/src/tg_app/Telegram/Telegram -many -workdir /home/alice/Telegram_workdir/$next 


fi



