provider "aws" {
  region = "us-east-1"
  #access_key = var.access_key
  #secret_key = var.secret_key
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
}
