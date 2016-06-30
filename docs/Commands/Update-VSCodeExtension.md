---
external help file: VSCodeExtensions-help.xml
schema: 2.0.0
online version: 
---

# Update-VSCodeExtension
## SYNOPSIS
Updates VSCode Extensions.
## SYNTAX

```
Update-VSCodeExtension [-Insiders] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Finds outdated Extensions for Stable or Insiders versions of VSCode and Updates them.
## EXAMPLES

### Example 1
```
PS C:\> Update-VSCodeExtension
```

Updates Extensions for the Stable Version of VSCode.
### Example 2
```
PS C:\> Update-VSCodeExtension -Insiders
```

Updates Extensions for the Insiders Version of VSCode.
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

