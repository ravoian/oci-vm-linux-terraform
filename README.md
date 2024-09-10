# OCI VM with Terraform

Sample configuration to setup OCI virtual machine using Terraform infrastructure-as-code

## For running locally:

1. Clone or download this repository [Cloning a repository - GitHub Docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)

2. Sign up for OCI [Oracle Cloud Free Tier | Oracle](https://www.oracle.com/cloud/free/)

3. Install Terraform [Install | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/install)

4. Install OCI CLI [Command Line Interface (CLI)](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cliconcepts.htm)

5. Update the necessary values in `terraform.tfvars`

6. Find the user OCID's under User info in OCI web portal

7. Find availability domain using `oci iam availability-domain list`

8. Find VM image OCID using [Oracle Cloud Infrastructure Images](https://docs.oracle.com/en-us/iaas/images/)

9. Ensure OCI API SSH key & user SSH key are setup

10. Run `setup.bat` to start creating resources

11. Run `destroy.bat` to destroy created resources

12. Inspect `ssh_connect.bat` for example of ssh connection

## Additional online resources:

- [Get started with Oracle Cloud Infrastructure basics](https://docs.oracle.com/en/learn/oci-basics-tutorial/index.html)
- [Terraform: Set Up a Simple Infrastructure with OCI Terraform](https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-simple-infrastructure/01-summary.htm)
- [OCI | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials/oci-get-started)
