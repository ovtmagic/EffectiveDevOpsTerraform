# Provider Configuration for AWS
provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
}

# Resource Configuration for AWS
resource "aws_instance" "myserver" {
    ami = "ami-08d4ac5b634553e16"
    instance_type = "t2.micro"
    key_name = "wordpress"
    vpc_security_group_ids = ["sg-0ed5bddf75c894362"]

    tags = {
        Name = "helloworld"
    }
}