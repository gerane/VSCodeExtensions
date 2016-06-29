Function Expand-VSCodeVsix
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [PSCustomObject]$Extension
    )

    Process
    {
        $ExtensionFolder = $Extension.Fullname + '-' + $Extension.versions[0].version
        $Source = "$Env:TEMP\$ExtensionFolder.zip"
        $Destination = "$Env:TEMP\$ExtensionFolder"
        
        if (Test-Path -Path $Destination)
        {
            Remove-Item -Path $Destination -Recurse -Force -ErrorAction SilentlyContinue
	    }

        Try
        {
            Add-Type -assembly system.io.compression.filesystem
            [io.compression.zipfile]::ExtractToDirectory($Source, $Destination)
        }
        catch
        {
            Throw "failed to unzip Vsix"
        }
    }
}