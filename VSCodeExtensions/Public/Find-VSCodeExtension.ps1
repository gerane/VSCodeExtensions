# .ExternalHelp VSCodeExtensions-Help.xml
function Find-VSCodeExtension
{
    [CmdletBinding(DefaultParameterSetName="ExtensionName")]
    [OutputType([PSCustomObject])]
    param
    (
        [Parameter(ParameterSetName="ExtensionName",Mandatory=$true,ValueFromPipelineByPropertyName=$true,Position=0)]
        [SupportsWildcards()]
        [PSDefaultValue(Help='*')]
        [string[]]$ExtensionName = '*',

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
    
    Begin
    {
        $Results = Invoke-RestMethod -Method Get -Uri 'https://vscode.blob.core.windows.net/gallery/index'
    }
    
    Process
    {
        $Name = $psCmdlet.MyInvocation.BoundParameters["$($psCmdlet.ParameterSetName)"]

        Write-Verbose -Message "Finding: $($Name)"

        switch ($psCmdlet.ParameterSetName)
        {
            'ExtensionName'
            {
                $Extensions = $Results.results.extensions | Where-Object { $_.ExtensionName -like $ExtensionName }
            }

            'DisplayName'
            {
                $Extensions = $Results.results.extensions | Where-Object { $_.DisplayName -like $DisplayName }
            }
        }

        if ($PublisherName)
        {
            $PubExts = @()
            foreach ($Item in $PublisherName)
            {
                 $PubExts += $Extensions | Where-Object { $_.Publisher.PublisherName -like $item }
            }
            $Extensions = $PubExts | Sort-Object -Property ExtensionName -Unique
        }

        if ($Category)
        {
            $CatExts = @()
            foreach ($Item in $Category)
            {
                 $CatExts += $Extensions | Where-Object { $_.categories -contains $item }
            }
            $Extensions = $CatExts | Sort-Object -Property ExtensionName -Unique            
        }

        if ($Tag)
        {
            $TagExts = @()
            foreach ($Item in $Tag)
            {
                 $TagExts += $Extensions | Where-Object { $_.tags -like $item }
            }
            $Extensions = $TagExts | Sort-Object -Property ExtensionName -Unique 
        }
       
        if ($Extensions)
        {
            foreach ($Extension in $Extensions)            
            {
                $Extension | Add-Member -MemberType NoteProperty -Name Installs -Value (($Extension.statistics | Where-Object { $_.statisticName -eq 'Install' }).value)
                $Extension | Add-Member -MemberType NoteProperty -Name publisherName -Value $Extension.publisher.publisherName
                $Extension | Add-Member -MemberType NoteProperty -Name FullName -Value ($Extension.publisher.publisherName + '.' + $Extension.ExtensionName)
                $Extension | Add-Member -MemberType NoteProperty -Name Version -Value $Extension.Versions[0].version
                $Extension | Add-Member -MemberType NoteProperty -Name assetUri -Value $Extension.versions[0].assetUri
                $Extension
            }
        }
        else
        {
            Write-Warning "Could not find Extension like $($Name)"
        }
    }
}