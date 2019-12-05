
# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-west-2"
}
resource "aws_efs_file_system" "efs-jenkins" {
   creation_token = "efs-example"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
  
 tags = {
     Name = "EfsJenkins"
   }
 }

resource "aws_efs_mount_target" "alpha" {
  file_system_id = "${aws_efs_file_system.efs-jenkins.id}"
  subnet_id      = "subnet-04fc0065dd95757bf"
}
