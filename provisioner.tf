resource "null_resource" "mount_efs_volume" {

	connection {
  	  type     = "ssh"
   	  user     = "ec2-user"
   	  private_key = "${tls_private_key.tftask3.private_key_pem}"
      host = "${aws_instance.web_server.public_ip}"
     }


 	provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd php git amazon-efs-utils nfs-utils -y",
      "sudo setenforce 0",
      "sudo systemctl restart httpd",
      "sudo systemctl enable httpd",
      "sudo echo '${aws_efs_file_system.efs-vol.id}:/ /var/www/html efs defaults,_netdev 0 0' >> /etc/fstab",
      "sudo mount ${aws_efs_file_system.efs-vol.id}:/ /var/www/html",
      #"sudo mkfs.ext4 /dev/xvdh",
      #"sudo mount /dev/xvdh /var/www/html/",
      "sudo rm -rf /var/www/html/*",
      "sudo git clone https://github.com/arvindr73/webimages.git /var/www/html/"
	]
  }
}
