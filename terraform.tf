terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.3"
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

    proxmox_api_token_id = "https://192.168.86.120:8006/api2/json"
    proxmox_api_token_secret = var.proxmox_api_token_secret
    proxmox_api_url = var.proxmox_api_url

    proxmox_tls_insecure = true
}


