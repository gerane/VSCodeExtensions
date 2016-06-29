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
        
        $InstalledExtensions = Get-VSCodeExtension $Insiders      

        switch ($psCmdlet.ParameterSetName)
        {
            'ExtensionName' {
                $Name = $ExtensionName
                Write-Verbose -Message "Using ExtensionName $($Name)"

                if ($WildCard)
                {
                    Write-Debug -Message "Wildcard Switch is Present"

                    if ($ExtensionName -match '\*')
                    {
                        Write-Debug -Message "Wildcard `"*`" is Present in ExtensionName"
                        $Extension = $InstalledExtensions | Where-Object { $_.ExtensionName -Like $ExtensionName }
                    }
                    else 
                    {
                        Write-Debug -Message "No WildCards so add them to beginning and end for ExtensionName search"
                        $Extension = $InstalledExtensions | Where-Object { $_.ExtensionName -like "*$ExtensionName*" }    
                    }
                }
                else 
                {
                    Write-Debug -Message "Get Extension without WildCards"
                    $Extension = $InstalledExtensions | Where-Object { $_.ExtensionName -eq $ExtensionName }
                }
            }

            'DisplayName' {
                $Name = $DisplayName
                Write-Verbose -Message "Using DisplayName $($Name)"

                if ($WildCard)
                {
                    Write-Debug -Message "Wildcard Switch is Present"

                    if ($DisplayName -match '\*')
                    {
                        Write-Debug -Message "Wildcard `"*`" is Present in DisplayName"
                        $Extension = $InstalledExtensions | Where-Object { $_.DisplayName -like $DisplayName }
                    }
                    else 
                    {
                        Write-Debug -Message "No WildCards so add them to beginning and end for DisplayName search"
                        $Extension = $InstalledExtensions | Where-Object { $_.DisplayName -like "*$DisplayName*" }    
                    }
                }
                else 
                {
                    Write-Debug -Message "Get Extension without WildCards"
                    $Extension = $InstalledExtensions | Where-Object { $_.DisplayName -eq $DisplayName }
                }
            }      

            'FullName' {
                $Name = $FullName
                Write-Verbose -Message "Using FullName $($Name)"

                if ($WildCard)
                {
                    Write-Debug -Message "Wildcard Switch is Present"

                    if ($DisplayName -match '\*')
                    {
                        Write-Debug -Message "Wildcard `"*`" is Present in FullName"
                        $Extension = $InstalledExtensions | Where-Object { $_.FullName -like $FullName }
                    }
                    else 
                    {
                        Write-Debug -Message "No WildCards so add them to beginning and end for FullName search"
                        $Extension = $InstalledExtensions | Where-Object { $_.FullName -like "*$FullName*" }    
                    }
                }
                else 
                {
                    Write-Debug -Message "Get Extension without WildCards"
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

                    Try
                    {
                        Write-Debug -Message "Removing Directory $($Ext.ExtensionPath)"
                        Remove-Item -Path $Ext.ExtensionPath -Recurse -Force

                        $InstalledExtensions = Get-VSCodeExtension $Insiders
                    }
                    Catch
                    {
                        Throw
                    }

                    if ($InstalledExtensions.ExtensionPath -notcontains $Ext.ExtensionPath)
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
            Write-Warning -Message "No Matching Installed Extensions found for $($Name)"
        }
    }
}