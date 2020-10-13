resource "aws_efs_file_system" "efs-vol" {
  creation_token = "efs-vol"
  performance_mode = "generalPurpose"


  tags = {
    Name = "efs-vol"
  }
}


resource "aws_efs_mount_target" "efsmnt" {
  file_system_id = aws_efs_file_system.efs-vol.id
  subnet_id = aws_subnet.public.id
  security_groups = ["${aws_security_group.web_server.id}"]
}