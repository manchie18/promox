from proxmoxer import ProxmoxAPI
import requests

class VMCloner:
    def __init__(self, proxmox):
        self.proxmox = proxmox

    def clone_vm(self, template_id, new_vm_id, name, memory, cores, sockets, storage, bootdisk):
        while True:
            try:
                self.proxmox.nodes.get('pve').qemu.create(
                    new_vm_id,
                    template=template_id,
                    name=name,
                    memory=memory,
                    cores=cores,
                    sockets=sockets,
                    storage=storage,
                    bootdisk=bootdisk
                )
                print(f"VM {new_vm_id} created successfully.")
                break
            except proxmoxer.exceptions.ProxmoxAPIException as e:
                if "VM ID already exists" in str(e):
                    new_vm_id += 1
                    print(f"VM ID {new_vm_id - 1} already exists. Trying {new_vm_id}.")
                else:
                    print(f"An error occurred: {e}")
                    break

    def clone_rhel9(self, new_vm_id):
        self.clone_vm(100, new_vm_id, "RHEL9", 4096, 2, 1, "vzd", "scsi0")

    def clone_nessus(self, new_vm_id):
        self.clone_vm(105, new_vm_id, "Nessus", 2048, 1, 1, "vzd", "scsi0")

    def clone_webserver(self, new_vm_id):
        self.clone_vm(113, new_vm_id, "Webserver", 1024, 1, 1, "vzd", "scsi0")


proxmox = ProxmoxAPI('https://192.168.86.120:8006', user='root@pam', token_name='', token_value='',service=''  password='linux', verify_ssl=False)
# ... (rest of your code, including the Proxmox API connection)
prox = ProxmoxAPI('10.10.10.10', user='my_user@pam', token_name='testToken', token_value='41c97f11-b8c6-47db-9886-7fa841e64b6e', verify_ssl=False)


# Create a VMCloner instance
cloner = VMCloner(proxmox)

# Clone VMs
cloner.clone_rhel9(300)
cloner.clone_nessus(301)
cloner.clone_webserver(302)