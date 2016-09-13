# Deploys a Windows VM from a custom image and Configures a WinRM Https listener

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnavalev%2FARM_Templates%2Fmaster%2Fvm-windows-winrm-user-image%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnavalev%2FARM_Templates%2Fmaster%2Fvm-windows-winrm-user-image%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Description of Template
=======================
This template allows you to deploy a simple Windows Virtual Machine from a custom user VHD.
This will then configure a WinRM https listener by creating a new test certificate (it creates a self signed certificate, so no extra certificate is required).

The template uses a custom script extension which executes the script 'https://raw.githubusercontent.com/navalev/ARM_Templates/master/vm-windows-winrm-user-image/ConfigureWinRM.ps1' on the target machine.
This script creates a self signed certificate and configures the WinRM Https listener using the certificate's thumbprint.

**Note** that the new Virtual Machine disks will be created in the same storage account where the disk image is stored in.

How to create a Custom user VHD
===============================
[How to create a VM image from an existing Azure VM using Powershell](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-capture-image/)

[How to create a VM image from an existing Azure VM using Azure Explorer](http://www.codeisahighway.com/how-to-use-arm-explorer-to-capture-your-own-custom-virtual-machine-image-under-azure-resource-manager/)


How to connect to a Target Azure VM post WinRM configuration
============================================================
Use the below script to connect to an azure vm post winrm configuration. Assign the exact fqdn of your azure vm to $hostname.
The script pops up a credential window, provide the credentials of azure vm.

	$hostName=<fqdn-of-vm> # example: "mywindowsvm.westus.cloudapp.azure.com"
	$winrmPort = '5986'

	# Get the credentials of the machine
	$cred = Get-Credential

	# Connect to the machine
	$soptions = New-PSSessionOption -SkipCACheck
	Enter-PSSession -ComputerName $hostName -Port $winrmPort -Credential $cred -SessionOption $soptions -UseSSL
