Ubuntu to Kali Conversion Script
================================

Overview
--------

This simple project allows you to convert a running of instance of Ubuntu with the binaries and other files installed by Kali, the well-known Linux pentesting distribution maintained by by Offensive Security.  To achieve this, the scripts take advantage of the apt package management system, which manages system and application package updates on Debian GNU/Linux and its derivatives such as Ubuntu and Kali.  By swapping repositories, apt goes about "upgrading" the Ubuntu binaries and other files with the Kali versions, leaving you with a Kali box.  

This is basically for personal use, but have at it.  The "ubun2kali.sh" script should work on any Ubuntu machine (but hasn't been tested.)  You could modify "aws_ubun2kali.sh" to work on any other ssh-accessible instance of Ubuntu.

This project contains two bash scripts:

**ubun2kali.sh** -- This script is run on the target Ubuntu machine.  It basically replaces the Ubuntu repositories located in /etc/apt/sources.list with the repositories from the same location on a Kali machine. It then updates the machine with "apt update" and "apt upgrade -y".  

**aws_ubun2kali.sh** -- This script takes two inputs from the user, an ip address and a pem file that must be located in ~/.ssh.  It uses these to connect to an AWS instance to upload and execute as root the ubun2kali.sh script.  

Technical instructions
----------------------

To run these two scripts, you need to clone this github repo and 

`$ git clone https://github.com/obitori/ubun2kali`

`$ cd ubun2kali`

`$ ./aws_ubun2kali.sh xxx.xxx.xxx.xxx SOME_KEY_FILE.pem`

"xxx.xxx.xxx.xxx" should be your AWS instance's public IP.  SOME_KEY_FILE.pem is the file containing your authentication key for the AWS instance.  This script assumes that the AWS user is ubuntu with no-password sudo rights.  The script should upload the ubun2kali.sh script and execute it as root.  Now you can ssh into this machine, after it finishes rebooting, and you have a working Kali instance.

Bugs
----
1.  In one case. the Kali update does not update the package "fwupd".  Ignoring it seemed to cause no issues.

2.  You may need to run upgrade twice.

