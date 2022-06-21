output "access_private_ipv4" {
  description = "private ipv4"
  value       = module.device.access_private_ipv4
}

output "access_public_ipv4" {
  description = "public ipv4"
  value       = module.device.access_public_ipv4
}

output "access_public_ipv6" {
  description = "public ipv6"
  value       = module.device.access_public_ipv6
}

output "created" {
  description = "when it was created"
  value       = module.device.created
}

output "hostname" {
  description = "hostname"
  value       = module.device.hostname
}

output "id" {
  description = "device id"
  value       = module.device.id
}

output "operating_system" {
  description = "device os"
  value       = module.device.operating_system
}

output "root_password" {
  description = "device root password"
  value       = module.device.root_password
  sensitive   = true
}

output "state" {
  description = "device state"
  value       = module.device.state
}

output "private_key_filename" {
  value = module.key.private_key_filename
}

output "ssh_name" {
  value = module.key.name
}