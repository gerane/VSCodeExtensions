Function Expand-VSCodeVsix
{
    [CmdletBinding()]
    param
    (
        [Parameter(ParameterSetName="Name",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string[]]$FullName,

        [Parameter(ParameterSetName="Name",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=1)]
        [string[]]$Version,

        [Parameter(ParameterSetName="Path",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string]$Source,

        [Parameter(ParameterSetName="Path",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=1)]
        [string]$Destination
    )

    Process
    {
        if (($psCmdlet.ParameterSetName) -eq 'Name')
        {
            $ExtensionFolder = "$($Fullname)-$($version)"
            $Source = "$Env:TEMP\$ExtensionFolder.zip"
            $Destination = "$Env:TEMP\$ExtensionFolder"
        }
        
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