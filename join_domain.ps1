 param (
    [Parameter(Mandatory=$true)][string]$domain,
    [Parameter(Mandatory=$true)][string]$oupath,
    [Parameter(Mandatory=$true)][string]$credential_username,
    [Parameter(Mandatory=$true)][string]$credential_password
 )

# Set DNS Servers
Set-DnsClientServerAddress -InterfaceAlias "RC-FW-*" -ServerAddresses ("172.30.1.7","172.30.1.8")

# Create credentials
$secpasswd = ConvertTo-SecureString "$credential_password" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$credential_username", $secpasswd)

# Add to domain
Add-Computer -DomainName $domain -OUPath "$oupath" -Credential $credential -Restart