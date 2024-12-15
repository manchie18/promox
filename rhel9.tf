# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "rhel9-vm" {
    
    # VM General Settings
    target_node = "homelab"
    desc = "RHEL9 Server"

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

# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "Nessus" {
    
    # VM General Settings
    target_node = "homelab"
    desc = "Nessus Scanner"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "Nessus"

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


# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "Webserver" {
    
    # VM General Settings
    target_node = "homelab"
    desc = "Production Webserver"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "Webserver"

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