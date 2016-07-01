# .ExternalHelp VSCodeExtensions-Help.xml
function Uninstall-VSCodeExtension
{
    [CmdletBinding(DefaultParameterSetName="ExtensionName",SupportsShouldProcess=$true)]
    param
    (
        [Parameter(ParameterSetName="ExtensionName",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string[]]$ExtensionName,

        [Parameter(ParameterSetName="DisplayName",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string[]]$DisplayName,

        [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName=$true,Position=1)]
        [string[]]$PublisherName,

        [switch]$Insiders                    
    )
    
    Begin {}
    
    Process
    {
        $InstalledExtensions = Get-VSCodeExtension $Insiders      
        $Name = $psCmdlet.MyInvocation.BoundParameters["$($psCmdlet.ParameterSetName)"]

        Write-Verbose -Message "Uninstalling: $($Name)"

        switch ($psCmdlet.ParameterSetName)
        {
            'ExtensionName' 
            {                
                $Extensions = $InstalledExtensions | Where-Object { $_.ExtensionName -Like $ExtensionName }
            }

            'DisplayName' 
            {
                $Extensions = $InstalledExtensions | Where-Object { $_.DisplayName -like $DisplayName }
            }      
        }

        if ($PublisherName)
        {
            $PubExts = @()
            foreach ($Item in $PublisherName)
            {
                 $PubExts += $Extensions | Where-Object { $_.PublisherName -like $item }
            }
            $Extensions = $PubExts | Sort-Object -Property ExtensionName -Unique
        }
        
        If ($Extensions)
        {
            foreach ($Extension in $Extensions)
            {                
                if ($PSCmdlet.ShouldProcess($($Extension.ExtensionName), 'Uninstall Extension'))
                {
                    Write-Verbose -Message "Uninstalling Extension: $($Extension.ExtensionName)"

                    Try
                    {
                        Write-Debug -Message "Removing Directory $($Extension.ExtensionPath)"
                        Remove-Item -Path $Extension.ExtensionPath -Recurse -Force

                        $InstalledExtensions = Get-VSCodeExtension $Insiders
                    }
                    Catch
                    {
                        Throw
                    }

                    if ($InstalledExtensions.ExtensionPath -notcontains $Extension.ExtensionPath)
                    {
                        Write-Verbose "Extension $($Extension.ExtensionName) uninstall complete."
                    }
                    else
                    {
                        Write-Error "Extension $($Extension.ExtensionName) uninstall failed"
                    }
                }
            }
        }
        else
        {
            Write-Warning -Message "No Matching Installed Extensions found for $($Name)"
        }
    }
}