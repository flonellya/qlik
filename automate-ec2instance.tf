resource "aws_instance" "Qlik-Replicate" {
  count = var.num_instances
  ami           = "ami-0bbf3595bb2fb39ec"
  instance_type = "t3.medium"
  vpc_security_group_ids = [sg-039f2d81b207cb7da]
  subnet_id =  element(subnet-0ab643787de239342)
  associate_public_ip_address = false
  key_name = "qlik_west"
  tags = {
   Name = "Qlik-replicate-${var.env}-${var.project}-Linux"
   Project = var.project
   Environment = var.env
   OS = "Linux"
  #  yyyy

 }
  root_block_device {
   volume_type = "gp2"
   volume_size = 150
 }
}
