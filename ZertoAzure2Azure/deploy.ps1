$parameters = @{
    "vmAdminUserName" = "azure",
    "vmAdminPassword" = "Admin!234567"
}

$sourceRG = "source"
$targerRG = "target"

New-AzureRmResourceGroup -Name $sourceRG -Location 'West Europe'
New-AzureRmResourceGroupDeployment -ResourceGroupName $sourceRG -TemplateFile zertodeploysource.json -TemplateParameterObject $parameters
New-AzureRmResourceGroup -Name $targerRG -Location 'West Europe'
New-AzureRmResourceGroupDeployment -ResourceGroupName $targerRG -TemplateFile zertodeploytarget.json -TemplateParameterObject $parameters
