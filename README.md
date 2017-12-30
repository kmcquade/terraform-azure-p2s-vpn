# Overview:

Terraform module that creates an Azure Virtual Network, Virtual Gateway (via [azurerm_template_deployment](https://www.terraform.io/docs/providers/azurerm/r/template_deployment.html)), and a Gateway subnet.

Problem this module addresses:
- Azure VPN Gateways are not currently supported by Terraform because of an eventual consistency bug in the virtual network Azure API; waiting on [this GitHub issue](https://github.com/Azure/azure-rest-api-specs/issues/1233) to be resolved.
- We are still waiting on [this pull request](https://github.com/terraform-providers/terraform-provider-azurerm/pull/133) in HashiCorp's azurerm provider to be reviewed in order for this issue to (hopefully) be resolved.
- The only viable option to solve this issue is azurerm_template_deployment, but there are no publicly available examples of this solution - so I'm providing an example here.

## Usage notes:

This module creates a resource group dedicated to the resources mentioned in the "Overview" section. When using azurerm_template_deployment, it's important to create resources in a dedicated resource group due to the issues described on [this page](https://www.terraform.io/docs/providers/azurerm/r/template_deployment.html).

Steps:

1. Generate root and client certificates by following the instructions provided by Azure [here](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-point-to-site-rm-ps#Certificates).
2. Create a main.tf file with the following content (feel free to override the default values supplied in other variables too):

```hcl-terraform
module "s2s" {
  source = "github.com/kmcquade/terraform-azure-p2s-vpn"
  clientRootCertName = "${var.clientRootCertName}"
  clientRootCertData = "${var.clientRootCertData}"
}
```

3. Alter the terraform.tfvars file with your parameters, as described [here](https://www.terraform.io/intro/getting-started/variables.html#from-a-file)..
4. Run plan && apply. Note that this deployment will take a while, but Terraform azurerm provider only times out after 40 min which is fine for the purpose of this module.

### Inputs

I'll use terraform-docs for this later.
https://github.com/segmentio/terraform-docs


### Outputs

I'll use terraform-docs for this later.
https://github.com/segmentio/terraform-docs


# Approach

Description of my approach:

- **ARM templates are cumbersome**: Once you create this, the only way to update the resources is to destroy, modify, and redeploy. Look up the Terraform docs on ARM Template deployment if you're unsure about this.
- **Immutability**: IRL, this resource group should not be deleted - partially due to the limitations of ARM template deployments with Terraform, and partially because it is assumed that users/machines utilizing this VPN connection are going to connect through the VPN so they can get to other resources that are peered with this VNet. Basically, forced tunneling into Azure.

# Future improvements:

### New resources to add
- **Resource Locks**: Put a resource lock on the resource group. Need to explore this further.
- **VNet Peering Example**: Need to provide a VNet peering example for how users can run a second Terraform module to create VNet peering from this to other resource groups

### Other
- **Documentation**: Need to provide docs that point readers to certificate creation instructions, etc. to assemble the prereqs for this.

### Down the road:
- **Diagram**: Provide an architecture diagram
- **Pipeline usage**: Provide guidance on pipeline usage.
