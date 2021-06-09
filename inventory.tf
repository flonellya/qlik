resource "local_file" "private_key" {
  sensitive_content = tls_private_key.key.qlik_west_pem
  filename          = format("%s/%s/%s", abspath(path.root), ".ssh", "bitops-ssh-qlik_west.pem")
  file_permission   = "0600"
}
resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl", {
      ip          = aws_instance.server.public_ip,
      ssh_keyfile = local_file.qlik_west.filename
  })
  filename = format("%s/%s", abspath(path.root), "inventory.yaml")
}
