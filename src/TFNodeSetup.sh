
######################################################
## TF node Set up
######################################################
 
 sudo apt update -y
 sudo apt upgrade -y
 sudo apt install unzip -y
 
 out=$(curl ifconfig.me  )
ssh $out -o  StrictHostKeyChecking=no  -o ControlMaster=no  </dev/null
 
 
mkdir myscripts
mkdir tf
chmod 777 myscripts/
chmod 777 tf/
cd myscripts/
 
cd ..
cd tf/
  
 wget https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_amd64.zip
 unzip terraform_1.2.4_linux_amd64.zip
 rm terraform_1.2.4_linux_amd64.zip
 cd .. 
  
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
 
 


 


 
 ############################################################
 
# from window
# scp -i .\25july.pem .\src\* ubuntu@54.175.58.210:~/tf/
 
 
 ## Go to ubuntu
 #cmdd2="sudo echo   export PATH=$PATH:/home/ubuntu/tf  | sudo -S tee -a ~/.bashrc"
 # ssh -i ~/.ssh/custkey  ubuntu@54.175.58.210  "$cmdd2"
 ## or 
 #sudo vi ~/.bashrc
 ##export PATH=$PATH:/home/ubuntu/tf
 
 ##  source ~/.bashrc 
 
 #  cp ~/.ssh/custkey.pvt  ~/myscripts
 #  cp ~/tf/deployansible.sh   ~/myscripts/deployansible.sh 
 #  cp ~/tf/sub1.sh   ~/myscripts/sub1.sh 
   
    ############################################################
	
	
	## Create  custkey in aws
	## cat ~/.ssh/custkey.pub

	
   ############################################################
## clear	
## cd ~/tf	
##	terraform init
##	terraform plan
##   terraform apply
   
exit
