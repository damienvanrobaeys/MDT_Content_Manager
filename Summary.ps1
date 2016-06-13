param
	(
		[String]$name,
		[String]$comments,		
		[String]$publisher,		
		[String]$version,		
		[String]$language,		
		[String]$foldername,
		[String]$source,				
		[String]$command,		
		[String]$reboot,		
		[String]$hide,		
		[String]$enable	
)


[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.ComponentModel') | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Data')           | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')        | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null

[System.Reflection.Assembly]::LoadWithPartialName('PresentationCore')      | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       | out-null
[System.Reflection.Assembly]::LoadFrom('assembly\System.Windows.Interactivity.dll') | out-null


[System.Threading.Thread]::CurrentThread.CurrentCulture = [System.Globalization.CultureInfo] "en-US"


Add-Type -AssemblyName "System.Windows.Forms"
Add-Type -AssemblyName "System.Drawing"

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml("Summary.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$Appli_Name_Resume = $Form.findname("Appli_Name_Resume") 
$Appli_Comments_Resume = $Form.findname("Appli_Comments_Resume") 
$Appli_Publisher_Resume = $Form.findname("Appli_Publisher_Resume") 
$Appli_Version_Resume = $Form.findname("Appli_Version_Resume") 
$Appli_Language_Resume = $Form.findname("Appli_Language_Resume") 
$Appli_Source_Resume = $Form.findname("Appli_Source_Resume") 
$Appli_Folder_Resume = $Form.findname("Appli_Folder_Resume") 
$Appli_CMD_Resume = $Form.findname("Appli_CMD_Resume") 
$Working_Dir_Resume = $Form.findname("Working_Dir_Resume") 
$Appli_Hide_Resume = $Form.findname("Appli_Hide_Resume") 
$Appli_Enable_Resume = $Form.findname("Appli_Enable_Resume") 
$Applica_Reboot_Resume = $Form.findname("Applica_Reboot_Resume") 


$Appli_Name_Resume.Content = $name
$Appli_Comments_Resume.Content = $comments
$Appli_Publisher_Resume.Content = $publisher
$Appli_Version_Resume.Content = $version
$Appli_Language_Resume.Content = $language
$Appli_Folder_Resume.Content = $foldername
$Appli_CMD_Resume.Content = $command
$Working_Dir_Resume.Content = $command
$Appli_Hide_Resume.Content = $hide
$Appli_Enable_Resume.Content = $enable
$Applica_Reboot_Resume.Content = $reboot
$Appli_Source_Resume.Content = $source


$Form.ShowDialog() | Out-Null
