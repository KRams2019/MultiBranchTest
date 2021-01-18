
variable "key_name" {
  default = "linux-vm"
}


variable "pvt_key" {
  default = "/root/.ssh/linux-vm.pem"
}


variable "sg_id" {
  default = "sg-01773d731f692cba8"
}
