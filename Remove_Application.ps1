Param
	(
		[Parameter(Mandatory=$true)]
		[String]$name			
	)
		
$module = "C:\Program Files\Microsoft Deployment Toolkit\bin\MicrosoftDeploymentToolkit.psd1"
$deploymentshare = "C:\DeploymentShare"	
Import-Module $module	
$PSDrive_Test = get-psdrive
If ($PSDrive_Test -eq "DSAppManager")
	{
		Remove-PSDrive -Name "DSAppManager"		
		New-PSDrive -Name "DSAppManager" -PSProvider MDTProvider -Root $deploymentshare								
	}
Else
	{
		New-PSDrive -Name "DSAppManager" -PSProvider MDTProvider -Root $deploymentshare		
	}			
			
remove-item -path "DSAppManager:\Applications\$name" -force -verbose		

		