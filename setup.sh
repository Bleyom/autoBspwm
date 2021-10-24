#!/usr/bin/bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

# Original Idea And Colors By Yorkox!
# https://github.com/yorkox0/autoQtile

function banner () {
clear
echo -e "$green"

echo " █████╗ ██╗   ██╗████████╗ ██████╗ ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗"
echo "██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║  (No ejecutar el script como root)"
echo "███████║██║   ██║   ██║   ██║   ██║██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║  "
echo "██╔══██║██║   ██║   ██║   ██║   ██║██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║  (original version By Yorkox)"
echo "██║  ██║╚██████╔╝   ██║   ╚██████╔╝██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║  (Edited By Bleyom)"
echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝"
}

function main () {
    
    banner

	
	echo
	sleep 0.25
	echo "1 -> Instalar Requerimientos necesarios"
	sleep 0.25
	echo
	echo "2 -> Instalar Bspwm"
	sleep 0.25
	echo
	echo "3 -> Instalar Polybar, Picom, Rofi..."
	sleep 0.25
	echo
	echo "4 -> Todo en uno"
	sleep 0.25
	echo
    echo "5 -> Instalar Configuracion (Esta opcion respaldara tu configuracion actual (En caso de tenerla) )"
	sleep 0.25
	echo
	echo "6 -> Salir"

    echo -e "${end}"

    echo -e "${blue}"
    read -p "--> " command
    echo -e "${end}"

	    if [ "$command" == "1" ]; then
             aur-helper
		     dependencies
	        	fi

        if [ "$command" == "2" ]; then
                aur-helper
                bspwm
                fi

        if [ "$command" == "3" ]; then
                aur-helper
                stuff
                fi

        if [ "$command" == "4" ]; then
                aur-helper
                all   
                fi  
        
         if [ "$command" == "5" ]; then
                aur-helper
                config
                fi

        if [ "$command" == "6" ]; then
                echo -e "${red}"
                echo "Bye ..."
                echo -e "${end}"
                fi

}

function dependencies () {

 echo -e "${green}"
 echo "Instalando AUR helper ..."
 echo -e "${end}"
 aur-helper
 echo -e "${green}"
 echo "AUR helper instalado correctamente ..."
 echo -e "${end}"
}

function bspwm () {
    yay -S bspwm sxhkdrc
}

function stuff () {
    yay -S polybar rofi picom firefox zsh tmux lsd gnome-terminal kitty
}

function aur-helper () {
    sudo pacman -S git
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si && cd ..
    rm -rf yay
}


