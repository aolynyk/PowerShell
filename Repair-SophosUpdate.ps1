#RUN AS ADMIN
function Repair-SophosUpdate {

    [cmdletbinding()]

    Param(

         [Parameter(Mandatory=$True)]
         [string]$computername
    )
    $Services = Get-Service -Name 'Sopho*'

    ForEach ($Service in $Services) {

        If (($Service.Name -like 'Sopho*') -and ($Service.Status -eq 'running')) {

            Restart-Service -Name $Service.Name -PassThru -Verbose -Force
         }
        Else
         {
            Start-Service -Name $Service -PassThru -Verbose
        }
    }

} ; Repair-SophosUpdate -Verbose