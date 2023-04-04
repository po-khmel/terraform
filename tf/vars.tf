// Change this file according to your cloud infrastructure and personal settings
// All variables in < > should be checked and personalized

variable "nfs_disk_size" {
  default = 500
}

variable "flavors" {
  type = map
  default = {
    "central-manager" = "m1.medium"
    "nfs-server" = "m1.medium"
    "exec-node" = "m1.xxl"
    "gpu-node" = "m1.medium"
  }
}

variable "exec_node_count" {
  default = 2
}

variable "gpu_node_count" {
  default = 0
}

variable "image" {
  type = map
  default = {
    "name" = "vggp-v60-j225-1a1df01ec8f3-dev.raw"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v60-j225-1a1df01ec8f3-dev.raw"
    // you can check for the latest image on https://usegalaxy.eu/static/vgcn/ and replace this
    "container_format" = "bare"
    "disk_format" = "raw"
   }
}

# variable "image" {
#   type = map
#   default = {
#     "name" = "vggp-gpu-v60-j15-521c5243b234-dev"
#     "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-gpu-v60-j15-521c5243b234-dev.raw" 
#     // you can check for the latest image on https://usegalaxy.eu/static/vgcn/ and replace this
#     "container_format" = "bare"
#     "disk_format" = "raw"
#    }
# }

variable "public_key" {
  type = map
  default = {
    name = "key_label"
    pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6kc6o2LSHfMBjle8/t97DmxU61NmeNo2zD7+4iHy1i1w+71HmdAfID82wEaElnn6mvjj6RwM96Eew6st1JcoB9xwH9e+yfQhqwvU2hxkHJlxgM78coPtkkKa+PR6OBmeZB5uO8tjr0xnFL4MirZH0RPIHRmj+Y5Rz33xC1REzIvGS6wTGTclNmUgxA3Puix0uaV8AsZR+xGQRXX5id5rFVfEfKPDjaqBNjPUjtqo0XhdPZUuXEm3yMz2u68MM4GlPwcjbiHU66iA9vE6UCGU/YsRRwWlA9TdGPoRMawlyG8YK42ebzH7muZAE9QxfMZbw2G3qyw144dnPQGKh8pPl centos@pulsar-control-vm.garr.cloud.pa"
  }
}

variable "name_prefix" {
  default = "vgcn-"
}

variable "name_suffix" {
  default = ".usegalaxy.eu"
}

variable "secgroups_cm" {
  type = list
  default = [
    "vgcn-public-ssh",
    "vgcn-ingress-private",
    "vgcn-egress-public",
  ]
}

variable "secgroups" {
  type = list
  default = [
    "vgcn-ingress-private",
    "vgcn-egress-public",
  ]
}

variable "public_network" {
  default  = "floating-ip"
}

variable "private_network" {
  type = map
  default  = {
    name = "elixir-VM-net"
    subnet_name = "elixir-VM-subnet"
    cidr4 = "192.168.208.0/22"
  }
}

variable "ssh-port" {
  default = "22"
}

//set these variables during execution terraform apply -var "pvt_key=<~/.ssh/my_private_key>" -var "condor_pass=<MyCondorPassword>"
variable "pvt_key" {
}

variable "condor_pass" {
}

variable "mq_string" {
}
