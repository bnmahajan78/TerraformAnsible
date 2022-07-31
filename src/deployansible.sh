
####################################
### Master node
####################################

		
cd ~/myscripts
mfile='/home/ubuntu/myscripts/masternode'
mip=''
masterip=''
masterip1=''
cmdd=""
masterip=$(curl ifconfig.me  )
masterip1=$(curl ifconfig.me  )
cmdd="'sudo echo  $masterip1 Master.example.com  | sudo -S tee -a /etc/hosts'"

		
echo $mfile

while read -r line; do
			echo   -e "$line\n"
			echo   "=============7.1 Master :Make backup of authorized_keys ================"
            mip=$line
		  
done <$mfile		  
echo $mip



	   i=0
 
	 
		 
##ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$mip 'rm -r ~/myscripts' <<EOF
ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$mip 'mkdir ~/myscripts' </dev/null
scp -i ~/.ssh/custkey   ~/myscripts/masternode ubuntu@$mip:~/myscripts/masternode
scp -i ~/.ssh/custkey   ~/myscripts/iplist ubuntu@$mip:~/myscripts/iplist
scp -i ~/.ssh/custkey   ~/myscripts/custkey ubuntu@$mip:~/myscripts/custkey
scp -i ~/.ssh/custkey   ~/myscripts/custkey.pub ubuntu@$mip:~/myscripts/custkey.pub
scp -i ~/.ssh/custkey   ~/myscripts/ansiconf ubuntu@$mip:~/myscripts/ansiconf
 scp -i ~/.ssh/custkey   ~/myscripts/sub1.sh ubuntu@$mip:~/myscripts/sub1.sh
 
   wfile='/home/ubuntu/myscripts/iplist'
 
		cmdd2=''
 		while read -r linew; do
          echo  -e "$linew\n"
          ((i=i+1))
		 
		  cmdd2="sudo echo   $linew   Worker${i}.example.com  | sudo -S tee -a /etc/hosts"
		  echo "$cmdd2"
		  echo ${cmdd2}
		  echo "${cmdd2}"
		  echo $cmdd2
		
          ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$linew "${cmdd2}" </dev/null

		
         done <$wfile
		 
		
		   cmdd2="/bin/bash  ~/myscripts/sub1.sh  $mip"
         ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$mip "${cmdd2}" </dev/null
          
         
		  
 exit
 

