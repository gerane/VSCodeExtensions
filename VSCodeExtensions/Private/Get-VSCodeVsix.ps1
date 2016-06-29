Function Get-VSCodeVsix
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [PSCustomObject]$Extension
    )

    Process
    {
        $VsixUri = $Extension.versions[0].assetUri + "/Microsoft.VisualStudio.Services.VSIXPackage?install=true"
        $ExtensionFolder = $Extension.Fullname + '-' + $Extension.versions[0].version
        Invoke-RestMethod -Method Get -Uri $VsixUri -ErrorVariable CodeError -OutFile "$Env:TEMP\$ExtensionFolder.zip" -ErrorAction SilentlyContinue
                                    
        if ($CodeError)
        {
            $JsonError = $CodeError.Message | ConvertFrom-Json
            $HttpResponse = $CodeError.ErrorRecord.Exception.Response
            Throw "Error: $($JsonError.error) `nDescription: $($JsonError.error_description) `nErrorCode: $($JsonError.error_code) `nHttp Status Code: $($HttpResponse.StatusCode.value__) `nHttp Description: $($HttpResponse.StatusDescription)"
        }
    }
}