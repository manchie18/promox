variable "proxmox_api_url" {
  type = string
  default = "https://192.168.86.120:8006/api2/json"
}

variable "proxmox_api_token_id" {
  type = string
  default = "root@pam!terraform"
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type = string
  default = "648395ee-1f17-4f10-a81e-c0de1b916a6c"
  sensitive = true
}