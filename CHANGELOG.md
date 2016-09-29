# VSCodeExtensions Release History

## 0.1.2
### 09/29/2016
Fixed Issue with metadata
- Added metadata to Extension Package.json files.
- Code stopped recognizing installed extensions if this metadata was missing. It should now detect they were installed from the marketplace.


## 0.1.1
### 07/18/2016
Few Imporvements.
- appveyor: Added Slack notifications for builds
- Psake: Added Manifest auto updates
- FInd-VSCodeExtension: Added Installs and AssetUri properties to return
- Install-VSCodeExtension: Swapped to piping
- Formats: Moved formats to a format folder
- VSIX: moved from Extension object to properties and piping.
- Manifest: Added ReleaseNotes for PSGallery and Formats
- Tests: Added Manifest tests


## 0.1.0    
### 7/17/2016
Imporved the handling of VSIX files.
Commands
- Find-VSCodeExtension
- Get-VSCodeExtension
- Get-VSCodeExtensionStats
- Get-VSCodePublisherStats
- Install-VSCodeExtension
- Uninstall-VSCodeExtension
- Update-VSCodeExtension


## 0.0.1
Initial Release
