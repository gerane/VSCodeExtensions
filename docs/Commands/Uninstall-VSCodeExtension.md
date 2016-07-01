---
external help file: VSCodeExtensions-help.xml
schema: 2.0.0
online version: 
---

# Uninstall-VSCodeExtension
## SYNOPSIS
Uninstalls VSCode Extensions.
## SYNTAX

### ExtensionName (Default)
```
Uninstall-VSCodeExtension -ExtensionName <String[]> [-PublisherName <String[]>] [-Insiders] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### DisplayName
```
Uninstall-VSCodeExtension -DisplayName <String[]> [-PublisherName <String[]>] [-Insiders] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Uninstalls Extensions for Stable or Insiders Versions of VSCode using names or Wildcards.
## EXAMPLES

### Example 1
```
PS C:\> Uninstall-VSCodeExtension -DisplayName 'Flatland Monokai Theme'
```

This example uses the Display Name to Uninstall the Extension.
### Example 2
```
PS C:\> Uninstall-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai' -Insiders
```

This example uses the Extension Name to Uninstall the Extension. It is being uninstalled for the Insiders version of VSCode.
### Example 3
```
PS C:\> Uninstall-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai' -PublisherName 'gerane'
```

This example uses the Extension Name and Publisher Name to Uninstall the Extension.
### Example 4
```
PS C:\> Uninstall-VSCodeExtension -ExtensionName '*' -PublisherName 'gerane'
```

This example Uninstalls all Extensions by the Publisher gerane
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
The Extensions Display Name. Accepts WildCards.

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
The Extensions Name. Accepts WildCards.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
## INPUTS

### System.String[]

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

