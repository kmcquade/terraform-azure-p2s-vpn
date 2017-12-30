variable base_name {
  description = "A few characters to use as a prefix to the randomly generated resource group name. Trick for temporary environments."
  default = "ksm"
}
variable location {
  description = "Location."
  default = "East US"
}
variable template_name {
  description = ""
  default = "p2svpn"
}

# Variables for the Template deployment
# Borrowed the default values from https://github.com/Azure/azure-quickstart-templates/blob/master/101-point-to-site/azuredeploy.parameters.json - that is, except for my clientRootCertName and clientRootCertData
variable virtualNetworkName {
  description = "Name of the VNet"
  default = "TestVnet"
}

variable vnetAddressPrefix {
  description = "Address space for the VNet"
  default = "192.168.100.0/24"
}

variable gatewaySubnetPrefix {
  description = "The prefix for the GatewaySubnet where the VirtualNetworkGateway will be deployed. This must be at least /29"
  default = "192.168.100.16/28"
}

variable gatewayPublicIPName {
  description = "The name of the PublicIP attached to the VirtualNetworkGateway. Note that static IPs are not supported yet, so this module uses dynamic public IPs."
  default = "VnetPip"
}

variable gatewayName {
  description = "The name of the VirtualNetworkGateway."
  default = "VnetGw"
}

variable gatewaySku {
  description = "The Sku of the Gateway. This must be one of Basic, Standard or HighPerformance."
  default = "Basic"
}

variable vpnClientAddressPoolPrefix {
  description = "The IP address range from which VPN clients will receive an IP address when connected. Range specified must not overlap with on-premise network."
  default = "10.10.8.0/24"
}

variable clientRootCertName {
  description = "The name of the client root certificate used to authenticate VPN clients. This is a common name used to identify the root cert."
}

variable clientRootCertData {
  description = "Client root certificate data used to authenticate VPN clients. Note that this is public only. See link in README.md"
}

variable revokedCertName {
  description = "The name of revoked certificate, if any. Unfortunately you have to provide this as part of the ARM template, so a default dummy value is supplied in the variables.tf file."
  default = "RevokedCert1"
}

variable revokedCertThumbprint {
  description = "Thumbprint of the revoked certificate. Unfortunately you have to provide this as part of the ARM template, so a default dummy value is supplied in the variables.tf file"
  default = "633EBFFBD01B6049D61E3CF059CFD940C8CE5780"
}