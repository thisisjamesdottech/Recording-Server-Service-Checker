<#
ScriptName: Recording Server Service Checker - Console Report
Purpose:    Provide console report of servers in environment running Recording Server service, and those requiring a restart of it
Author:     James Anderson, Escalation Engineer, Salient Systems
Date:       23Feb2021
Version:    1.2
Comments:   In production

Version History:
 -  :    (02Dec2020)  1.0 Initial BETA
 -  :    (02Dec2020)  1.1 Added minor build since one is the lonliest number
 -  :    (10Dec2020)  1.2 Added "End of Console Report" note with ###'s to create visual end for user
#>

cls
Write-Host ""
$names = Read-Host 'What is the file path for your list of servers?'
# This will ask the end user for a file path to a .txt file with a list of server hostnames, one per line
# Example would be C:\workstation_names.txt <<< no quotes of any kind; recommended file name with no spaces
Write-Host ""
cls

ForEach ($name in $names) {
	$ServiceName = 'CompleteView 2020 Recording Server'
	$status = Invoke-Command { Get-Service -Name 'CompleteView 2020 Recording Server' } -ComputerName $name
	$start = Invoke-Command { Start-Service -Name 'CompleteView 2020 Recording Server' } -ComputerName $name
	$rsService = Get-Service -ComputerName $name -Name 'CompleteView 2020 Recording Server'

	if ($status.Status -eq 'Running') {
	        Write-Host "The $ServiceName service is already in a Running state for $name"
    } else {
        $start
        #$rsService.Refresh()
		Write-Host "The $ServiceName service has been restarted for $name"
    }
}
Write-Host ""
Write-Host "# # # # # # # # # # # # # # # # # # # # # #"
Write-Host ""
Write-Host "End of Console Report"
Write-Host ""
Pause