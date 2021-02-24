<#
ScriptName: Recording Server Service Checker - .txt Reports
Purpose:    Provide .txt reports of servers in environment either currently running Recording Server service, or requiring restart of it
Author:     James Anderson, Escalation Engineer, Salient Systems
Date:       23Feb2021
Version:    1.2
Comments:   In production

Version History:
 -  :    (02Dec2020)  1.0 Initial BETA
 -  :    (02Dec2020)  1.1 Added minor build since one is the lonliest number
 -  :    (10Dec2020)  1.2 Added "Please navigate..." instructions as in-console message to remind user where reports may be found
#>
cls
Write-Host ""
$names = Read-Host 'What is the file path for your list of servers?'
# This will ask the end user for a file path to a .txt file with a list of server hostnames, one per line
# Example would be C:\workstation_names.txt <<< no quotes of any kind; recommended file name with no spaces
Write-Host ""

ForEach ($name in $names) {
	$ServiceName = 'CompleteView 2020 Recording Server'
	$status = Invoke-Command { Get-Service -Name 'CompleteView 2020 Recording Server' } -ComputerName $name
	$start = Invoke-Command { Start-Service -Name 'CompleteView 2020 Recording Server' } -ComputerName $name
	$rsService = Get-Service -ComputerName $name -Name 'CompleteView 2020 Recording Server'

	if ($status.Status -eq 'Running') {
			Write-Output "$name" |
			Out-File -append "C:\Recording Servers Up $(get-date -f "yyyy MM dd HH.mm.ss").txt"
			# Every server that returns a confirmation that the CompleteView 2020 Recording Server Service is in the Running state will be appended to the file here
	    } else {
	        $start
	        #$rsService.Refresh()
			Write-Output "$name" |
			Out-File -append "C:\Recording Servers Down $(get-date -f "yyyy MM dd HH.mm.ss").txt"
			# Every server that returns a confirmation that the CompleteView 2020 Recording Server Service needed to be started will be appended to the file here
	        }
	    }
cls
Write-Host ""
Write-Host "# # # # # # # # # # # # # # # # # # # # # #"
Write-Host ""
Write-Host "Script completed!"
Write-Host ""
Write-Host "Please navigate to C:\ (or the directory you may have changed it to) to view your Recording Servers Up and Down reports"
# You may change the Out-File directory (and subsequently this line) to whatever you'd like
Write-Host ""
Pause