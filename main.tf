# Create a VCN with DNS enabled
resource "oci_core_vcn" "example_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = var.vcn_cidr_block
  display_name   = "example-vcn"
  dns_label      = "examplevcn"  # Enable DNS at the VCN level
}

# Create an Internet Gateway for the VCN
resource "oci_core_internet_gateway" "example_internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.example_vcn.id
  display_name   = "example-internet-gateway"
  enabled        = true
}

# Create a Route Table for the VCN to route traffic to the Internet Gateway
resource "oci_core_route_table" "example_route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.example_vcn.id

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id  = oci_core_internet_gateway.example_internet_gateway.id
  }
}

# Create a Subnet in the VCN
resource "oci_core_subnet" "example_subnet" {
  compartment_id            = var.compartment_id
  vcn_id                    = oci_core_vcn.example_vcn.id
  cidr_block                = var.subnet_cidr_block
  display_name              = "example-subnet"
  route_table_id            = oci_core_route_table.example_route_table.id
  dns_label                 = "examplesubnet"  # Enable DNS for the subnet
  prohibit_public_ip_on_vnic = false  # Allow Public IPs for instances in this subnet
}

# Create a Security List to allow SSH (port 22) access
resource "oci_core_security_list" "example_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.example_vcn.id

  ingress_security_rules {
    protocol = "6"  # TCP
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

# Create the instance 
resource "oci_core_instance" "example_vm" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = "example-vm"

  source_details {
    source_id   = var.source_id
    source_type = "image"
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.example_subnet.id
    assign_public_ip = true
    display_name     = "example-vnic"
    hostname_label   = "example-vm"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  value = oci_core_instance.example_vm.public_ip
}