module "cluster_1" {
  source                 = "git@github.com:kjenney/terraform-aws-ec2-instance"

  name                   = "my-cluster"
  instance_count         = 2

  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.micro"
  key_name               = var.keypair
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.main.id

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
      encrypted   = false
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    encrypted   = "false"
  }
}
