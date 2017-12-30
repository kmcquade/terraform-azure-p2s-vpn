terraform {
  required_version = "> 0.11.0"
}

provider azurerm {}

# Generate random suffix for use in resource group name. Useful for temporary environments.
# I'll eventually change this module to only use that format for dev/staging and a user-defined name for prod.
resource "random_id" "random_suffix" {
  byte_length = 3
}

resource "azurerm_resource_group" "rg" {
  name     = "${format("rg-%s-%s", var.base_name, random_id.random_suffix.hex)}"
  location = "${var.location}"
}

resource "azurerm_template_deployment" "p2s" {
  name                = "${var.template_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  deployment_mode     = "Incremental"
  template_body       = "${file("./p2s_vpn.json")}"

  # these key-value pairs are passed into the ARM Template's `parameters` block

  parameters {
    virtualNetworkName         = "${var.virtualNetworkName}"
    gatewayPublicIPName        = "${var.gatewayPublicIPName}"
    gatewayName                = "${var.gatewayName}"
    vnetAddressPrefix          = "${var.vnetAddressPrefix}"
    gatewaySubnetPrefix        = "${var.gatewaySubnetPrefix}"
    gatewaySku                 = "${var.gatewaySku}"
    vpnClientAddressPoolPrefix = "${var.vpnClientAddressPoolPrefix}"
    clientRootCertName         = "${var.clientRootCertName}"
    clientRootCertData         = "${var.clientRootCertData}"
    revokedCertName            = "${var.revokedCertName}"
    revokedCertThumbprint      = "${var.revokedCertThumbprint}"
  }
}
