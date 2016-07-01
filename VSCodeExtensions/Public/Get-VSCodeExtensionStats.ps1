# .ExternalHelp VSCodeExtensions-Help.xml
function Get-VSCodeExtensionStats
{
    [CmdletBinding(DefaultParameterSetName="ExtensionName")]
    [OutputType([PSCustomObject])]
    param
    (
        [Parameter(ParameterSetName="ExtensionName",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string[]]$ExtensionName,

        [Parameter(ParameterSetName="DisplayName",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [string[]]$DisplayName,

        [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName=$true,Position=1)]
        [string[]]$PublisherName,

        [Parameter(Mandatory=$false)]
        [ValidateSet('Languages','Snippets','Linters','Debuggers','Other','Themes','Productivity')]
        [string[]]$Category,

        [Parameter(Mandatory=$false)]
        [string[]]$Tag 
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
