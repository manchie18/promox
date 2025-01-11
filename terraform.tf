terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = ">=2.9.3"
        }
    }

}

variable "proxmox_api_url" {
    type = string
}


variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}


variable "proxmox_api_token_secret" {
    type = string
    sensitive = true

}

provider "proxmox" {
    
    pm_api_url = var.proxmox_api_url
    pm_api_token_id = var.proxmox_api_token_id
    pm_api_token_secret = var.proxmox_api_token_secret
    pm_tls_insecure = true
}

locals {
  ssh_authorized_keys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4uX9RBgaK79Rh0W8awpbOAv/Q1UCK02dIFh9O4jroXfoE0CQWfGD4Dxx20TgvoNNFaX+Mc7L64w92zfLykvXcl7hbwt6cakc1YDp8hDzfH+7CLHI8nNTKS7DQMk6K8LJkUte5DuF3dyRJKsVTBXjdEjD28RpmEvXJnD+rN0lp8S421p4j+BlUjPXAAWEkUGkFKPSMOHwSjWCTnutUQ3toBZaZ+7haWU39s19Tlkd9CIc6NVxLu6Ykv8FdXK5yz78wIpIEEAgV/7gjRTUDa+3FLLqMlhSl92m+kLRSOoc1TcoiNBq1rwKLYbbNCKI6Okiu9MdyQ2ZxriJkyJYowm5HyFXwLquN0fx/AEoTeRUuWD16/xBOb6dXvUmCcx1MO2p0KwTtlRFRQxix5zrGcM6FXiTaMCurn0Gskgt9nf4S75P75D7EDkTkSLS+WC7RkUbteHKygjGRLmu+Fx+9Y0gK0Go4Vbv3IP7qpliDsBP71oZWx4ziO979uWsm1Ub0/M= ansible@Terraform
EOF
}

resource "local_file" "ssh_authorized_keys" {
  filename = "/root/.ssh/authorized_keys"
  content  = local.ssh_authorized_keys
}
