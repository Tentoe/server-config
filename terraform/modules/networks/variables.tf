variable "network_names" {
  type = list(string)
  description = "List of networks to create"
  default     = ["default"]
}

variable "pool_prefixes" {
  type = list(string)
  description = "CIDR prefixes for subnet pool."
  default     = ["10.10.0.0/16"]
}

variable "provider_cidr" {
  type = string
  description = "CIDR of external provider LAN"
  default = "192.168.178.0/24" 
}

variable "provider_router_ip" {
  type = string
  description = "External IP Adress"
  default = "192.168.178.222"
}
