---
external help file: VSCodeExtensions-help.xml
online version: 
schema: 2.0.0
---

# Install-VSCodeExtension
## SYNOPSIS
Installs a VSCode Extension.
## SYNTAX

### ExtensionName (Default)
```
Install-VSCodeExtension -ExtensionName <String[]> [-PublisherName <String[]>] [-Category <String[]>]
 [-Tag <String[]>] [-Insiders] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### DisplayName
```
Install-VSCodeExtension -DisplayName <String[]> [-PublisherName <String[]>] [-Category <String[]>]
 [-Tag <String[]>] [-Insiders] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Installs a VSCode Extension for either Stable or Insiders versions.
## EXAMPLES

### Example 1
```
PS C:\> Install-VSCodeExtension -DisplayName 'Flatland Monokai Theme'
```

This example uses the Display Name to Install the Extension.
### Example 2
```
PS C:\> Install-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai' -Insiders
```

This example uses the Extension Name to Install the Extension. It is being installed for the Insiders version of VSCode.
### Example 3
```
PS C:\> Install-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai' -PublisherName 'gerane'
```

This example uses the Extension Name and Publisher Name to Install the Extension.
### Example 4
```
PS C:\> Install-VSCodeExtension -ExtensionName 'pow*' -Category Debuggers
```

This example Installs the PowerShell Extension by searching for Extensions with category Debuggers and start with pow.
### Example 5
```
PS C:\> Find-VSCodeExtension -ExtensionName '*flow*' -Tag Java*
```

This example Installs the flow-for-vscode and vscode-flow Extensions by searching for Extensions with tags starting with Java and names containing flow.
## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet. Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayName
The Extensions Display Name to be Installed. Accepts WildCards.

```yaml
Type: String[]
Parameter Sets: DisplayName
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: True
```

### -ExtensionName
The Extensions Name to be Installed. Accepts WildCards.

```yaml
Type: String[]
Parameter Sets: ExtensionName
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: True
```

### -Insiders
Switch to Target Insiders version of Code

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Filter Extensions by Categories. Valid categoies are 'Languages', 'Snippets', 'Linters', 'Debuggers', 'Other', 'Themes' and 'Productivity'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublisherName
Filter Extensions by Publisher Name. Accepts WildCards.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: True
```

### -Tag
Filter Extensions by Tag names. Accepts WildCards.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
## INPUTS

### System.String[]

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

