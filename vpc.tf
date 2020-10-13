// Create a VPC to launch our instances into

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
}

// Create a Public subnet to launch our instances into

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
}

// Create a Private subnet to launch our instances into

resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.private_subnet_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1b"
 }
 // Create an internet gateway to give our subnet access to the outside world

 resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.my-vpc.id}"
}
