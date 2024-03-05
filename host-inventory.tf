// export the ip addresses of instances into host-inventory file 

resource "local_file" "host-inventory" {
  filename = "host-inventory"
  content = <<EOT
  ${aws_instance.server[0].public_ip}
  ${aws_instance.server[1].public_ip}
  ${aws_instance.server[2].public_ip}
    EOT
}
