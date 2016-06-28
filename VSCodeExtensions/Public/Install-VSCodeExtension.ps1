function Install-VSCodeExtension
{
    [CmdletBinding(DefaultParameterSetName="ExtensionName",SupportsShouldProcess=$true)]
    param
    (
        [Parameter(ParameterSetName="ExtensionName",Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$ExtensionName,

        [Parameter(ParameterSetName="DisplayName",Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$DisplayName,

        [Parameter(ParameterSetName="FullName",Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [ValidatePattern('^[^.]+\.[^.]+$')]
        [string[]]$FullName,

        [Parameter(ParameterSetName="ExtensionName",Mandatory=$false)]
        [Parameter(ParameterSetName="DisplayName",Mandatory=$false)]
        [Parameter(ParameterSetName="FullName",Mandatory=$false)]
        [switch]$WildCard,

        [Parameter(ParameterSetName="ExtensionName",Mandatory=$false)]
        [Parameter(ParameterSetName="DisplayName",Mandatory=$false)]
        [Parameter(ParameterSetName="FullName",Mandatory=$false)]
        [switch]$Insiders                    
    )
    
    Begin {}
    
    Process
    {       
        $Null = $PSBoundParameters.Remove('Insiders')
        $Null = $PSBoundParameters.Remove('WhatIf')
        $Null = $PSBoundParameters.Remove('Confirm')

        $Extensions = Find-VSCodeExtension @PSBoundParameters

        if ($Insiders)
        {
            $InstalledExtensions = Get-VSCodeExtension -Insiders
            $VSCodeInstallation = Get-VSCodeInstallation -Insiders                        
        }
        else
        {
            $InstalledExtensions = Get-VSCodeExtension
            $VSCodeInstallation = Get-VSCodeInstallation
            
            if ([version]$VSCodeInstallation.DisplayVersion -lt [version]'1.2.0')
            {
                Throw "VSCode Version 1.2.0 or above is required `nCurrent Version: $($VSCodeInstallation.DisplayVersion)"
            }
        }        

        if ($Extensions)
        {
            foreach ($Extension in $Extensions)
            {
                if ($InstalledExtensions.FullName -contains $Extension.FullName)
                {
                    Write-Verbose -Message "Extension $($Extension.FullName) is already Installed"
                }
                else 
                {
                    Write-Verbose -Message "Installing Extension: $($Extension.FullName)"
                    
                    if ($PSCmdlet.ShouldProcess($($Extension.FullName), 'Install Extension'))
                    {
                        if ($Insiders)
                        {
                            $CommandLine = "/c `"$($VSCodeInstallation.InstallLocation)bin\code-insiders.cmd`" --install-extension $($Extension.FullName)"
                            Start-Process -FilePath "cmd" -ArgumentList $CommandLine -Wait -WindowStyle Hidden
                            Start-Sleep -Seconds 1

                            $InstalledExtensions = Get-VSCodeExtension -Insiders
                        }
                        else
                        {
                            $CommandLine = "/c `"$($VSCodeInstallation.InstallLocation)bin\code.cmd`" --install-extension $($Extension.FullName)"
                            Start-Process -FilePath "cmd" -ArgumentList $CommandLine -Wait -WindowStyle Hidden
                            Start-Sleep -Seconds 1

                            $InstalledExtensions = Get-VSCodeExtension
                        }

                        if ($InstalledExtensions.FullName -contains $Extension.FullName)
                        {
                            Write-Verbose "Extension $($Extension.FullName) install complete. Restart VS code if open."
                        }
                        else
                        {
                            Write-Error "Extension $($Extension.FullName) install failed"
                        }
                        
                    }                                    
                }
            }
        }
        else
        {
            Write-Warning -Message "Could not find Extension"
        }
    }
}
