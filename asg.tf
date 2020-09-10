resource "aws_autoscaling_group" "web" {
  name             = "web"
  max_size         = "${var.max_size}"
  min_size         = "${var.min_size}"
  desired_capacity = "${var.desired_capacity}"
  force_delete     = true

  launch_template {
    id = "${aws_launch_template.web.id}"
  }

  vpc_zone_identifier = [
    "${aws_subnet.public1.id}",
    "${aws_subnet.public2.id}",
    "${aws_subnet.public3.id}",
  ]
}
