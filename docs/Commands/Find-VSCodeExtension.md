---
external help file: VSCodeExtensions-help.xml
schema: 2.0.0
online version: 
---

# Find-VSCodeExtension
## SYNOPSIS
Find available extensions on the VSCode Extension Gallery.
## SYNTAX

### ExtensionName (Default)
```
Find-VSCodeExtension -ExtensionName <String[]> [-PublisherName <String[]>] [-Category <String[]>]
 [-Tag <String[]>] [<CommonParameters>]
```

### DisplayName
```
Find-VSCodeExtension -DisplayName <String[]> [-PublisherName <String[]>] [-Category <String[]>]
 [-Tag <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Find available extensions with or without Wildcards on the VSCode Extension Gallery. Allows Searching via Tags and Categories.
## EXAMPLES

### Example 1
```
PS C:\> Find-VSCodeExtension -DisplayName 'Flatland Monokai Theme'

publisher        : @{publisherId=a5c25faf-bf60-4941-81b9-9a852b96c5fb; publisherName=gerane; displayName=gerane; flags=none}
extensionId      : 6bfab4b0-9e4f-4143-9cc2-2cb359d841d8
extensionName    : Theme-FlatlandMonokai
displayName      : Flatland Monokai Theme
flags            : validated, public
lastUpdated      : 2016-04-27T13:53:56.12Z
publishedDate    : 2015-11-18T23:35:34.55Z
releaseDate      : 2015-11-18T23:35:34.55Z
shortDescription : Flatland Monokai Theme for VS Code based on the TextMate themes.
versions         : {@{version=0.0.4; flags=validated; lastUpdated=2016-04-27T13:53:56.933Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.4/assetbyname}, @{version=0.0.3; flags=validated; 
                   lastUpdated=2015-11-19T01:48:58.507Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.2; flags=validated; lastUpdated=2015-11-18T23:48:35.303Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.1; flags=validated; lastUpdated=2015-11-18T23:35:34.55Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}}
categories       : {Themes}
tags             : {vscode}
statistics       : {@{statisticName=trendingmonthly; value=187.97107077517933}, @{statisticName=trendingweekly; value=41.78259000546236}, @{statisticName=install; value=8633}, 
                   @{statisticName=averagerating; value=5}...}
publisherName    : gerane
FullName         : gerane.Theme-FlatlandMonokai
Version          : 0.0.4
```

This example uses the Display Name to find the Extension.
### Example 2
```
PS C:\> Find-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai'

publisher        : @{publisherId=a5c25faf-bf60-4941-81b9-9a852b96c5fb; publisherName=gerane; displayName=gerane; flags=none}
extensionId      : 6bfab4b0-9e4f-4143-9cc2-2cb359d841d8
extensionName    : Theme-FlatlandMonokai
displayName      : Flatland Monokai Theme
flags            : validated, public
lastUpdated      : 2016-04-27T13:53:56.12Z
publishedDate    : 2015-11-18T23:35:34.55Z
releaseDate      : 2015-11-18T23:35:34.55Z
shortDescription : Flatland Monokai Theme for VS Code based on the TextMate themes.
versions         : {@{version=0.0.4; flags=validated; lastUpdated=2016-04-27T13:53:56.933Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.4/assetbyname}, @{version=0.0.3; flags=validated; 
                   lastUpdated=2015-11-19T01:48:58.507Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.2; flags=validated; lastUpdated=2015-11-18T23:48:35.303Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.1; flags=validated; lastUpdated=2015-11-18T23:35:34.55Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}}
categories       : {Themes}
tags             : {vscode}
statistics       : {@{statisticName=trendingmonthly; value=187.97107077517933}, @{statisticName=trendingweekly; value=41.78259000546236}, @{statisticName=install; value=8633}, 
                   @{statisticName=averagerating; value=5}...}
publisherName    : gerane
FullName         : gerane.Theme-FlatlandMonokai
Version          : 0.0.4
```

This example uses the Extension Name to find the Extension.
### Example 3
```
PS C:\> Find-VSCodeExtension -ExtensionName 'Theme-FlatlandMonokai' -PublisherName 'gerane'

