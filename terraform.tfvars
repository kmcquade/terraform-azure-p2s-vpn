# basic
base_name =  "ksm"
location = "East US"

# template identifier
template_name = "p2svpn"

# template deployment
virtualNetworkName          = "TestVnet"
gatewayPublicIPName         = "VnetPip"
gatewayName                 = "VnetGw"
vnetAddressPrefix           = "192.168.100.0/24"
gatewaySubnetPrefix         = "192.168.100.16/28"
gatewaySku                  = "Basic"
vpnClientAddressPoolPrefix  = "10.10.8.0/24"
clientRootCertName          = "P2SRootCert"
clientRootCertData          = "MIIC5zCCAc+gAwIBAgIQFLgC9FbV7KZCuuhoqr5DqDANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtQMlNSb290Q2VydDAeFw0xNzEyMjkyMzM3MjdaFw0xODEyMjkyMzU3MjdaMBYxFDASBgNVBAMMC1AyU1Jvb3RDZXJ0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA8N9gcam18gWCVPUkSnwKc/NR7Jyd2eerhyOV67IihYs/DsCcw0yanBi7ZTE/btxf3xplNxH3ZIdG2IXb2s+4vvElQUywy+4HYSHEiy4Ic/Yk/gPkMM2mEG5DVIt9V3rP8owsAcqtA1jUIk3OyNw1EInBHYjP8U7dIBHCTLpe6yUR9eheCkcCegqZ6Jxe53QAe1Y/C183P+qWjdfCIxdpTaY1AROY9V4/d4exqZ4CsIS+YZQHYedn+9fh/3iRSo/dO5t1hd8RijiptEb3aLN8V4n9mOulkoeceQRNh6IfZ9QhnjWzTiaUEJKm9oRJJ+eD9Po66M5WCoDMbBqeLM31IQIDAQABozEwLzAOBgNVHQ8BAf8EBAMCAgQwHQYDVR0OBBYEFLuELyjOHwwxEiwy3ZI0Tda9+cFrMA0GCSqGSIb3DQEBCwUAA4IBAQAqXIZkaiQxa8nXDjlJhPYKa/kt7T+rcalCgymT8FpM4o4z5R04g4jA5p1SS2Wov2aNovifXUOrsBYwm7u5uNqFAXU2GXnEDqK5kns/G0GDUMsD2xxnysexWRHA4ZC7dm8lGPEJgrcmfCG6cdwH14o7kJZRiIEAcb1HXBEpvnkqOOgJ7dX2VfGjqRd09dN4QvL1phDZSBTLt0gg2o5dGOEtSTpfXnm7qiIVCS5SI0LJPG+p+NbqN0B4cnO6ZIZKGm3A0SztU9hyez/XHrrhLQ0pRkCe5x4cjTI1STLPkVNKlZsio3SnvI3xFXWHeUEO3mYLaLvcOODPHubleFvfp1Sw"
revokedCertName             = "RevokedCert1"
revokedCertThumbprint       = "633EBFFBD01B6049D61E3CF059CFD940C8CE5780"
# Borrowed these values from https://github.com/Azure/azure-quickstart-templates/blob/master/101-point-to-site/azuredeploy.parameters.json
# that is, except for clientRootCertName and clientRootCertData. For all you security people, these certs are not in use in my Azure account or present on my computer anymore so I suggest spending your time looking into other things.