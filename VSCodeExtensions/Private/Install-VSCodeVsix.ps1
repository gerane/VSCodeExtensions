Function Install-VSCodeVsix
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true,Position=0)]
        [PSCustomObject]$Extension,

        [Parameter(Position=1)]
        [switch]$Insiders
    )

    Process
    {
        $ExtensionFolder = $Extension.Fullname + '-' + $Extension.versions[0].version
        $Destination = Join-Path -Path (Get-VSCodeExtensionFolder $Insiders) -ChildPath $ExtensionFolder
        
        Try
        {
            Copy-Item -Path "$env:TEMP\$ExtensionFolder\Extension" -Destination $Destination -Recurse -Force
        }
        catch
        {
            Throw "Failed to Copy Extension Folder"
        }

        Try
        {
            Copy-Item -Path "$env:TEMP\$ExtensionFolder\extension.vsixmanifest" -Destination "$Destination\.vsixmanifest" -Force
        }
        catch
        {
            Throw "Failed to Copy Manifest"
        }
    }
}