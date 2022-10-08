#!/bin/bash

echo -e "Argument used '$1'\n"

if [ $(id -u) -ne 0 ]; then
        echo -e "\e[1;91mTHE INSTALLATION SCRIPT MUST BE RAN AS ROOT\e[0m"
        exit 1
fi


help () {

echo -e "To install ADB-Toolkit use :- \n\e[1;91m sudo bash $0 install \e[92mor \e[1;91msudo bash $0 -i \e[92mor \e[1;91msudo bash $0 -install"

}

opt_install () {

        distro=$(awk '/^ID_LIKE=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

        if [ "$distro" == "" ]
        
        then
                distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

        fi


        ## DEBIAN INSTALLER ##

        debian_install () {

                apt-get install adb -y
                apt-get install fastboot -y
                apt-get install ruby-full -y
                curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
                chmod +x msfinstall && ./msfinstall

        }

        ## ARCH INSTALLER ##

        arch_install () {

                pacman -S --noconfirm android-tools
                pacman -S --noconfirm ruby
                pacman -S --noconfirm metasploit

        }

        ## CENTOS INSTALLER ##

        centos_install () {

                yum install -y android-tools
                yum install -y ruby
                curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
                chmod +x msfinstall && ./msfinstall

        }

        ## FEDORA INSTALLER ##

        fedora_install () {

                dnf install -y android-tools
                echo -e "\n\n\e[1;91m PLEASE INSTALL THE METASPLOIT FRAMEWORK MANUALLY\n\n"

        }

        case $distro in 
                "debian") debian_install;;
                "arch") arch_install;;
                "centos") centos_install;;
                "fedora") fedora_install;;
                *) echo -e "THE DISTRO $distro IS NOT IDENTIFIED PLEASE MANUALLY INSTALL 'ADB' & 'FASTBOOT' FOR YOUR DISTRO."; exit 1;;
        esac

        if [ $? == 0 ]
        
                then
        
                        clear
                        chmod +x ADB-Toolkit.sh
                        touch ~/.bash_aliases 2> /dev/null
                        mkdir $PWD/.temp 2> /dev/null
                        echo "alias adb-toolkit='cd $PWD && sudo bash ADB-Toolkit.sh'" >> ~/.bash_aliases
                        source ~/.bash_aliases
                        echo -e "\n\e[1;92mINSTALLATION COMPLETED\n"
                        echo -e "\e[1;92mUSAGE = \e[1;91m'sudo ./ADB-Toolkit.sh' or you can do 'sudo adb-tookit' from anywhere in shell\e[0m\n\n"

        fi

}



if [[ ("$1" = "install" || "$1" = "-i" || "$1" = "-install") ]]

  then
      opt_install
  else
     help
fi


#Copyright : ASHWIN990 , ASHWINI SAHU
