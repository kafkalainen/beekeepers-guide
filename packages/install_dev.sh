#!/bin/bash

install_discord()
{
	wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo dpkg -i ~/discord.deb
}

install_todo_txt()
{
	if [ ! -d ~/todo_txt ];
	then
		git clone https://github.com/todotxt/todo.txt-cli.git ~/todo_txt && \
		cd todo_txt && \
		sudo make && \
		sudo make install && \
		sudo make test
	else
		echo -e "Already installed, moving forward."
	fi
}

install_nord_theme()
{
	if [ ! -d ~/nord-gnome-terminal ];
	then
		git clone https://github.com/arcticicestudio/nord-gnome-terminal.git ~/nord-gnome-terminal && \
	cd ~/nord-gnome-terminal && \
	./nord.sh
	else
		echo -e "Already installed, moving forward"
	fi
}

install_norminette()
{
	if [ ! -d ~/.norminette ];
	then
		sudo apt-get update && sudo apt upgrade && \
		sudo apt-get install build-essential python3-pip python3-venv
		python3 -m pip install --upgrade pip setuptools
		python3 -m venv ~/venv
		source ~/venv/bin/activate
		pip install norminette
		ln -s ~/venv/bin/norminette /usr/local/bin/norminette
	else
		echo -e "Already installed, moving forward"
	fi
}

install_header()
{
	if [ ! -d ~/.vim ];
	then
		git clone https://github.com/pbondoer/vim-42header.git ~/pbondoer-vim42header && \
		mkdir ~/.vim && \
		cp -r ~/pbondoer-vim42header/* ~/.vim/
	else
		echo -e "Already installed, moving forward"
	fi
}

#Update packages
sudo apt-get update -y
sudo apt-get upgrade -y
#Install required packages for development
sudo apt-get install vim
sudo apt-get install nodejs
sudo apt-get install snapd
sudo snap install --classic code
sudo snap install spotify
sudo apt-get install npm
sudo apt-get install lldb
sudo apt-get install clang
sudo apt-get install valgrind
sudo apt-get install gnome-tweaks
#Install required packages for work
sudo apt-get install gimp
sudo apt-get install inkscape
#Install school needs
install_norminette
install_header
#Install neat looks
sudo snap install tela-icons
install_nord_theme
sudo apt-get install autotools-dev
sudo apt-get install autoconf
install_todo_txt
#Install grub
#sudo apt install grub-efi grub2-common grub-customizer && \
#sudo grub-install && \
#sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi && \
#echo "In output file change OUTPUT_File to /boot/efi/EFI/pop/grub.cfg"
#Install powerline
sudo apt-get install powerline
echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
#fi" >> ~/.bashrc
source ~/.bashrc
echo "Remember to install tela-circle through gnome tweaks."
git clone https://github.com/vinceliuice/Tela-icon-theme.git ~/tela
mkdir -p ~/.icons
cd ~/tela
./install.sh -d ~/.icons
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get install audacity discord docker-ce docker-ce-cli containerd.io g++
sudo apt-get install unrar unzip
echo "Install todotxt from gnome extensions: https://extensions.gnome.org/extension/570/todotxt/"
