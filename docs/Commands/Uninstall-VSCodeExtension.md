---
external help file: VSCodeExtensions-help.xml
online version: 
schema: 2.0.0
---

# Uninstall-VSCodeExtension
## SYNOPSIS
Uninstalls VSCode Extensions.

## SYNTAX

### ExtensionName (Default)
```
Uninstall-VSCodeExtension -ExtensionName <String[]> [-WildCard] [-Insiders] [-WhatIf] [-Confirm]
```

### DisplayName
```
Uninstall-VSCodeExtension -DisplayName <String[]> [-WildCard] [-Insiders] [-WhatIf] [-Confirm]
```

### FullName
```
Uninstall-VSCodeExtension -FullName <String[]> [-WildCard] [-Insiders] [-WhatIf] [-Confirm]
```

## DESCRIPTION
Uninstalls Extensions for Stable or Insiders Versions of VSCode using names or Wildcards.

## EXAMPLES

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
PS C:\> Uninstall-VSCodeExtension -FullName 'gerane.Theme-FlatlandMonokai'
```

This example uses the Full Name to Uninstall the Extension. The Full Name is the Publisher Name and Extension Name combined with a dot.

### Example 4
```
PS C:\> Uninstall-VSCodeExtension -FullName 'gerane.*' -WildCard
```

This example Uninstalls all Extensions by the Publisher gerane since it is using a Wildcard.

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
The Extensions Display Name to be Installed.

```yaml
Type: String[]
Parameter Sets: DisplayName
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ExtensionName
The Extensions Name to be Installed

```yaml
Type: String[]
Parameter Sets: ExtensionName
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -FullName
Full Name of extension including Publisher's Name. PublisherName.ExtensionName

```yaml
Type: String[]
Parameter Sets: FullName
Aliases: 

Required: True
Position: Named
Default value: 
Accept pipeline input: True (ByPropertyName)
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

### -WildCard
Allows the use of WildCards

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

## INPUTS

### System.String[]


## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

