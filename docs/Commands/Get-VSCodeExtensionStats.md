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
Get-VSCodeExtensionStats -ExtensionName <String[]> [-PublisherName <String[]>] [-Category <String[]>]
 [-Tag <String[]>] [<CommonParameters>]
```

### DisplayName
```
Get-VSCodeExtensionStats -DisplayName <String[]> [-PublisherName <String[]>] [-Category <String[]>]
 [-Tag <String[]>] [<CommonParameters>]
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
PS C:\> Get-VSCodeExtensionStats -ExtensionName 'Theme-FlatlandMonokai' -PublisherName 'gerane'

Extension Name   : Flatland Monokai Theme
Publisher Name   : gerane
Install Count    : 8548
Average Rating   : 5
Rating Count     : 4
Trending Daily   : 7.48747055944117
Trending Weekly  : 37.234988728031766
Trending Monthly : 183.44302870630867
```

Gets stats for the Flatland Monokai Theme using Extension Name and Publisher Name
### Example 4
```
PS C:\> Get-VSCodeExtensionStats -ExtensionName '*Flatland*'

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

Gets stats for all Extension Names containing Flatland using WildCards.
## PARAMETERS

### -DisplayName
The Extensions Display Name of the Extension. Accepts WildCards.

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
The Extensions Name of the Extension. Accepts WildCards.

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
Accept wildcard characters: False
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

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

