#
#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "5.10.0"
#    }
#  }
#}
#Configure the AWS Provider
#provider "aws" {
#  region = "us-east-1"
#}

#Create EC2 Instance
resource "aws_instance" "jenkins-ec2" {
  ami           = "ami-07caf09b362be10b8"
  instance_type = "t2.small"
  key_name      = "pradeep-devops-account"
  user_data     = file("install_jenkins.sh")
  vpc_security_group_ids = [aws_security_group.myjenkins_sg.id]
  tags = {
    Name = "Jenkins-Server"
  }
}
/*
resource "aws_ebs_volume" "ebs-vol" {
  availability_zone = aws_instance.jenkins-ec2.availability_zone
  size              = 20
  tags = {
    Name = "Jenkins_ebs_volume"
  }
}
resource "aws_volume_attachment" "ebs-attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs-vol.id
  instance_id = aws_instance.jenkins-ec2.id
}

output "instance_id" {
  value = aws_instance.jenkins-ec2.id
}

output "volume_id" {
  value = aws_ebs_volume.ebs-vol.id
}

output "attachment_id" {
  value = aws_volume_attachment.ebs-attach.id
}
*/
#Create security group 
resource "aws_security_group" "myjenkins_sg" {
  name        = "pradeep-jenkins_sg"
  description = "Allow inbound ports 22, 8080"
  vpc_id      = "vpc-091d1aeeaf776755e"
 tags = {
    Name = "pradeep-jenkins_sg"
  }
  #Allow incoming TCP requests on port 22 from any IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["104.30.160.2/32"]
  }
  #Allow incoming TCP requests on port 443 from any IP
  ingress {
    description = "Allow HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["104.30.160.2/32"]
  }

  #Allow incoming TCP requests on port 8080 from any IP
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["104.30.160.2/32"]
  }

  #Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
/*
#Create S3 bucket for Jenksin Artifacts
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "pradeep-jenkins-s3-bucket-terraform"

  tags = {
    Name = "pradeep-Jenkins-Server"
  }
}

#make sure is prive and not open to public and create Access control List

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket     = aws_s3_bucket.my-s3-bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}
*/
