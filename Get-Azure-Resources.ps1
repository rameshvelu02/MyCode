param(
	[string]$AppID,
	[string]$AppKey,
	[string]$TenantID,
	[string]$SubscriptionID
)

# Login with Users Credentail
Connect-AzAccount

# Login with Service AzAccount
$SecureAppKey = (ConvertTo-SecureString -String $AppKey -AsPlainText -Force)
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AppID, $SecureAppKey
Connect-AzAccount -ServicePrincipal -Tenant $TenantID -Credential $Credential 

Set-AzContext -Subscription $SubscriptionID

# Get all resources in Particular ResourceGroup
Get-AzResource -ResourceGroupName TestRsg