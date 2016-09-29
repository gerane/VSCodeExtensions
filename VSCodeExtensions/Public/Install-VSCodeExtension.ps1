# .ExternalHelp VSCodeExtensions-Help.xml
function Install-VSCodeExtension
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

        [ValidateSet('Languages','Snippets','Linters','Debuggers','Other','Themes','Productivity')]
        [string[]]$Category,

        [string[]]$Tag,

        [switch]$Insiders                    
    )
    
    Begin {}
    
    Process
    {       
        $Null = $PSBoundParameters.Remove('Insiders')
        $Null = $PSBoundParameters.Remove('WhatIf')
        $Null = $PSBoundParameters.Remove('Confirm')

        $Extensions = Find-VSCodeExtension @PSBoundParameters
        $InstalledExtensions = Get-VSCodeExtension -Insiders:$Insiders
        $ExtensionGroups = $InstalledExtensions | Group-Object -Property 'FullName'      

        if ($Extensions)
        {
            foreach ($Extension in $Extensions)
            {
                $InstalledVersion = $ExtensionGroups | Where-Object { $_.Name -eq $Extension.FullName } | Select-Object -ExpandProperty Group | Sort-Object -Descending -Property Version | Select-Object -First 1 

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
                            $Extension | Get-VSCodeVsix

                            Write-Debug -Message "Expanding the VSIX Archive"
                            $Extension | Expand-VSCodeVsix 

                            Write-Debug -Message "Installing the VSIX to Extension Directory"
                            $Extension | Install-VSCodeVsix -Insiders:$Insiders

                            Write-Debug -Message "Adding Metadata to the package.json"
                            $Extension | Add-VSCodeMetadata -Insiders:$Insiders

                            Write-Debug -Message "Gathering Installed Extensions"
                            $InstalledExtensions = Get-VSCodeExtension -Insiders:$Insiders
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