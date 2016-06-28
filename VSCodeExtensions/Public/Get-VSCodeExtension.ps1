function Get-VSCodeExtension
{
    [CmdletBinding()]
    param
    (
        [switch]$Insiders
    )
    
    Begin {}
    
    Process
    {        
        if ($Insiders)
        {            
            $ExtensionPath = "$HOME\.vscode-insiders\extensions"
        }
        else
        {
            $ExtensionPath = "$HOME\.vscode\extensions"
        }
        
        Write-Verbose -Message "Using Extension Path: $($ExtensionPath)"

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
