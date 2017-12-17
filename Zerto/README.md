# Deploy Zerto Virtual Replication to Azure

This repository has 2 templates to deploy Zerto virtual appliance to Azure:

[azuredeploy.json](./azuredeploy.json)

This templates deploys a virtual network, public ip, network interface and a Zerto virtual machine. It also provisions a network security group to enable RDP to the VM.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnavalev%2FARM_Templates%2Fmaster%2Fzerto%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

[zertoWithVPN.json](./zertoWithVPN.json)

This template deploys a virtual network, public ip, network interface and a Zerto virtual machine. It also configures an [Azure VPN Gateway](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal) to create a site-to-site connection between the Azure Virtual Network and your local network.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnavalev%2FARM_Templates%2Fmaster%2Fzerto%2FzertoWithVPN.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

