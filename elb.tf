resource "aws_elb" "bar" {
  name            = "vpc-terraform-elbs"
  security_groups = ["${aws_security_group.vpc_task.id}"]

  subnets = [
    "${aws_subnet.public1.id}",
    "${aws_subnet.public2.id}",
    "${aws_subnet.public3.id}",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "web-terraform-elbs"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${aws_autoscaling_group.web.id}"
  elb                    = "${aws_elb.bar.id}"
}
