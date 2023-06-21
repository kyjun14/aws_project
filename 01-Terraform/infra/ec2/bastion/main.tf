resource "aws_instance" "aws13_bastion" {
    ami = data.aws_ami.ubuntu.image_id
    instance_type = "t2.micro"
    key_name = "aws13-key"
    # 보안 그룹
    vpc_security_group_ids = [aws_security_group.aws13_ssh_sg.id]
    # 서브넷
    subnet_id = data.terraform_remote_state.aws13_vpc.outputs.public_subnet2a
    # 가용 영역
    availability_zone = "ap-northeast-2a"
    # 퍼블릭 IP 할당 여부
    associate_public_ip_address = true

    tags = {
        Name = "aws13-bastion"
    }
}

# SSH Security Group
resource "aws_security_group" "aws13_ssh_sg" {
    name = "aws13_ssh_sg"
    description = "security group for ssh server"
    vpc_id = data.terraform_remote_state.aws13_vpc.outputs.vpc_id

    ingress {
        description = "For ssh port"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "aws13_ssh_sg"
    }
}