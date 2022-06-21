module "key" {
  source     = "git::github.com/andrewpopa/terraform-metal-project-ssh-key"
  project_id = var.project_id
}

module "device" {
  source = "git::github.com/andrewpopa/terraform-metal-device"

  hostname         = "metal-ubuntu"
  plan             = "c3.medium.x86"
  facilities       = ["am6"]
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
}

resource "null_resource" "silent" {
  connection {
    type        = "ssh"
    user        = "root"
    host        = module.device.access_public_ipv4
    private_key = file(module.key.private_key_filename)
  }

  provisioner "remote-exec" {
    inline = [<<EOF
      sudo apt update

      EOF
    ]
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${module.device.access_public_ipv4}', --private-key ${module.key.private_key_filename} nginx.yml"
  }
}