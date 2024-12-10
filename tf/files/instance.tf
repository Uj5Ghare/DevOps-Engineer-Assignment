resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = "t3.micro"
  key_name               = var.key-name
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  root_block_device {
    volume_size = 8
  }
  user_data = templatefile("./app.sh", {})

  tags = {
    Name = var.instance-name
  }
}

# Output block to get the public IP
output "instance_public_ip" {
  value       = aws_instance.ec2.public_ip
  description = "The public IP address of the EC2 instance"
}