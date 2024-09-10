# terraform.tfvars
tenancy_ocid         = "<your_tenancy_ocid>"
user_ocid            = "<your_user_ocid>"
fingerprint          = "<your_fingerprint>"
private_key_path     = "~/.oci/oci-api-key.pem"
region               = "<your_region>" 
compartment_id       = "<your_compartment_id>"
availability_domain  = "<your_availability_domain>"
instance_shape       = "VM.Standard.E2.1.Micro"
source_id            = "<your_image_id_here" # https://docs.oracle.com/en-us/iaas/images/
ssh_public_key_path  = "~/.ssh/id_rsa.pub"
