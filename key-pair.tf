// create a key-pair

resource "tls_private_key" "tftask3" {
	algorithm = "RSA"
	rsa_bits = 4096
}

resource "aws_key_pair" "gen_key" {
  key_name   = "tftask3" 
  public_key = "${tls_private_key.tftask3.public_key_openssh}"
}
resource "local_file" "key-file" {
  	content  = "${tls_private_key.tftask3.private_key_pem}"
  	filename = "tftask3.pem"

}