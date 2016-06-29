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
Install-VSCodeExtension -ExtensionName <String[]> [-Version <Version>] [-WildCard] [-Insiders] [-WhatIf]
 [-Confirm]
```

### DisplayName
```
Install-VSCodeExtension -DisplayName <String[]> [-Version <Version>] [-WildCard] [-Insiders] [-WhatIf]
 [-Confirm]
```

### FullName
```
Install-VSCodeExtension -FullName <String[]> [-Version <Version>] [-WildCard] [-Insiders] [-WhatIf] [-Confirm]
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
PS C:\> Install-VSCodeExtension -FullName 'gerane.Theme-FlatlandMonokai'
```

This example uses the Full Name to Install the Extension. The Full Name is the Publisher Name and Extension Name combined with a dot.

### Example 4
```
PS C:\> Install-VSCodeExtension -FullName 'gerane.*' -WildCard
```

This example Installs all Extensions by the Publisher gerane since it is using a Wildcard.

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

