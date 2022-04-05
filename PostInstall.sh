!#bin/bash

sudo pacman -S xorg-server xorg-xinit
sudo pacman -S mesa mesa-demos

clear
echo -e ------------------------------------
echo "AMD (a)"
echo "Intel (i)"
echo "Nvidia (n)"

echo -e ------------------------------------

echo -n "Grafica:"
read opcion

if ( $opcion = a ); then
	sudo pacman -S xf86-video-amdgpu amd-ucode
	clear
	echo "instalacion completa"

elif ( $opcion = n ); then
	sudo pacman -S xf86-video-nouveau
	clear
	echo "instalacion completa"


elif ( $opcion = i ); then
	sudo pacman -S xf86-video-intel intel-ucode
	clear

	echo "instalacion completa"

fi

echo "instalacion de Escritorio"
echo -e "----------------------------------------"

 echo "Gnome-Desktop (1)"
 echo "XFCE (2)"
 echo "deepin (3)"
 echo "lxde(4)"
 echo "lxqt(5)"
 echo "Budgie-Desktop(6)"
 echo "mate(7)"
 echo "Kde Plasma(8)"
 echo "Cinnamon(9)"
 echo -e "-----------------------------------------"

 echo -n "Que Escritorio deseas Instalar?:"
 read desktop 

 if ( $desktop = 1 ); then
 	sudo pacman –S gnome gnome–extra
 	sudo pacman -S gdm
 	sudo systemctl enable gdm.service
 	echo exec gnome-session > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

 elif ( $desktop = 2 ); then
 	sudo pacman -S xfce4 xfce4-goodies network-manager-applet pulseaudio
    sudo pacman -S gdm
    sudo systemctl enable gdm.service
    echo exec startxfce4 > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

    elif ( $desktop = 3 ); then
    sudo pacman deepin deepin-extra
    sudo pacman -S gdm 
    sudo systemctl enable gdm.service
        echo exec startdde > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

    elif ( $desktop = 4 ); then
    sudo pacman -S lxde  	
        sudo pacman -S gdm 
    sudo systemctl enable gdm.service
        echo exec startlxde > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

    elif ( $desktop = 5 ); then
    	sudo pacman -S lxqt
    	    sudo pacman -S gdm 
    sudo systemctl enable gdm.service
    echo exec startlxqt > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

elif ( $desktop = 6 ); then
	sudo pacman -S gnome gnome–extra budgie-desktop
	    sudo pacman -S gdm 
    sudo systemctl enable gdm.service
      echo exec start budgie-desktop > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

elif ( $desktop = 7 ); then
	sudo pacman -S mate mate-extra
	    sudo pacman -S gdm 
    sudo systemctl enable gdm.service
        echo exec mate-session > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

elif ( $desktop = 8 ); then
	sudo pacman -S plasma kde-applications plasma-wayland-session
	sudo pacman -S gdm 
    sudo systemctl enable gdm.service
         echo exec startkde > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

elif ( $desktop = 9 )
	sudo pacman -S cinnamon
	sudo pacman -S gdm 
    sudo systemctl enable gdm.service
     echo exec cinnamon-session > $HOME/.xinitrc
echo "Instalacion Finalizada,Reiniciando ;D "
sleep 3
reboot

  else
  	clear
  	figlet :c
  	echo "Opcion Incorrecta :v"
  fi