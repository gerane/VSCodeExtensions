# .ExternalHelp VSCodeExtensions-Help.xml
function Update-VSCodeExtension
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param
    (
        [switch]$Insiders                    
    )
    
    Begin {}
    
    Process
    {       
        $InstalledExtensions = Get-VSCodeExtension -Insiders:$Insiders
        $GalleryExtensions = Find-VSCodeExtension -ExtensionName '*'
        $ExtensionGroups = $InstalledExtensions | Group-Object -Property 'FullName'

        foreach ($Group in $ExtensionGroups)
        {
            if ($Group.Count -gt '1')
            {
                Write-Debug -Message "Filtering out old Versions"
                $Extension = ($Group.Group | Sort-Object -Descending -Property Version)[0]
            }
            else
            {
                $Extension = $Group.Group
            }
            
            $LatestVersion = $GalleryExtensions | Where-Object { $_.FullName -eq $Extension.FullName }

            if ($LatestVersion)
            {
                If ([Version]$Extension.Version -lt [Version]$LatestVersion.Version)
                {
                    Write-Verbose -Message "Extension $($Extension.FullName) with Version $($Extension.Version) needs to be updated"
                    Write-Verbose -Message "New Version $($LatestVersion.Version) available."

                    if ($PSCmdlet.ShouldProcess($($Extension.FullName), 'Update Extension'))
                    {
                        Try
                        {
                            Write-Verbose -Message "Installing Extension Update $($Extension.FullName)"
                            Install-VSCodeExtension -ExtensionName $Extension.ExtensionName -PublisherName $Extension.PublisherName -Insiders:$Insiders
                        }
                        catch
                        {
                            Throw
                        }
                    }
                }
                else
                {
                    Write-Verbose -Message "No Updates available for Extension $($Extension.FullName)"
                }
            }
            else
            {
                Write-Warning -Message "Extension $($Extension.FullName) was not found in the Gallery"
            }
        }            
    }
}