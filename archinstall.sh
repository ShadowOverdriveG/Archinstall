!#bin/bash

pacstrap /mnt  figlet
clear

figlet Arch Linux
sleep 2
clear

echo -e -------------------------------------
echo "si (s)"
echo "no (n)"

echo -e ------------------------------------
echo -n "Con Swapon?:"
read opcion

if ( $opcion = s ); then
echo "con swap"
figlet particionado
sleep 1
mkfs.ext2 /dev/sda
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda2 /mnt
mkdir /mnt boot
mkdir /mnt home

mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
mkswap /dev/sda3
swapon /dev/sda3

echo "Particiones hechas,Comenzando Instalacion"
sleep 2
pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager grub gvfs gvfs-afc gvfs-mtp xdg-user-dirs linux linux-firmware nano dhcpcd netctl wpa_supplicant dialog
clear
echo "Instalacion Finalizada"
sleep 1
echo "generando fstab"
genfstab -pU /mnt >> /mnt/etc/fstab
sleep 2
clear
arch-chroot /mnt
echo arch > /etc/hostname
ln -sf /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
echo LANG=es_ES.UTF-8 > /etc/locale.conf
echo KEYMAP=la-latin1 > /etc/vconsole.conf
clear
sleep 1
echo "instalando GRUB"
sleep 2
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
clear
echo "Hecho"
sleep 2
clear
echo "elige contraseña root"
sleep 3
passwd
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash alexis
passwd alexis
exit
clear
echo "Debido a que no se como colocar la opcion de editar,lo tendras que hacer de forma manual"
echo "deberas escribir nano /etc/locale.gen y luego poner locale-gen y hwclock -w"
echo "Ahora te toca a vos hacer lo demas :D"

elif ( $opcion = n  ); then
echo "sin swap"
figlet particionado
sleep 1
mkfs.ext2 /dev/sda
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda2 /mnt
mkdir /mnt boot
mkdir /mnt home

mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home
clear
echo "Particiones hechas,Comenzando Instalacion"
sleep 2
pacstrap /mnt base base-devel efibootmgr os-prober ntfs-3g networkmanager grub gvfs gvfs-afc gvfs-mtp xdg-user-dirs linux linux-firmware nano dhcpcd netctl wpa_supplicant dialog
clear
echo "Instalacion Finalizada"
sleep 1
echo "generando fstab"
genfstab -pU /mnt >> /mnt/etc/fstab
sleep 2
clear
arch-chroot /mnt
echo arch > /etc/hostname
ln -sf /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
echo LANG=es_ES.UTF-8 > /etc/locale.conf
echo KEYMAP=la-latin1 > /etc/vconsole.conf
clear
sleep 1
echo "instalando GRUB"
sleep 2
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
clear
echo "Hecho"
sleep 2
clear
echo "elige contraseña root"
sleep 3
passwd
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash alexis
passwd alexis
exit
clear
echo "Debido a que no se como colocar la opcion de editar,lo tendras que hacer de forma manual"
echo "deberas escribir nano /etc/locale.gen y luego poner locale-gen y hwclock -w"
echo "Ahora te toca a vos hacer lo demas :D"
fi
