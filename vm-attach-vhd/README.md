# Create a Virtual Machine and attach to existing VHD (specialized image)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnavalev%2FARM_Templates%2Fmaster%2Fvm-attach-vhd%2Fvm-attach-vhd.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

Create a new Virtual Machines, by attaching to existing VHD OS and data disks. 
The template will also create a new Virtual Network, public IP and NIC. 

Prerequisite - The VHD images to be used for OS and data disks must be in an Azure Resource Manager storage account.