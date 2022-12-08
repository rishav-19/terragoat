# Create a new load balancer
resource "aws_elb" "weblb" {
  name = "weblb-terraform-elb"

  listener {
    instance_port     = 4000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  subnets                     = [aws_subnet.web_subnet.id]
  security_groups             = [aws_security_group.web-node.id]
  instances                   = [aws_instance.web_host.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = merge({
    Name = "foobar-terraform-elb"
    }, {
    git_commit           = "4e86d665d897b3115b2d0934d1ab9a5b95ce2724"
    git_file             = "terraform/aws/elb.tf"
    git_last_modified_at = "2022-12-08 08:27:21"
    git_last_modified_by = "112870361+rishav-19@users.noreply.github.com"
    git_modifiers        = "112870361+rishav-19/nimrodkor"
    git_org              = "rishav-19"
    git_repo             = "terragoat"
    yor_trace            = "b4a83ce9-9a45-43b4-b6d9-1783c282f702"
  })
}
