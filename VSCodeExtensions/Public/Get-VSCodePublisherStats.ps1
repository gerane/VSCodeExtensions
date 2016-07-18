# .ExternalHelp VSCodeExtensions-Help.xml
function Get-VSCodePublisherStats
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
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
        Update-FormatData -AppendPath $PSScriptRoot\..\Formats\PublisherStats.format.ps1xml

        $Extensions = $Results.results.extensions | Where-Object { $_.Publisher.PublisherName -like $PublisherName }

        if ($Extensions)
        {     
            Write-Verbose -Message "Collecting Publisher Statistics"    

            foreach ($Extension in $Extensions)
            {
                $Count = ($Extension.statistics | Where-Object { $_.statisticName -eq 'Install' }).value
                $Installs = $Installs + $Count                
            }                        
            $PublisherID = $Extensions.Publisher.PublisherID | Select-Object -Unique            
            $MostDownloads = $Extensions.displayName[0]            
            $MostDownloadsCount = $Extensions.statistics | Where-Object { $_.statisticName -eq 'Install' } | Select-Object -ExpandProperty value -First 1
            
            Write-Verbose -Message "PublisherName: $($PublisherName)"
            Write-Verbose -Message "PublisherID: $($PublisherID)"
            Write-Verbose -Message "Most Downloads: $($MostDownloads)"
            Write-Verbose -Message "Most Downloads Count: $($MostDownloadsCount)"
            Write-Verbose -Message "Total Installs: $($Installs)"

            $PublisherStats = [PSCustomObject]@{
                'PublisherName' = $PublisherName
                'PublisherID' = $PublisherID
                'TotalInstalls' = $Installs
                'ExtensionCount' = $Extensions.count
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

