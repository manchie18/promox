# Proxmox Full-Clone
# ---
# Create a new VM from a clone

variable "vm_count" {
  type = number
  default = 3
}

resource "proxmox_vm_qemu" "rhel9-vm" {
  count = var.vm_count

  # VM General Settings
  target_node = "homelab"
  desc = "RHEL9 Server ${count.index + 1}" 

  # VM Advanced General Settings
  onboot = true

  # VM OS Settings
  clone = "rhel9"

  # VM System Settings
  agent = 1

  # VM CPU Settings
  cores = 1
  sockets = 1
  cpu = "host"

  # VM Memory Settings
  memory = 2048

  # VM Network Settings
  network {
    bridge = "vmbr0"
    model = "virtio"
  }

  # VM Cloud-Init Settings
  os_type = "cloud-init"
  ciuser = "Charlie"
  ipconfig0 = "dhcp"

  # Disk settings
  disk {
    storage = "local-lvm"
    type = "virtio"
    size = "10G"
  }

  # (Optional) Add your SSH KEY
  # sshkeys = <<EOF
  # #YOUR-PUBLIC-SSH-KEY
  # EOF
}
