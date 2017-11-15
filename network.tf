resource "aws_vpc" "this" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = "${var.tags}"
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.public_subnet_a}"
  availability_zone = "${var.region}a"
  tags              = "${var.tags}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.public_subnet_b}"
  availability_zone = "${var.region}b"
  tags              = "${var.tags}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.public_subnet_c}"
  availability_zone = "${var.region}c"
  tags              = "${var.tags}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnet_a}"
  availability_zone = "${var.region}a"
  tags              = "${var.tags}"
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnet_b}"
  availability_zone = "${var.region}b"
  tags              = "${var.tags}"
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = "${aws_vpc.this.id}"
  cidr_block        = "${var.private_subnet_c}"
  availability_zone = "${var.region}c"
  tags              = "${var.tags}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${var.tags}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${var.tags}"
}

resource "aws_main_route_table_association" "public" {
  vpc_id         = "${aws_vpc.this.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = "${aws_subnet.private_subnet_b.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = "${aws_subnet.private_subnet_c.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.this.id}"
  tags   = "${var.tags}"
}

resource "aws_route" "public_to_internet" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
}