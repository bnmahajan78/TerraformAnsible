		mip=$(curl ifconfig.me  )
		masterip=$(curl ifconfig.me  )
		 
	    ls
		ls ~/myscripts
		cat ~/myscripts/masternode
		cat ~/myscripts/iplist
		cp ~/myscripts/custkey ~/.ssh/custkey
		cp ~/myscripts/custkey.pub ~/.ssh/custkey.pub
		cd ~/.ssh
		ls  


 
		ssh-keygen -q -t rsa -N ''  -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
	 
		cp id_rsa id_rsa_bkp
		cp id_rsa.pub id_rsa.pub_bkp
		
		ssh-keygen -p -N "" -m pem -f /home/ubuntu/.ssh/id_rsa <<<y >/dev/null 2>&1
		
		ls -al 
		cat id_rsa.pub >> authorized_keys
		cat authorized_keys
		mip=$(curl ifconfig.me  )
		echo $mip
		echo $masterip
		echo $masterip1
		 
		echo "$masterip"
		echo ${masterip}
		echo "${masterip}"
		echo $masterip
	  	 
        ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$masterip "${cmdd}" </dev/null
 
	    ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$masterip 'sudo cat /etc/hosts' </dev/null
      
	   	echo "=======9==========="
 
		ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$mip 'sudo hostnamectl set-hostname Master' </dev/null

		 ##cmdd2="/bin/bash  ~/myscripts/sub2.sh  $mip"
		 ## ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$mip "${cmdd2}" </dev/null
        
		
		#################################################
		
		mip=$(curl ifconfig.me  )
masterip=$(curl ifconfig.me  )
 
 
	    ls
		ls ~/myscripts
		
	   	wfile="/home/ubuntu/myscripts/iplist"
		wip=""
		 
		echo "$wfile"
		echo ${wfile}
		echo "${wfile}"
		echo $wfile
		
	    echo " ###################################################### "
		echo " ## Worker node - from master node "
		echo " ###################################################### "
   
		wfile="/home/ubuntu/myscripts/iplist"
		wip=""
		 
		echo "$wfile"
		echo ${wfile}
		echo "${wfile}"
		echo $wfile
		
		cat  $wfile
		echo "====================xxxxxxxxxxxxxxxxxxxxxxx======================" 
		cmdd=''
		while read -r line; do
				echo   -e "$line\n"
			 	wip=$line
				 echo "======>"$wip
				 
				## cat ~/.ssh/custkey 
				 outt=$(curl ifconfig.me)
				 echo "outt = " $outt
				 echo "$line = " $line
				echo "$wip = " $wip
				
				echo "===1===>"
				scp -o StrictHostKeyChecking=no -i ~/.ssh/custkey   ~/.ssh/id_rsa ubuntu@$wip:~/.ssh/id_rsa
				scp -o StrictHostKeyChecking=no -i ~/.ssh/custkey   ~/.ssh/id_rsa.pub ubuntu@$wip:~/.ssh/id_rsa.pub
				
			echo "===2===>"
					
				cmdd='cat   ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
				ssh  -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no ubuntu@$wip "$cmdd"  </dev/null
				
				echo "===3===>"
				cmdd='cat  ~/.ssh/authorized_keys'
				ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no   ubuntu@$wip "$cmdd"   </dev/null    
			
				echo "===4===>"
				sudo scp   -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  /etc/hosts  ubuntu@$wip:~/hosts    </dev/null
				
					echo "===5===>"
				cmdd='sudo cp ~/hosts  /etc/hosts'
				ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no ubuntu@$wip "$cmdd"  </dev/null  
				
				echo "===6===>"
				cmdd='sudo cat  /etc/hosts'
				ssh -i ~/.ssh/custkey  -o  StrictHostKeyChecking=no  -o ControlMaster=no  ubuntu@$wip "$cmdd"    </dev/null   
				
				echo "===7===>"
				
		done <$wfile		  
		echo $wip
			
			
				
		
				
			
				
				
				
				
		        ## SSH with any private key
				##ssh -i ~/.ssh/custkey  ubuntu@$wip  -tt -o  StrictHostKeyChecking=no  -o ControlMaster=no    
				##exit
				## SSH Without any private key
				##ssh    ubuntu@$wip -tt -o  StrictHostKeyChecking=no -o ControlMaster=no   <<EOF
				##exit
	 ##ssh -i ~/.ssh/custkey   ubuntu@$mip -tt -o  StrictHostKeyChecking=no  -o ControlMaster=no <<EOF
  	##  curl ifconfig.me
  ##exit
		
		################################################
		
		
######################################################
## Instal Ansible node
######################################################
       
	   cd ~/myscripts/
	   ls
	   
       sudo apt-add-repository ppa:ansible/ansible </dev/null
       sudo apt update -y </dev/null
       sudo apt install ansible -y </dev/null
	   
		sudo   cp /etc/ansible/hosts  /etc/ansible/hosts_original </dev/null
		sudo   cp ~/myscripts/ansiconf  /etc/ansible/hosts </dev/null
		
	   
######################################################
## Ansible test
######################################################


ansible web -m ping </dev/null

ansible app -m ping </dev/null


rm ex3.yaml
 touch ex3.yaml
 echo "---" >>  ~/myscripts/ex3.yaml
 echo "- hosts: web" >>  ~/myscripts/ex3.yaml
 echo "  become: true" >>  ~/myscripts/ex3.yaml
 echo "  tasks:" >>  ~/myscripts/ex3.yaml
 echo "  - name: Install Package" >>  ~/myscripts/ex3.yaml
 echo "    apt: name=apache2 state=present" >>  ~/myscripts/ex3.yaml
 echo "  - name: Start apache2 service" >>  ~/myscripts/ex3.yaml
 echo "    service: name=apache2 state=started" >>  ~/myscripts/ex3.yaml
	   
cat ~/myscripts/ex3.yaml
 
ansible-playbook ~/myscripts/ex3.yaml


rm ex4.yaml
 touch ex4.yaml
 echo "---" >>  ~/myscripts/ex4.yaml
 echo "- hosts: app" >>  ~/myscripts/ex4.yaml
 echo "  become: true" >>  ~/myscripts/ex4.yaml
 echo "  tasks:" >>  ~/myscripts/ex4.yaml
 echo "  - name: Install Package" >>  ~/myscripts/ex4.yaml
 echo "    apt: name=apache2 state=present" >>  ~/myscripts/ex4.yaml
 echo "  - name: Start apache2 service" >>  ~/myscripts/ex4.yaml
 echo "    service: name=apache2 state=started" >>  ~/myscripts/ex4.yaml
	   
cat ~/myscripts/ex4.yaml
 
ansible-playbook ~/myscripts/ex4.yaml
 
		
	
	   #############################################
		
		exit
 
