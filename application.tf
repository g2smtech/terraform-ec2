resource "aws_key_pair" "ssh" {
  key_name   = "default"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_security_group" "examplesg" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ec2_instance" {
  ami                    = "ami-00068cd7555f543d5"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.examplesg.id}"]
  key_name               = aws_key_pair.ssh.id

  tags = {
    Name = "my-terra-server-server"
  }
}
output "web_public_dns" {
  value = aws_instance.ec2_instance.public_dns
}

