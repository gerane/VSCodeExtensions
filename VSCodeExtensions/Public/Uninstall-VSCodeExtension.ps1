function Uninstall-VSCodeExtension
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

        switch ($psCmdlet.ParameterSetName)
        {
            'ExtensionName' {
                Write-Verbose -Message "Using ExtensionName"

                if ($WildCard)
                {
                    Write-Verbose -Message "Wildcard Switch is Present"

                    if ($ExtensionName -match '\*')
                    {
                        Write-Verbose -Message "Wildcard `"*`" is Present in ExtensionName"
                        $Extension = $InstalledExtensions | Where-Object { $_.ExtensionName -Like $ExtensionName }
                    }
                    else 
                    {
                        Write-Verbose -Message "No WildCards so add them to beginning and end for ExtensionName search"
                        $Extension = $InstalledExtensions | Where-Object { $_.ExtensionName -like "*$ExtensionName*" }    
                    }
                }
                else 
                {
                    Write-Verbose -Message "Get Extension without WildCards"
                    $Extension = $InstalledExtensions | Where-Object { $_.ExtensionName -eq $ExtensionName }
                }
            }

            'DisplayName' {
                Write-Verbose -Message "Using DisplayName"

                if ($WildCard)
                {
                    Write-Verbose -Message "Wildcard Switch is Present"

                    if ($DisplayName -match '\*')
                    {
                        Write-Verbose -Message "Wildcard `"*`" is Present in DisplayName"
                        $Extension = $InstalledExtensions | Where-Object { $_.DisplayName -like $DisplayName }
                    }
                    else 
                    {
                        Write-Verbose -Message "No WildCards so add them to beginning and end for DisplayName search"
                        $Extension = $InstalledExtensions | Where-Object { $_.DisplayName -like "*$DisplayName*" }    
                    }
                }
                else 
                {
                    Write-Verbose -Message "Get Extension without WildCards"
                    $Extension = $InstalledExtensions | Where-Object { $_.DisplayName -eq $DisplayName }
                }
            }      

            'FullName' {
                Write-Verbose -Message "Using FullName"

                if ($WildCard)
                {
                    Write-Verbose -Message "Wildcard Switch is Present"

                    if ($DisplayName -match '\*')
                    {
                        Write-Verbose -Message "Wildcard `"*`" is Present in FullName"
                        $Extension = $InstalledExtensions | Where-Object { $_.FullName -like $FullName }
                    }
                    else 
                    {
                        Write-Verbose -Message "No WildCards so add them to beginning and end for FullName search"
                        $Extension = $InstalledExtensions | Where-Object { $_.FullName -like "*$FullName*" }    
                    }
                }
                else 
                {
                    Write-Verbose -Message "Get Extension without WildCards"
                    $Extension = $InstalledExtensions | Where-Object { $_.FullName -eq $FullName }
                } 
            }
        }
        
        If ($Extension)
        {
            foreach ($Ext in $Extension)
            {                
                if ($PSCmdlet.ShouldProcess($($Ext.FullName), 'Uninstall Extension'))
                {
                    Write-Verbose -Message "Uninstalling Extension: $($Ext.FullName)"
                    
                    if ($Insiders)
                    {
                        $CommandLine = "/c `"$($VSCodeInstallation.InstallLocation)bin\code-insiders.cmd`" --uninstall-extension $($Ext.FullName)"
                        Start-Process -FilePath "cmd" -ArgumentList $CommandLine -Wait -WindowStyle Hidden
                        Start-Sleep -Seconds 1

                        $InstalledExtensions = Get-VSCodeExtension -Insiders
                    }
                    else
                    {
                        $CommandLine = "/c `"$($VSCodeInstallation.InstallLocation)bin\code.cmd`" --uninstall-extension $($Ext.FullName)"
                        Start-Process -FilePath "cmd" -ArgumentList $CommandLine -Wait -WindowStyle Hidden
                        Start-Sleep -Seconds 1

                        $InstalledExtensions = Get-VSCodeExtension
                    }

                    if ($InstalledExtensions.FullName -notcontains $Ext.FullName)
                    {
                        Write-Verbose "Extension $($Ext.FullName) uninstall complete."
                    }
                    else
                    {
                        Write-Error "Extension $($Ext.FullName) uninstall failed"
                    }
                }
            }
        }
        else
        {
            Write-Warning -Message "No Matching Installed Extensions found"
        }
    }
}