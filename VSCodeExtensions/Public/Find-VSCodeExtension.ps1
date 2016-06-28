function Find-VSCodeExtension
{
    [CmdletBinding(DefaultParameterSetName="ExtensionName")]
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
    
    Begin
    {
        $Results = Invoke-RestMethod -Method Get -Uri 'https://vscode.blob.core.windows.net/gallery/index'
    }
    
    Process
    {        
        switch ($psCmdlet.ParameterSetName)
        {
            'ExtensionName' {
                Write-Verbose -Message "Using ExtensionName"

                if ($WildCard)
                {
                    Write-Verbose -Message "Wildcard Switch is Present"

                    if ($ExtensionName -match '\*')
                    {
                        Write-Verbose -Message "Wildcard `"*`" is Present in ExtensionName"
                        $Extension = $Results.results.extensions | Where-Object { $_.ExtensionName -like $ExtensionName }
                    }
                    else 
                    {
                        Write-Verbose -Message "No WildCards so add them to beginning and end for ExtensionName search"
                        $Extension = $Results.results.extensions | Where-Object { $_.ExtensionName -like "*$ExtensionName*" }    
                    }
                }
                else 
                {
                    Write-Verbose -Message "Get Extension without WildCards"
                    $Extension = $Results.results.extensions | Where-Object { $_.ExtensionName -eq $ExtensionName }
                }
            }

            'DisplayName' {
                Write-Verbose -Message "Using DisplayName"

                if ($WildCard)
                {
                    Write-Verbose -Message "Wildcard Switch is Present"

                    if ($DisplayName -match '\*')
                    {
                        Write-Verbose -Message "Wildcard `"*`" is Present in DisplayName"
                        $Extension = $Results.results.extensions | Where-Object { $_.DisplayName -like $DisplayName }
                    }
                    else 
                    {
                        Write-Verbose -Message "No WildCards so add them to beginning and end for DisplayName search"
                        $Extension = $Results.results.extensions | Where-Object { $_.DisplayName -like "*$DisplayName*" }    
                    }
                }
                else 
                {
                    Write-Verbose -Message "Get Extension without WildCards"
                    $Extension = $Results.results.extensions | Where-Object { $_.DisplayName -eq $DisplayName }
                }
            }

            'FullName' {
                Write-Verbose -Message "Using FullName"
                
                $SplitFullName = $FullName.Split('.')
                $Publisher = $SplitFullName[0]
                $ExtensionName = $SplitFullName[1]
                
                Write-Verbose -Message "Publisher: $($Publisher)"
                Write-Verbose -Message "ExtensionName: $($ExtensionName)"                
                if ($WildCard)
                {
                    Write-Verbose -Message "Wildcard Switch is Present"                    
                    if ($FullName -match '\*')
                    {
                        Write-Verbose -Message "Wildcard `"*`" is Present in FullName"
                        if ($Publisher -match '\*')
                        {
                            Write-Verbose -Message "Wildcard `"*`" is Present in Publisher"
                            $PublisherExts = $Results.results.extensions | Where-Object { $_.Publisher.PublisherName -like $Publisher }
                        }
                        else
                        {
                            Write-Verbose -Message "No WildCards so add them to beginning and end for Publisher search"
                            $PublisherExts = $Results.results.extensions | Where-Object { $_.Publisher.PublisherName -eq $Publisher }
                        }

                        if ($ExtensionName -match '\*')
                        {
                            Write-Verbose -Message "Wildcard `"*`" is Present in ExtensionName"
                            $Extension = $PublisherExts | Where-Object { $_.ExtensionName -like $ExtensionName }
                        }
                        else
                        {
                            Write-Verbose -Message "No WildCards so add them to beginning and end for ExtensionName search"
                            $Extension = $PublisherExts | Where-Object { $_.ExtensionName -like "*$ExtensionName*" }
                        }                        
                    }
                    else 
                    {
                        Write-Verbose -Message "No WildCards so add them to beginning and end for search"                        
                        $PublisherExts = $Results.results.extensions | Where-Object { $_.Publisher.PublisherName -like "*$Publisher" }
                        $Extension = $PublisherExts | Where-Object { $_.ExtensionName -like "$ExtensionName*" }                            
                    }
                }
                else 
                {
                    Write-Verbose -Message "Get Extension without WildCards"                    
                    $PublisherExts = $Results.results.extensions | Where-Object { $_.Publisher.PublisherName -eq $Publisher }
                    $Extension = $PublisherExts | Where-Object { $_.ExtensionName -eq $ExtensionName }
                }
            }            
        }
       
        if ($Extension)
        {
            foreach ($Ext in $Extension)            
            {
                $Ext | Add-Member -MemberType NoteProperty -Name publisherName -Value $Ext.publisher.publisherName
                $Ext | Add-Member -MemberType NoteProperty -Name FullName -Value ($Ext.publisher.publisherName + '.' + $Ext.ExtensionName)
                $Ext
            }
        }
        else
        {
            Write-Error "Could not find Extension"
        }
    }
}
