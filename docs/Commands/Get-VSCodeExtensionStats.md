---
external help file: VSCodeExtensions-help.xml
online version: 
schema: 2.0.0
---

# Get-VSCodeExtensionStats
## SYNOPSIS
Gets statistics for a VSCode Extension.

## SYNTAX

### ExtensionName (Default)
```
Get-VSCodeExtensionStats -ExtensionName <String[]> [-WildCard]
```

### DisplayName
```
Get-VSCodeExtensionStats -DisplayName <String[]> [-WildCard]
```

### FullName
```
Get-VSCodeExtensionStats -FullName <String[]> [-WildCard]
```

## DESCRIPTION
Gets statistics for a VSCode Extension or multiple extensions using a wildcard.

## EXAMPLES

### Example 1
```
PS C:\> Get-VSCodeExtensionStats -DisplayName 'Flatland Monokai Theme'

Extension Name   : Flatland Monokai Theme
Publisher Name   : gerane
Install Count    : 8548
Average Rating   : 5
Rating Count     : 4
Trending Daily   : 7.48747055944117
Trending Weekly  : 37.234988728031766
Trending Monthly : 183.44302870630867

```

Gets stats for the Flatland Monokai Theme using Display Name

### Example 2
```
PS C:\> Get-VSCodeExtensionStats -ExtensionName 'Theme-FlatlandMonokai'

Extension Name   : Flatland Monokai Theme
Publisher Name   : gerane
Install Count    : 8548
Average Rating   : 5
Rating Count     : 4
Trending Daily   : 7.48747055944117
Trending Weekly  : 37.234988728031766
Trending Monthly : 183.44302870630867

```

Gets stats for the Flatland Monokai Theme using Extension Name

### Example 3
```
PS C:\> Get-VSCodeExtensionStats -FullName 'gerane.Theme-FlatlandMonokai'

Extension Name   : Flatland Monokai Theme
Publisher Name   : gerane
Install Count    : 8548
Average Rating   : 5
Rating Count     : 4
Trending Daily   : 7.48747055944117
Trending Weekly  : 37.234988728031766
Trending Monthly : 183.44302870630867

```

Gets stats for the Flatland Monokai Theme using Full Name

### Example 4
```
PS C:\> Get-VSCodeExtensionStats -ExtensionName '*Flatland*' -WildCard

Extension Name   : Flatland Monokai Theme
Publisher Name   : gerane
Install Count    : 8548
Average Rating   : 5
Rating Count     : 4
Trending Daily   : 7.48747055944117
Trending Weekly  : 37.234988728031766
Trending Monthly : 183.44302870630867

Extension Name   : Flatland_Dark Theme
Publisher Name   : gerane
Install Count    : 982
Average Rating   : 
Rating Count     : 
Trending Daily   : 1.7649484774501054
Trending Weekly  : 6.287628950916
Trending Monthly : 19.41443325195116

Extension Name   : Flatland_Black Theme
Publisher Name   : gerane
Install Count    : 546
Average Rating   : 
Rating Count     : 
Trending Daily   : 2.1339517893452813
Trending Weekly  : 3.912244947133016
Trending Monthly : 8.891465788938671

```

Gets stats for all Extension Names containing Flatland using the WildCard switch.

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

