Function Get-VSCodeInstallation
{
    [CmdletBinding()]
    param
    (
        [switch]$Insiders
    )

    Process
    {
        if ($Insiders)
        {
            $DisplayName = 'Microsoft Visual Studio Code Insiders'
        }
        else 
        {
            $DisplayName = 'Microsoft Visual Studio Code'            
        }

        switch ($env:PROCESSOR_ARCHITECTURE)
        {
            'AMD64' { $UninstallKey = 'HKLM:\\SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*' }
            'x86' { $UninstallKey = 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*' }
        }

        $Products = Get-ItemProperty -Path $UninstallKey | Select DisplayName, DisplayVersion, InstallLocation
        if ($Products.DisplayName -contains $DisplayName)
        {
            return $Products.Where({$_.DisplayName -eq $DisplayName})
        }
    }
}