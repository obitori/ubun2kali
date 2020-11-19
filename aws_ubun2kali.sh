#/bin/bash
#
# ssh -o StrictHostKeyChecking=no ubuntu@13.57.190.227 -i ~/.ssh/wonka.pem

scp -i ~/.ssh/$2 -o StrictHostKeyChecking=no ./ubun2kali.sh ubuntu@$1:  
ssh -i ~/.ssh/$2 -o StrictHostKeyChecking=no ubuntu@$1 sudo ./ubun2kali.sh
