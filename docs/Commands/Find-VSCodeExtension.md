---
external help file: VSCodeExtensions-help.xml
online version: 
schema: 2.0.0
---

# Find-VSCodeExtension
## SYNOPSIS
Find available extensions on the VSCode Extension Gallery.

## SYNTAX

### ExtensionName (Default)
```
Find-VSCodeExtension -ExtensionName <String[]> [-WildCard]
```

### DisplayName
```
Find-VSCodeExtension -DisplayName <String[]> [-WildCard]
```

### FullName
```
Find-VSCodeExtension -FullName <String[]> [-WildCard]
```

## DESCRIPTION
Find available extensions with or without Wildcards on the VSCode Extension Gallery.

## EXAMPLES

### Example 1
```
PS C:\> Find-VSCodeExtension -DisplayName 'Flatland Monokai Theme'
```

This example uses the Display Name to find the Extension.

### Example 2
```
PS C:\> Find-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai'
```

This example uses the Extension Name to find the Extension.

### Example 3
```
PS C:\> Find-VSCodeExtension -FullName 'gerane.Theme-FlatlandMonokai'
```

This example uses the Full Name to find the Extension. The Full Name is the Publisher Name and Extension Name combined with a dot.

### Example 4
```
PS C:\> Find-VSCodeExtension -FullName 'gerane.*' -WildCard
```

This example finds all Extensions by the Publisher gerane since it is using a Wildcard.

## PARAMETERS

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

### System.Management.Automation.PSObject


## NOTES

## RELATED LINKS

