terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "ExampleAppServerInstance" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
    key_name  = aws_key_pair.existing_key.key_name

 }
}

resource "aws_key_pair" "existing_key" {
  key_name   = "MyKey.pem"
  public_key = file("/root/.ssh/id_rsa.pub/")
}