function config () {
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/zshrc_conf > zshrc_conf
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/wichSystem.py > wichSystem.py
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/target_to_hack.sh > target_to_hack.sh
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/sxhkdrc > sxhkdrc
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/settarget > settarget
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/picom.conf > picom.conf
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/picom-blur.conf > pìcom-blur.conf
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/fastTCPscan.go > fastTCPscan.go
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/cleartarget > cleartarget
    curl -L https://raw.githubusercontent.com/yorkox0/autoBspwm/main/tools/battery.sh > battery.sh
    curl -L https://gist.githubusercontent.com/Bleyom/a3895d555382872189eb0e97a511d41b/raw/4c19b54042d637733898898d711cfe824e7f70b7/bspwmrc > bspwmrc
    curl -L https://github.com/yorkox0/autoBspwm/raw/main/tools/polybar-backup.zip > polybar-backup.zip
    curl -L https://github.com/yorkox0/autoBspwm/raw/main/tools/Hack.zip > Hack.zip
    curl -L https://github.com/yorkox0/autoBspwm/raw/main/tools/wallpaper.jpg > wallpaper.jpg
    curl -L https://github.com/yorkox0/autoBspwm/raw/main/tools/s4vitar.png > s4vitar.png
    mkdir ~/.wallpapers
    mv ~/.config/polybar/ ~/.config/polybar-backup 2>/dev/null 
    mv ~/.config/bspwm ~/.config/bspwm-backup 2>/dev/null
    mv ~/.config/sxhkd ~/.config/sxhkd-backup 2>/dev/null
    mv ~/.config/nvim ~/.config/nvim-backup 2>/dev/null
    mv ~/.config/rofi ~/.config/rofi-backup 2>/dev/null
    mv ~/.config/picom ~/.config/picom-backup 2>/dev/null
    mkdir -p ~/.config/polybar
    mkdir ~/.config/bspwm
    mkdir ~/.config/sxhkd
    mkdir ~/.config/bin
    mkdir ~/.config/picom
    mkdir ~/.config/rofi
    mkdir ~/.config/rofi/themes
    mkdir ~/.config/nvim
    cp sxhkdrc ~/.config/sxhkd/
    cp  wallpaper.jpg ~/.wallpapers

    git clone https://github.com/VaughnValle/blue-sky.git

    cp polybar-backup.zip .
    unzip polybar-backup.zip
    sudo mv polybar-backup/ ~/.config/
    sudo rm -r ~/.config/polybar/ 2>/dev/null
    sudo mv ~/.config/polybar-backup/ ~/.config/polybar/
    cp bspwmrc ~/.config/bspwm/
    cp  picom.conf ~/.config/picom

    sudo cp ~/.config/polybar/fonts/* /usr/share/fonts

    wget https://raw.githubusercontent.com/yorkox0/exaple01/main/ethernet_status.sh
    chmod +x ethernet_status.sh 2>/dev/null
    mv ethernet_status.sh ~/.config/bin
    wget https://raw.githubusercontent.com/yorkox0/exaple01/main/hackthebox.sh
    chmod +x hackthebox.sh
    mv hackthebox.sh ~/.config/bin
    cp  target_to_hack.sh .
    chmod +x target_to_hack.sh
    mv target_to_hack.sh ~/.config/bin
    echo '' > ~/.config/bin/target
    chmod +x  battery.sh
    mv  battery.sh ~/.config/bin/
    echo '' > ~/.config/bin/target


    cp blue-sky/nord.rasi ~/.config/rofi/themes

    sudo cp  settarget /bin
    sudo cp  cleartarget /bin
    sudo chmod +x /bin/settarget
    sudo chmod +x /bin/cleartarget
    chmod +x ~/.config/bspwm/bspwmrc

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
    echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
    sudo echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc

    cp  zshrc_conf ~/.zshrc

    cp  Hack.zip .
    unzip Hack.zip
    sudo mv *.ttf /usr/share/fonts
    rm *.zip

    wget https://github.com/arcticicestudio/nord-vim/archive/master.zip
    unzip master.zip
    rm master.zip

    mv nord-vim-master/colors/ ~/.config/nvim
    sudo rm -r nord-vim-master/
    wget https://raw.githubusercontent.com/Necros1s/lotus/master/lotus.vim
    wget https://raw.githubusercontent.com/Necros1s/lotus/master/lotusbar.vim
    wget https://raw.githubusercontent.com/Necros1s/lotus/master/init.vim
    mv *.vim ~/.config/nvim
    echo 'colorscheme nord' >> ~/.config/nvim/init.vim
    echo 'syntax on' >> ~/.config/nvim/init.vim

    git clone https://github.com/gpakosz/.tmux.git /home/$USER/.tmux
    ln -s -f .tmux/.tmux.conf /home/$USER
    cp /home/$USER/.tmux/.tmux.conf.local /home/$USER

    sudo git clone https://github.com/gpakosz/.tmux.git /root/.tmux
    sudo ln -s -f .tmux/.tmux.conf /root
    sudo cp /root/.tmux/.tmux.conf.local /root

    chmod +x  fastTCPscan.go
    sudo cp  fastTCPscan.go /bin

    chmod +x  wichSystem.py
    sudo mv  wichSystem.py /bin/


    mkdir tools
    cd tools

}


function all () {
    dependencies
    bspwm 
    stuff
    config
}



main

