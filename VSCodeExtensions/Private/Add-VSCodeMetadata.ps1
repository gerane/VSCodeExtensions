Function Add-VSCodeMetadata
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true,Position=0)]
        [PSCustomObject]$Extension,

        [Parameter(Position=1)]
        [switch]$Insiders
    )

    Process
    {
        Try
        {            
            $ExtensionFolder = "$($Extension.Fullname)-$($Extension.version)"
            $ExtensionPath = Join-Path -Path (Get-VSCodeExtensionFolder -Insiders:$Insiders) -ChildPath $ExtensionFolder
            $Packagejson = Get-ChildItem -Path "$ExtensionPath\package.json"

            $ExtensionId = $Extension.extensionid
            $PublisherId = $Extension.publisher.publisherId
            $PublisherName = $Extension.publisherName

            $Metadata = @"
{
    "__metadata": {
		"id": "$ExtensionId",
		"publisherId": "$PublisherId",
		"publisherDisplayName": "$PublisherName"
	},
"@

            $Content = [IO.File]::ReadAllText($Packagejson) -replace '^{',$Metadata
            [IO.File]::WriteAllText($Packagejson, $Content)
        }
        catch
        {
            Throw
        }
    }
}