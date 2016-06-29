---
external help file: VSCodeExtensions-help.xml
online version: 
schema: 2.0.0
---

# Get-VSCodeExtension
## SYNOPSIS
Get Installed VSCode Extensions.

## SYNTAX

```
Get-VSCodeExtension [-Insiders]
```

## DESCRIPTION
Get Installed Extensions for Stable or Release Versions of VSCode.

## EXAMPLES

### Example 1
```
PS C:\> Get-VSCodeExtension

FullName      : ms-vscode.PowerShell
ExtensionName : PowerShell
DisplayName   : PowerShell
Version       : 0.6.1
ExtensionPath : C:\Users\i2871rbp\.vscode\extensions\ms-vscode.PowerShell-0.6.1

FullName      : ms-vscode.Theme-MaterialKit
ExtensionName : Theme-MaterialKit
DisplayName   : Material Theme Kit
Version       : 0.1.0
ExtensionPath : C:\Users\i2871rbp\.vscode\extensions\ms-vscode.Theme-MaterialKit

FullName      : ms-vscode.Theme-PredawnKit
ExtensionName : Theme-PredawnKit
DisplayName   : Predawn Theme Kit
Version       : 0.1.0
ExtensionPath : C:\Users\i2871rbp\.vscode\extensions\ms-vscode.Theme-PredawnKit

FullName      : ms-vscode.Theme-TomorrowKit
ExtensionName : Theme-TomorrowKit
DisplayName   : Tomorrow and Tomorrow Night Theme Kit
Version       : 0.1.0
ExtensionPath : C:\Users\i2871rbp\.vscode\extensions\ms-vscode.Theme-TomorrowKit

```

Outputs the Installed extensions for the Stable Version of VSCode

### Example 2
```
PS C:\> Get-VSCodeExtension -Insiders

FullName      : ms-vscode.PowerShell
ExtensionName : PowerShell
DisplayName   : PowerShell
Version       : 0.6.1
ExtensionPath : C:\Users\i2871rbp\.vscode-insiders\extensions\ms-vscode.PowerShell-0.6.1

FullName      : ms-vscode.Theme-MaterialKit
ExtensionName : Theme-MaterialKit
DisplayName   : Material Theme Kit
Version       : 0.1.0
ExtensionPath : C:\Users\i2871rbp\.vscode-insiders\extensions\ms-vscode.Theme-MaterialKit

FullName      : ms-vscode.Theme-PredawnKit
ExtensionName : Theme-PredawnKit
DisplayName   : Predawn Theme Kit
Version       : 0.1.0
ExtensionPath : C:\Users\i2871rbp\.vscode-insiders\extensions\ms-vscode.Theme-PredawnKit

FullName      : ms-vscode.Theme-TomorrowKit
ExtensionName : Theme-TomorrowKit
DisplayName   : Tomorrow and Tomorrow Night Theme Kit
Version       : 0.1.0
ExtensionPath : C:\Users\i2871rbp\.vscode-insiders\extensions\ms-vscode.Theme-TomorrowKit

```

Outputs the Installed extensions for the Insiders Version of VSCode

## PARAMETERS

### -Insiders
Switch to Target Insiders version of Code

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None


## OUTPUTS

### System.Management.Automation.PSObject


## NOTES

## RELATED LINKS

