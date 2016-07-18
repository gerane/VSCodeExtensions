Function Get-VSCodeVsix
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$FullName,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$Version,

        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$assetUri
    )

    Process
    {
        $VsixUri = "$($assetUri)/Microsoft.VisualStudio.Services.VSIXPackage?install=true"
        $ExtensionFolder = "$($Fullname)-$($version)"
        Invoke-RestMethod -Method Get -Uri $VsixUri -ErrorVariable CodeError -OutFile "$Env:TEMP\$ExtensionFolder.zip" -ErrorAction SilentlyContinue
                                    
        if ($CodeError)
        {
            $JsonError = $CodeError.Message | ConvertFrom-Json
            $HttpResponse = $CodeError.ErrorRecord.Exception.Response
            Throw "Error: $($JsonError.error) `nDescription: $($JsonError.error_description) `nErrorCode: $($JsonError.error_code) `nHttp Status Code: $($HttpResponse.StatusCode.value__) `nHttp Description: $($HttpResponse.StatusDescription)"
        }
    }
}