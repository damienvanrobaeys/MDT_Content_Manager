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
$XamlMainWindow=LoadXml("About.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$Website = $Form.findname("Website") 
$Facebook = $Form.findname("Facebook") 
$Mail = $Form.findname("Mail") 

$Author_Mail = "damien.vanrobaeys@gmail.com"
$Author_Website = "http://www.systanddeploy.com"
$Author_Facebook = "https://www.facebook.com/systanddeploy"

$Website.Add_Click({	
	[System.Diagnostics.Process]::Start("$Author_Website")
})	

$Facebook.Add_Click({	
	[System.Diagnostics.Process]::Start("$Author_Facebook")
})	

$Mail.Add_Click({	
	[System.Diagnostics.Process]::Start("mailto:$Author_Mail")
})	



$Form.ShowDialog() | Out-Null
