
[CmdletBinding()]
param (

    [Parameter(Mandatory)]
    [string]$keyVaultRG,

    [Parameter(Mandatory)]
    [string]$keyVaultName,

    [Parameter(Mandatory)]
    [string]$appConfigRG,

    [Parameter(Mandatory)]
    [string]$appConfigName
)

[string]$keyVaultId

# Get KV Id
$keyVaultId = (az keyvault show --name $keyVaultName --resource-group $keyVaultRG | ConvertFrom-Json).id

# Get App Config Connection String
$appConfigConnString = (az appconfig credential list --name $appConfigName --resource-group $appConfigRG --query "[?name=='Primary'].connectionString" --output tsv)

# Loop thru secrets in the vault.
$secretList = Get-AzKeyVaultSecret -VaultName $keyVaultName

$secretList | ForEach-Object {
    $secretName = $_.name
    $secretId = $_.id

    Write-Host $secretName

# Add secret to the app config.
    az appconfig kv set-keyvault --key $secretName --secret-identifier $secretId --connection-string $appConfigConnString --name $appConfigName --yes
}

