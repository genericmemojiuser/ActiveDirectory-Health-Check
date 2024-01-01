## Confirm AD module is enabled after RSAT is installed.
appwiz.cpl

# Ensure that the AD module is available
Get-Module -Name ActiveDirectory -ListAvailable

# Check out commands inside of the module
Get-Command -Module ActiveDirectory

# Read a user account
Get-AdUser -Filter "samaccountname -eq 'Administrator'"

# Read a computer account
Get-ADComputer -Filter "Name -eq 'DC'"

# Read a group
Get-ADGroup -Filter "Name -eq 'Domain Admins'"

# endregion

## How the AD module displays attributes
Get-AdUser -Filter "samaccountname -eq 'Administrator'"

# Notice only a few user attributes even though Select-Objects * should show them all
Get-AdUser -Filter "samaccountname -eq 'Administrator'" | Select-Object *

# Must use the property parameter. This cmdlet is unique to the AD module
Get-AdUser -Filter "samaccountname -eq 'Administrator'" -Property * 

# region AD attributes do not match up 1:1 with AD module output
# Old-school way of pulling information from AD with ADSI
$searcher = [adsisearcher]"(&(objectClass=user)(objectCategory=person)(samAccountName=administrator))"
$realAttribs = $searcher.FindAll() | Select-Object -ExpandProperty Properties
$realAttribs

## The AD module makes LDAP attributes "friendlier"
$adModuleUser = Get-AdUser -Filter "samaccountname -eq 'Administrator'" -Property *
$adModuleUser

$realAttribs.lastLogon
$adModuleUser.lastLogonDate

#endregion