data "null_data_source" "values" {
  inputs = {
    vpc_id                   = "${aws_vpc.this.id}"
    public_subnet_a_id       = "${aws_subnet.public_subnet_a.id}"
    public_subnet_b_id       = "${aws_subnet.public_subnet_b.id}"
    public_subnet_c_id       = "${aws_subnet.public_subnet_c.id}"
    private_subnet_a_id      = "${aws_subnet.private_subnet_a.id}"
    private_subnet_b_id      = "${aws_subnet.private_subnet_b.id}"
    private_subnet_c_id      = "${aws_subnet.private_subnet_c.id}"
    route_table_public_id    = "${aws_route_table.public.id}"
    route_table_private_id   = "${aws_route_table.private.id}"
  }
}
