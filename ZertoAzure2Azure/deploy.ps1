$user = Read-Host -Prompt 'VM user name'
$password = Read-Host -AsSecureString -Prompt 'password'
$sourceRG = "source"
$targerRG = "target"

New-AzureRmResourceGroup -Name $sourceRG -Location 'West Europe'
$sourceVnet = New-AzureRmResourceGroupDeployment -ResourceGroupName $sourceRG -TemplateFile .\zertodeploysource.json -vmAdminUserName $user -vmAdminPassword $password

New-AzureRmResourceGroup -Name $targerRG -Location 'West Europe'
$targetVnet = New-AzureRmResourceGroupDeployment -ResourceGroupName $targerRG -TemplateFile .\zertodeploytarget.json -vmAdminUserName $user -vmAdminPassword $password -remoteVnetResource $sourceVnet.Outputs.vNet

New-AzureRmResourceGroupDeployment -ResourceGroupName $sourceRG -TemplateFile .\zertodeploypeering.json -existingSourceVirtualNetworkName $sourceVnet.Outputs.vNet -existingTargetVirtualNetworkId $targetVnet.Outputs.vNet
