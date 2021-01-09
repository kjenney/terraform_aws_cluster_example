variable "instance_type" {
    description = "Type of EC2 instance"
    default = "t2.micro"
}

variable "keypair" {
    description = "Key pair to access the EC2 instance"
    default = "default"
}

variable "allow_ssh_from_cidrs" {
    description = "List of CIDRs allowed to connect to SSH"
    default = ["0.0.0.0/0"]
}
