output "vpc_id" {
    value = aws_vpc.aws13_vpc.id
}

output "public_subnet2a" {
    value = aws_subnet.aws13-public-subnet2a.id
}

output "public_subnet2c" {
    value = aws_subnet.aws13-public-subnet2c.id
}

output "private_subnet2a" {
    value = aws_subnet.aws13-private-subnet2a.id
}

output "private_subnet2c" {
    value = aws_subnet.aws13-private-subnet2c.id
}
