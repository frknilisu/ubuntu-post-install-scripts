#!/bin/bash

# command_exists() tells if a given command exists.
function command_exists() {
	command -v "$1" >/dev/null 2>&1
}

function install_base_libraries() {
	sudo apt-get install build-essential git cmake wget curl zip unzip exiftool -y
}

function install_java() {
	sudo apt-get install openjdk-8-jdk -y
	echo "export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'" >> ~/.bashrc
	echo "export PATH=${PATH}:${JAVA_HOME}/bin" >> ~/.bashrc
	source ~/.bashrc
	
	echo $JAVA_HOME
	echo $PATH
	
	java -version
	which java

}

function install_pipenv() {
	pip3 install --user pipenv
	echo "export PIPENV_VENV_IN_PROJECT=1" >> ~/.bashrc
	source ~/.bashrc
}

function install_python3_pip3() {
	if command_exists python3; then
    	echo "Python 3 is installed"
	else
	    echo "Python 3 is not installed"
	    sudo apt-get install python3.6 -y
	    python3 -V
		sudo apt-get install python3-pip python3-dev python3-tk -y
	fi
}

function install_sublime3() {
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update -y
	sudo apt-get install sublime-text -y
}

function install_pycharm() {
	sudo snap install pycharm-community --classic
}

function install_ipython_jupyter() {
	sudo apt-get install ipython ipython-notebook -y
	pip3 install --user jupyter
}

function access_shared_folder() {
	sudo usermod -aG vboxsf $USER
}


sudo apt-get update && sudo apt-get upgrade -y

install_base_libraries
install_python3_pip3
install_pipenv
install_java


