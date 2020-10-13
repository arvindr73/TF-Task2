resource "aws_instance" "web_server" {

ami = "ami-0ebc1ac48dfd14136"
instance_type = "t2.micro"
key_name = "tftask3"
security_groups = ["${aws_security_group.web_server.id }"] 
subnet_id = "${aws_subnet.public.id}"
availability_zone = "ap-south-1a"
// user_data = "${file("userdata.sh")}"

 # Save the public IP for testing
  provisioner "local-exec" {
    command = "echo ${aws_instance.web_server.public_ip} > public-ip.txt"
  }
tags = {
  Name = "Ec2 Instance"
  } 
}
 