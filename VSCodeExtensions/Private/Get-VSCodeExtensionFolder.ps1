Function Get-VSCodeExtensionFolder
{
    [CmdletBinding()]
    [OutputType([String])]
    param
    (
        [parameter(Position=0)]    
        [switch]$Insiders
    )

    Process
    {
        if ($Insiders)
        {
            $Folder = "$HOME\.vscode-insiders\extensions"
        }
        else
        {
            $Folder = "$HOME\.vscode\extensions"
        }

        Return $Folder
    }
}