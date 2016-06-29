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
        [Version]$Version,

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
        $InstalledExtensions = Get-VSCodeExtension $Insiders
        $ExtensionGroups = $InstalledExtensions | Group-Object -Property 'FullName'      

        if ($Extensions)
        {
            foreach ($Extension in $Extensions)
            {
                $InstalledVersion = $ExtensionGroups | Where-Object { $_.Name -eq $Extension.Name } | Select-Object -ExpandProperty Group | Sort-Object -Descending -Property Version | Select-Object -First 1 

                if ($InstalledExtensions.FullName -contains $Extension.FullName -AND $InstalledVersion.Version -ge $Extension.Version )
                {
                    Write-Verbose -Message "Extension $($Extension.FullName) is already Installed"
                }
                else 
                {
                    Write-Verbose -Message "Installing Extension: $($Extension.FullName)"
                    
                    if ($PSCmdlet.ShouldProcess($($Extension.FullName), 'Install Extension'))
                    {
                        Try
                        {
                            Write-Debug -Message "Downloading the VSIX Package"                                
                            Get-VSCodeVsix -Extension $Extension

                            Write-Debug -Message "Expanding the VSIX Archive"
                            Expand-VSCodeVsix -Extension $Extension 

                            Write-Debug -Message "Installing the VSIX to Extension Directory"
                            Install-VSCodeVsix -Extension $Extension $Insiders

                            Write-Debug -Message "Gathering Installed Extensions"
                            $InstalledExtensions = Get-VSCodeExtension $Insiders
                        }                          
                        catch
                        {
                            Throw
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