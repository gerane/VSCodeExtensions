function Get-VSCodeExtensionStats
{
    [CmdletBinding(DefaultParameterSetName="ExtensionName")]
    [OutputType([PSCustomObject])]
    param
    (
        [Parameter(ParameterSetName="ExtensionName",Mandatory=$true)]
        [string[]]$ExtensionName,

        [Parameter(ParameterSetName="DisplayName",Mandatory=$true)]
        [string[]]$DisplayName,

        [Parameter(ParameterSetName="FullName",Mandatory=$true)]
        [ValidatePattern('^[^.]+\.[^.]+$')]
        [string[]]$FullName,

        [Parameter(ParameterSetName="ExtensionName",Mandatory=$false)]
        [Parameter(ParameterSetName="DisplayName",Mandatory=$false)]
        [Parameter(ParameterSetName="FullName",Mandatory=$false)]
        [switch]$WildCard
    )
    
    Begin {}
    
    Process
    {
        Update-FormatData -AppendPath $PSScriptRoot\..\ExtensionStats.format.ps1xml

        Try
        {
            $Results = Find-VSCodeExtension @PSBoundParameters
        }
        catch
        {
            throw
        }
        
        if ($Results)
        {
            foreach ($Result in $Results)
            {
                Write-Verbose -Message "Gathering Statistics for $($Result)"

                $ExtensionStats = [PSCustomObject]@{
                    'DisplayName'     = $Result.DisplayName
                    'PublisherName'   = $Result.Publisher.PublisherName
                	'InstallCount'    = ($Result.statistics | Where-Object { $_.statisticName -eq 'Install' }).value
                    'AverageRating'   = ($Result.statistics | Where-Object { $_.statisticName -eq 'averagerating' }).value
                    'ratingcount'     = ($Result.statistics | Where-Object { $_.statisticName -eq 'ratingcount' }).value
                    'trendingdaily'   = ($Result.statistics | Where-Object { $_.statisticName -eq 'trendingdaily' }).value
                    'trendingweekly'  = ($Result.statistics | Where-Object { $_.statisticName -eq 'trendingweekly' }).value
                    'trendingmonthly' = ($Result.statistics | Where-Object { $_.statisticName -eq 'trendingmonthly' }).value
                }

                $ExtensionStats.pstypenames.insert(0,'VSCodeExtensions.ExtensionStats')
                $ExtensionStats                 
            }          
        }
        else 
        {
            Write-Error "No Results were found"    
        }
    }
}
