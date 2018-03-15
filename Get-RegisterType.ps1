function Get-RegisterType {

     [cmdletbinding()]

     Param(

     [Parameter(Mandatory=$True)]
     [ValidateNotNullOrEmpty()]
     [string]$computername=$env:COMPUTERNAME

     )

     if (Test-Connection -ComputerName $computername -Quiet -Count 1) {

     Write-Host "$computername is online" -ForegroundColor Green -BackgroundColor Black
          
     $cs = Get-WmiObject -Class win32_ComputerSystem -ComputerName $computername 
     $bios = Get-WmiObject -Class win32_Bios -ComputerName $computername 
     $props = @{Computername = $computername
                Model = $cs.model
                Name = $cs.name
                SerialNumber = $bios.serialnumber}
     New-Object -Type PSObject -Prop $props
     }
     }

; Get-RegisterType