# variables.tf
variable "tenancy_ocid" {
  description = "The OCID of your tenancy"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}

variable "vcn_cidr_block" {
  type        = string
  description = "The CIDR block for the VCN."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the subnet."
  default     = "10.0.1.0/24"
}

variable "fingerprint" {
  description = "The fingerprint of the API key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
}

variable "region" {
  description = "The OCI region to deploy resources into"
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "instance_shape" {
  description = "The shape of the instance"
  type        = string
  default     = "VM.Standard2.1"
}

variable "subnet_id" {
  description = "The OCID of the subnet"
  type        = string
  default = "test"
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key file"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain to use"
  type        = string
}

variable "source_id" {
  description = "The OCID for the virtual machine image"
  type        = string
}
