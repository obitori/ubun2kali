#!/bin/bash

sudo  apt-key adv --keyserver hkp://keys.gnupg.net --recv-keys 7D8D0BF6
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod

cat > /root/sources.list <<EOF
# deb cdrom:[Kali GNU/Linux 2020.1rc4 _Kali-last-snapshot_ - Official amd64 DVD Binary-1 with firmware 20200124-09:35]/ kali-rolling main non-free

# deb cdrom:[Kali GNU/Linux 2020.1rc4 _Kali-last-snapshot_ - Official amd64 DVD Binary-1 with firmware 20200124-09:35]/ kali-rolling main non-free

deb http://http.kali.org/kali kali-rolling main non-free contrib
# deb-src http://http.kali.org/kali kali-rolling main non-free contrib

# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching "deb cdrom"
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.
# deb http://http.kali.org/kali kali-rolling main contrib non-free
# For source package access, uncomment the following line
# deb-src http://http.kali.org/kali kali-rolling main contrib non-free
# deb http://http.kali.org/kali sana main non-free contrib
# deb http://security.kali.org/kali-security sana/updates main contrib non-free
# For source package access, uncomment the following line
# deb-src http://http.kali.org/kali sana main non-free contrib
# deb-src http://security.kali.org/kali-security sana/updates main contrib non-free
deb http://old.kali.org/kali moto main non-free contrib
# For source package access, uncomment the following line
# deb-src http://old.kali.org/kali moto main non-free contrib
deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main

deb https://packages.microsoft.com/ubuntu/20.04/prod focal main
# deb-src https://packages.microsoft.com/ubuntu/20.04/prod focal main
EOF

cp /etc/apt/sources.list /etc/apt/sources.list.old
cp /root/sources.list /etc/apt/sources.list

apt update
apt upgrade -y
