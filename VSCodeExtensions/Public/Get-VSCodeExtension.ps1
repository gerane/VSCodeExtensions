# .ExternalHelp VSCodeExtensions-Help.xml
function Get-VSCodeExtension
{
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param
    (
        [Parameter(Position=0)]
        [switch]$Insiders
    )
    
    Begin {}
    
    Process
    {   
        #TODO: Make this searchable by Packages     
        $ExtensionPath = Get-VSCodeExtensionFolder -Insiders:$Insiders
        
        Write-Debug -Message "Using Extension Path: $($ExtensionPath)"

        If (Test-Path -Path $ExtensionPath)
        {
            $ExtensionDirs = Get-ChildItem -Path $ExtensionPath -Directory -ErrorAction SilentlyContinue
            if ($ExtensionDirs)
            {
                foreach ($ExtensionDir in $ExtensionDirs)
                {                    
                    $PackageJson = Get-Content -Path "$($ExtensionDir.FullName)\package.json" -Raw -ErrorAction SilentlyContinue | ConvertFrom-Json
                    if ($PackageJson)
                    {
                        $Extension = [PSCustomObject]@{
                            'FullName'      = "$($PackageJson.Publisher).$($PackageJson.Name)"                            
                            'ExtensionName' = $PackageJson.Name
                            'DisplayName'   = $PackageJson.DisplayName
                            'Version'       = $PackageJson.Version
                            'PublisherName' = $PackageJson.Publisher
                            'Homepage'      = $PackageJson.Homepage
                            'ExtensionPath' = $ExtensionDir.FullName
                        }

                        If ($Insiders)
                        {
                            $Extension | Add-Member -MemberType NoteProperty -Name 'Insiders' -Value $True
                        }

                        $Extension
                    }
                }
            }
            else
            {
                Write-Verbose -Message 'No extensions installed.'
            }
        }
        else 
        {
            Write-Verbose -Message "${ExtensionPath} does not exist. Creating it."
            $null = New-Item -Path $ExtensionPath -ItemType Directory -Force
        }
    }
} 
