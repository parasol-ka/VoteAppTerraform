

resource "aws_launch_template" "web" {
  name_prefix   = "web-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = base64encode(<<-EOF
  #!/bin/bash
  set -eux

  dnf -y update
  dnf -y install nginx

  systemctl enable nginx
  systemctl start nginx

  cat << WEBSITE > /usr/share/nginx/html/index.html
  <html>
  <head>
      <title>HEH Tom Deneyer</title>
  </head>
  <body style="background-color:#1F778D">
      <p style="text-align: center;">
          <span style="color:#FFFFFF;">
              <span style="font-size:80px;">
                  Welcome to $(hostname) ! Have a &#127790;
              </span>
          </span>
      </p>
  </body>
  </html>
  WEBSITE
EOF
  )
}

resource "aws_autoscaling_group" "web" {
  name                = "web-asg"
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  vpc_zone_identifier = [aws_subnet.private_a.id, aws_subnet.private_b.id]

  target_group_arns = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 60
}
