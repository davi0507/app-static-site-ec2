# EC2 INSTANCE
data "template_file" "user_data" {
  template = file("./scripts/user_data.sh")
}

resource "aws_instance" "instance" {
  ami                    = "ami-02e136e904f3da870"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.sn_public.id
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  user_data              = base64encode(data.template_file.user_data.rendered)
}
