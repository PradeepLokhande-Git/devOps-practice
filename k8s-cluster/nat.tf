resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "Nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "Nat"
  }
  depends_on = [aws_internet_gateway.igw]
}
