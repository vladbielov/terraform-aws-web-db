data "template_file" "init" {
  template = "${file("${path.module}/userdata_web.sh")}"
}

resource "aws_launch_template" "web" {
  name_prefix            = "web"
  image_id               = "${data.aws_ami.centos.id}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.class.key_name}"
  user_data              = "${base64encode(data.template_file.init.rendered)}"
  vpc_security_group_ids = ["${aws_security_group.vpc_task.id}"]

  tags = {
    Name = "Web server"
  }
}
