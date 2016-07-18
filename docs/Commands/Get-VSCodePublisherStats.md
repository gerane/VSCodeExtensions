---
external help file: VSCodeExtensions-help.xml
online version: 
schema: 2.0.0
---

# Get-VSCodePublisherStats
## SYNOPSIS
Get statistics for a Publisher
## SYNTAX

```
Get-VSCodePublisherStats [-PublisherName] <String> [<CommonParameters>]
```

## DESCRIPTION
Get VSCode Gallery statistics for a Publisher. 
## EXAMPLES

### Example 1
```
PS C:\> Get-VSCodePublisherStats -PublisherName 'gerane'

Publisher Name            : gerane
Publisher ID              : a5c25faf-bf60-4941-81b9-9a852b96c5fb
Total Extension Installs  : 98994
Extension Count           : 287
Most Downloaded Extension : Flatland Monokai Theme
Most Downloaded Count     : 8548
```

Gets the statistics for the provided publisher.
## PARAMETERS

### -PublisherName
The Publisher Name. Accepts WildCards.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
## INPUTS

### String

## OUTPUTS

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

