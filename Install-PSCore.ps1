function Install-PSCore {

[cmdletbinding()]

param(

[Parameter(Mandatory=$True)]
[String]$ComputerName

)

$outfile = 'C:\users\aolynyk\Desktop\PowerShell-6.0.2-win-x64.msi'
$filepath = 'C:\users\aolynyk\Desktop\PowerShell-6.0.2-win-x64.msi'
$uri = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/PowerShell-6.0.2-win-x64.msi'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri $uri -UseBasicParsing -OutFile $outfile
Start-Process -Wait -ArgumentList "/passive","/norestart", "/L*V c:\log\log.txt " -FilePath $filepath

}
; Install-PSCore