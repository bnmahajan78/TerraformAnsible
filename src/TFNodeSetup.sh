
######################################################
## TF node Set up
######################################################


 sudo apt update -y
 sudo apt upgrade -y
 sudo apt install unzip -y
 
mkdir myscripts
mkdir tf
chmod 777 myscripts/
chmod 777 tf/
cd myscripts/

cd ..
cd tf/
 touch main.tf
 touch provider.tf
 touch terraform.tfvars
 
 wget https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_amd64.zip
 unzip terraform_1.2.4_linux_amd64.zip
 rm terraform_1.2.4_linux_amd64.zip
 #sudo vi ~/.bashrc
 ##export PATH=$PATH:/home/ubuntu/tf
#cd ..


#terraform init
#terraform plan
#terraform apply

 
#======================================================

sudo hostnamectl set-hostname "TFNode"
cd ~/.ssh

ssh-keygen -q -t rsa -N ''  -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
cp id_rsa id_rsa_bkp
cp id_rsa.pub id_rsa.pub_bkp

ssh-keygen -p -N "" -m pem -f /home/ubuntu/.ssh/id_rsa <<<y >/dev/null 2>&1
cat id_rsa.pub >> authorized_keys


ssh-keygen -q -t rsa -N ''  -f ~/.ssh/custkey <<<y >/dev/null 2>&1
cp custkey custkey_bkp
cp custkey.pub custkey.pub_bkp
cp custkey custkey.pvt
cp ~/.ssh/custkey.pvt  ~/myscripts

ssh-keygen -p -N "" -m pem -f /home/ubuntu/.ssh/custkey <<<y >/dev/null 2>&1
cat custkey.pub >> authorized_keys


cat ~/.ssh/authorized_keys
 cat ~/.ssh/custkey.pub
 
 

out=$(curl ifconfig.me  )
ssh $out -o  StrictHostKeyChecking=no  -o ControlMaster=no  </dev/null
exit
 
 
## Create key in aws

## scp -i .\25july.pem .\src\* ubuntu@52.90.67.80:~/tf/
## cp ~/.ssh/custkey.pvt  ~/myscripts
 
