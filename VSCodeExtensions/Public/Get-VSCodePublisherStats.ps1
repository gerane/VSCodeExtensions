function Get-VSCodePublisherStats
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]$PublisherName
    )
    
    Begin
    {
        $Results = Invoke-RestMethod -Method Get -Uri 'https://vscode.blob.core.windows.net/gallery/index'
    }
    
    Process
    {
        $Installs = $null
        Update-FormatData -AppendPath $PSScriptRoot\..\PublisherStats.format.ps1xml

        $Exts = $Results.results.extensions | where { $_.Publisher.PublisherName -eq $PublisherName }

        if ($Exts)
        {                                
            foreach ($Ext in $Exts)
            {
                $Count = ($Ext.statistics | Where-Object { $_.statisticName -eq 'Install' }).value
                $Installs = $Installs + $Count                
            }                        
            $PublisherID = $Exts.Publisher.PublisherID | Select-Object -Unique            
            $MostDownloads = $Exts.displayName[0]            
            $MostDownloadsCount = $Exts.statistics | Where-Object { $_.statisticName -eq 'Install' } | Select-Object -ExpandProperty value -First 1
            
            Write-Verbose -Message "PublisherName: $($PublisherName)"
            Write-Verbose -Message "PublisherID: $($PublisherID)"
            Write-Verbose -Message "Most Downloads: $($MostDownloads)"
            Write-Verbose -Message "Most Downloads Count: $($MostDownloadsCount)"
            Write-Verbose -Message "Total Installs: $($Installs)"

            $PublisherStats = [PSCustomObject]@{
                'PublisherName' = $PublisherName
                'PublisherID' = $PublisherID
                'TotalInstalls' = $Installs
                'ExtensionCount' = $Exts.count
                'MostDownloads' = $MostDownloads
                'MostDownloadsCount' = $MostDownloadsCount
            }

            $PublisherStats.pstypenames.insert(0,'VSCodeExtensions.PublisherStats')
        }
        else 
        {
            Write-Error "There were no Results for $($PublisherName)"
        }        
        $PublisherStats
    }
}

