#!/bin/bash 

#Install java 11 and maven -
yum update -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install -y maven

#Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install jenkins -y
systemctl enable jenkins
systemctl start jenkins

#Install Docker 
yum install -y docker
systemctl start docker
yum install -y git
yum install -y pip
yum install -y tree

usermod -a -G docker jenkins

systemctl restart jenkins
systemctl daemon-reload
systemctl stop docker 

#Install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/

sudo yum install -y nodejs14

