Function Install-VSCodeVsix
{
    [CmdletBinding()]
    param
    (        
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string[]]$FullName,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=1)]
        [string[]]$Version,

        [Parameter(Position=2)]
        [switch]$Insiders
    )

    Process
    {
        $ExtensionFolder = "$($Fullname)-$($version)"
        $Destination = Join-Path -Path (Get-VSCodeExtensionFolder -Insiders:$Insiders) -ChildPath $ExtensionFolder
        
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