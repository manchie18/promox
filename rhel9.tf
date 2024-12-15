# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "your-vm" {
    
    # VM General Settings
    target_node = "homelab"
    vmid = "100"
    name = "rhel9"
    desc = "RHEL Server"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "RHEL9"

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
        model  = "virtio"
        ipconfig0 = "dhcp"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"
    ciuser = "Charlie"
    
    
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