publisher        : @{publisherId=a5c25faf-bf60-4941-81b9-9a852b96c5fb; publisherName=gerane; displayName=gerane; flags=none}
extensionId      : 6bfab4b0-9e4f-4143-9cc2-2cb359d841d8
extensionName    : Theme-FlatlandMonokai
displayName      : Flatland Monokai Theme
flags            : validated, public
lastUpdated      : 2016-04-27T13:53:56.12Z
publishedDate    : 2015-11-18T23:35:34.55Z
releaseDate      : 2015-11-18T23:35:34.55Z
shortDescription : Flatland Monokai Theme for VS Code based on the TextMate themes.
versions         : {@{version=0.0.4; flags=validated; lastUpdated=2016-04-27T13:53:56.933Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.4/assetbyname}, @{version=0.0.3; flags=validated; 
                   lastUpdated=2015-11-19T01:48:58.507Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.2; flags=validated; lastUpdated=2015-11-18T23:48:35.303Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.1; flags=validated; lastUpdated=2015-11-18T23:35:34.55Z; 
                   assetUri=https://gerane.gallery.vsassets.io/_apis/public/gallery/publisher/gerane/extension/Theme-FlatlandMonokai/0.0.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}}
categories       : {Themes}
tags             : {vscode}
statistics       : {@{statisticName=trendingmonthly; value=187.97107077517933}, @{statisticName=trendingweekly; value=41.78259000546236}, @{statisticName=install; value=8633}, 
                   @{statisticName=averagerating; value=5}...}
publisherName    : gerane
FullName         : gerane.Theme-FlatlandMonokai
Version          : 0.0.4
```

This example uses the Extension Name and Publisher Name to find the Extension.
### Example 4
```
PS C:\> Find-VSCodeExtension -ExtensionName 'pow*' -Category Debuggers

publisher        : @{publisherId=5f5636e7-69ed-4afe-b5d6-8d231fb3d3ee; publisherName=ms-vscode; displayName=Microsoft; flags=verified}
extensionId      : 40d39ce9-c381-47a0-80c8-a6661f731eab
extensionName    : PowerShell
displayName      : PowerShell
flags            : validated, public
lastUpdated      : 2016-05-16T23:46:23.047Z
publishedDate    : 2015-11-18T00:50:38.583Z
releaseDate      : 2015-11-18T00:50:38.583Z
shortDescription : Develop PowerShell scripts in Visual Studio Code!
versions         : {@{version=0.6.1; flags=validated; lastUpdated=2016-05-16T23:46:24.013Z; 
                   assetUri=https://ms-vscode.gallery.vsassets.io/_apis/public/gallery/publisher/ms-vscode/extension/PowerShell/0.6.1/assetbyname}, @{version=0.6.0; flags=validated; 
                   lastUpdated=2016-05-12T19:28:21.337Z; 
                   assetUri=https://ms-vscode.gallery.vsassets.io/_apis/public/gallery/publisher/ms-vscode/extension/PowerShell/0.6.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.5.0; flags=validated; lastUpdated=2016-03-10T22:20:22Z; 
                   assetUri=https://ms-vscode.gallery.vsassets.io/_apis/public/gallery/publisher/ms-vscode/extension/PowerShell/0.5.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.4.1; flags=validated; lastUpdated=2016-02-17T21:05:41.647Z; 
                   assetUri=https://ms-vscode.gallery.vsassets.io/_apis/public/gallery/publisher/ms-vscode/extension/PowerShell/0.4.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}...}
categories       : {Languages, Snippets, Linters, Debuggers}
tags             : {vscode}
statistics       : {@{statisticName=trendingmonthly; value=1388.0843742588802}, @{statisticName=trendingweekly; value=301.7879466216739}, @{statisticName=install; value=78201}, 
                   @{statisticName=averagerating; value=4.0625}...}
publisherName    : ms-vscode
FullName         : ms-vscode.PowerShell
Version          : 0.6.1
```

This example finds Extensions with the category Debuggers that start with pow.
### Example 5
```
PS C:\> Find-VSCodeExtension -ExtensionName '*flow*' -Tag Java*

publisher        : @{publisherId=abad690f-9e62-4fc4-a898-a944ea7d94b7; publisherName=flowtype; displayName=flowtype; flags=none}
extensionId      : b3917e4f-5086-4def-a82b-2ae6b708db16
extensionName    : flow-for-vscode
displayName      : Flow Language Support
flags            : validated, public
lastUpdated      : 2016-05-31T23:22:35.817Z
publishedDate    : 2015-11-19T01:30:11.12Z
releaseDate      : 2015-11-19T01:30:11.12Z
shortDescription : Flow support for VS Code
versions         : {@{version=0.0.3; flags=validated; lastUpdated=2016-05-31T23:22:36.703Z; 
                   assetUri=https://flowtype.gallery.vsassets.io/_apis/public/gallery/publisher/flowtype/extension/flow-for-vscode/0.0.3/assetbyname}, @{version=0.0.2; flags=validated; 
                   lastUpdated=2015-11-19T01:33:23.26Z; 
                   assetUri=https://flowtype.gallery.vsassets.io/_apis/public/gallery/publisher/flowtype/extension/flow-for-vscode/0.0.2/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=0.0.1; flags=validated; lastUpdated=2015-11-19T01:30:11.12Z; 
                   assetUri=https://flowtype.gallery.vsassets.io/_apis/public/gallery/publisher/flowtype/extension/flow-for-vscode/0.0.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}}
categories       : {Languages, Linters}
tags             : {javascript, snippet}
statistics       : {@{statisticName=ratingcount; value=1}, @{statisticName=trendingdaily; value=2.4101005608404065}, @{statisticName=trendingmonthly; value=61.090809868259}, 
                   @{statisticName=trendingweekly; value=11.212206956953196}...}
publisherName    : flowtype
FullName         : flowtype.flow-for-vscode
Version          : 0.0.3

publisher        : @{publisherId=915d04e8-ae93-49ac-8f58-48df3e79a37d; publisherName=rtorr; displayName=rtorr; flags=none}
extensionId      : 99ea8d0a-4a49-4f65-be06-32a91ea2c3d1
extensionName    : vscode-flow
displayName      : vscode-flow
flags            : validated, public
lastUpdated      : 2016-06-15T00:03:36.653Z
publishedDate    : 2016-06-14T00:13:30.917Z
releaseDate      : 2016-06-14T00:13:30.917Z
shortDescription : flow support for vscode
versions         : {@{version=270.1.10; flags=validated; lastUpdated=2016-06-15T00:03:37.43Z; 
                   assetUri=https://rtorr.gallery.vsassets.io/_apis/public/gallery/publisher/rtorr/extension/vscode-flow/270.1.10/assetbyname}, @{version=270.1.9; flags=validated; 
                   lastUpdated=2016-06-14T23:54:15.83Z; 
                   assetUri=https://rtorr.gallery.vsassets.io/_apis/public/gallery/publisher/rtorr/extension/vscode-flow/270.1.9/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=270.1.8; flags=validated; lastUpdated=2016-06-14T23:01:18.01Z; 
                   assetUri=https://rtorr.gallery.vsassets.io/_apis/public/gallery/publisher/rtorr/extension/vscode-flow/270.1.8/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}, 
                   @{version=270.1.7; flags=validated; lastUpdated=2016-06-14T22:26:57.53Z; 
                   assetUri=https://rtorr.gallery.vsassets.io/_apis/public/gallery/publisher/rtorr/extension/vscode-flow/270.1.7/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage}...}
categories       : {Other}
tags             : {javascript, snippet}
statistics       : {@{statisticName=install; value=178}, @{statisticName=trendingdaily; value=4.500000040233135}, @{statisticName=trendingmonthly; value=25.000000223517418}, 
                   @{statisticName=trendingweekly; value=12.000000107288361}}
publisherName    : rtorr
FullName         : rtorr.vscode-flow
Version          : 270.1.10
```

This example finds Extensions matching the name flow and Tags beginning with Java,
## PARAMETERS

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

### System.Management.Automation.PSObject

## NOTES

## RELATED LINKS

