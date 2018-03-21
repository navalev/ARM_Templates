$user = Read-Host -Prompt 'VM user name'
$password = Read-Host -AsSecureString -Prompt 'password'
$sourceRG = "source"
$targerRG = "target"

# Create Source 
New-AzureRmResourceGroup -Name $sourceRG -Location 'West Europe'
$sourceVnet = New-AzureRmResourceGroupDeployment -ResourceGroupName $sourceRG -TemplateFile .\zertodeploysource.json -vmAdminUserName $user -vmAdminPassword $password

# Create Target and peering (target --> source)
New-AzureRmResourceGroup -Name $targerRG -Location 'West Europe'
$targetVnet = New-AzureRmResourceGroupDeployment -ResourceGroupName $targerRG -TemplateFile .\zertodeploytarget.json -vmAdminUserName $user -vmAdminPassword $password -remoteVnetResource $sourceVnet.Outputs.vNet.Value

# Setup peering (source --> target)
New-AzureRmResourceGroupDeployment -ResourceGroupName $sourceRG -TemplateFile .\zertodeploypeering.json -existingSourceVirtualNetworkName $sourceVnet.Outputs.vNetName.Value -existingTargetVirtualNetworkId $targetVnet.Outputs.vNet.Value
