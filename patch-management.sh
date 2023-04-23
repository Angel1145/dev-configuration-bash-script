#!/bin/bash
#cheking if the server has required binaries installed
sudo apt-get update -y
sudo apt-get upgrade -y
#installing packages that are not in the server 
if command -v docker &>/dev/null; then
    echo "yes"
else 
    echo "docker is installing"
    sudo apt  install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
fi
#cheking if wget is installed
if command -v wget &>/dev/null; then
    echo "install"
else 
    echo "wget is installing"
    sudo apt install wget -y
    #sudo apt-get upgrade -y
fi
#cheking if git is installed   
if command -v git &>/dev/null; then
    echo "yes git is present"
else
    echo "git is installing..."
    sudo apt install git -y
fi
#checking if mysql is installed
if command -v mysql &>/dev/null; then
    echo "yes"
else
    echo "mysql is installing"
    sudo apt install mysql-client-core-8.0 
    sudo systemctl start mysql
    sudo systemctl enable mysql
fi
#checking if mysql is install
if command -v ansible &>/dev/null; then
    echo "present"
else
    echo "ansible is installing"
    sudo apt install ansible-core -y
fi
#checking if curl is installed
if command -v curl &>/dev/null; then
    echo "curl is present"
else
    echo "curl is installing..."
    sudo apt install curl -y
fi
#checking if terraform binaries exist
if command -v terraform &>/dev/null; then
    echo "terraform binaries exist"
else
    echo "terraform binaries installing..."
    sudo wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform -y
fi
#checking if docker compose exist
if command -v docker-compose &>/dev/null; then
    echo "yes it is"
else 
    echo "docker-compose installing..."
    sudo apt  install docker-compose -y
fi
echo "the configuration of the packages we need in the dev environment is complete"



