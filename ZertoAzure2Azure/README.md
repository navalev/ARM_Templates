# Zerto Virtual Replication - Azure to Azure

This sample will setup 2 Azure resource groups - **source** and **target**.
Each group will have a ZCA instance installed. The **source** resouce group will also have a Windows Server Virtual Machine to replicate into **target** resource group once ZCA is configured.

## Setup with Powershell
1. Clone or download this repo to the installation machine
2. Make sure you have [Azure Powershell](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-5.5.0) installed
3. Login to your Azure account:
```powershell
Login-AzureRmAccount
```
4. Execute [deploy.ps1](./deploy.ps1). You will be prompted for username and password for the Virtual Machines to be created. Note that all VMs will have the same username and password in this sample.
```powershell
.\deploy.ps1
```