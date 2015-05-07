#! /bin/bash

##############################################################    UPDATE  #############################
apt-get clean && apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
tar xzf jdk-8u45-linux-x64.tar.gz
mv jdk1.8.0_45 /opt
cd /opt/jdk1.8.0_45
update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 1
update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_45/bin/javac 1
update-alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /opt/jdk1.8.0_45/jre/lib/amd64/libnpjp2.so 1
update-alternatives --set java /opt/jdk1.8.0_45/bin/java
update-alternatives --set javac /opt/jdk1.8.0_45/bin/javac
update-alternatives --set mozilla-javaplugin.so /opt/jdk1.8.0_45/jre/lib/amd64/libnpjp2.so


apt-get install flashplugin-nonfree
update-flashplugin-nonfree --install

apt-get install unrar unace rar unrar p7zip zip unzip p7zip-full p7zip-rar file-roller -y
apt-get install filezilla filezilla-common -y
apt-get install gdebi -y

################################### Enable Automatic Login for Root ################## 
sed -i '/^#.* AutomaticLoginEnable /s/^#//' /etc/gdm3/daemon.conf
sed -i '/^#.* AutomaticLogin /s/^#//' /etc/gdm3/daemon.conf

################################### Install Virtual Box Guest Additions 4.3.26 ################## 
apt-get install dkms gcc -y
wget http://dlc-cdn.sun.com/virtualbox/4.3.26/VBoxGuestAdditions_4.3.26.iso
mount -o loop VBoxGuestAdditions_4.2.16.iso /mnt
cd /mnt
./VBoxLinuxAdditions.run

################################### Install Google Chrome ################## 
apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
/usr/bin/google-chrome-stable %U --no-sandbox --user-data-dir

#--------------------------------Not Yet Working Need to Somehow Run Chrome as Root
sed -i 's/^\(exec.*\)$/\1 --user-data-dir/' chrome-test 


