# Original Manifest Test ideas by Brandon Olin, Matt McNabb and Francois-Xavier Cat
# https://github.com/devblackops/watchmen/blob/master/Tests/Manifest.Tests.ps1
# http://www.lazywinadmin.com/2016/05/using-pester-to-test-your-manifest-file.html
# https://mattmcnabb.github.io/pester-testing-your-module-manifest

$ModuleName = 'VSCodeExtensions'
$root = Split-Path -Path $PSScriptRoot -Parent
$ModulePath = Join-Path -Path $root -ChildPath $moduleName
$ManifestPath = Join-Path -Path $modulePath -Child "$moduleName.psd1"
$ChangelogPath = Join-Path -Path $root -Child "CHANGELOG.md"


Describe 'Module manifest' {
    Get-Module -Name $ModuleName | remove-module -ErrorAction SilentlyContinue

    Context 'Validation' {

        $manifest = $null
        $Manifest = Import-module -Name $ManifestPath -PassThru
        $FunctionFiles = Get-ChildItem "$ModulePath\Public\*.ps1" | Select -ExpandProperty BaseName
        $FunctionNames = $FunctionFiles | foreach {$_ -replace '-', "-$($Manifest.Prefix)"}
        $ExFunctions = $Manifest.ExportedFunctions.Values.Name

        It "has a valid manifest" {
            $Manifest | Should Not Be $null
        }

        It "has a valid name in the manifest" {
            $Manifest.Name | Should Be $ModuleName
        }

        It 'has a valid root module' {
            $Manifest.RootModule | Should Be "$ModuleName.psm1"
        }

        It "has a valid version in the manifest" {
            $Manifest.Version -as [Version] | Should Not BeNullOrEmpty
        }
    
        It 'has a valid description' {
            $Manifest.Description | Should Not BeNullOrEmpty
        }

        It 'has a valid author' {
            $Manifest.Author | Should Not BeNullOrEmpty
        }
    
        It 'has a valid guid' {
            { [guid]::Parse($Manifest.Guid) } | Should Not throw
        }
    
        It 'has a valid copyright' {
            $Manifest.CopyRight | Should Not BeNullOrEmpty
        }

        It 'has tags for PSGallery' {
            $Manifest.Tags.count | Should Not BeNullOrEmpty 
        }

        foreach ($Tag in $Manifest.PrivateData.Values.tags)
        {
            It "Tag [$Tag] Should not have spaces" {
                $Tag | Should Not Match '\s'
            }
        }

        It 'Should export functions' {
            $ExFunctions.count | Should BeGreaterThan 0
        }

        foreach ($FunctionName in $FunctionNames)
        {
            It "Function [$FunctionName] should be exported" {		    		    
		    	$ExFunctions -contains $FunctionName | Should Be $True
            }
	    }
        
        It 'FunctionToExport should have same count as functions in Public Folder' {
            $FunctionNames.Count | Should Be $ExFunctions.count
        }


        # Only for DSC modules
        # It 'exports DSC resources' {
        #     $dscResources = ($Manifest.psobject.Properties | Where Name -eq 'ExportedDscResources').Value
        #     @($dscResources).Count | Should Not Be 0
        # }

        $script:changelogVersion = $null
        It "has a valid version in the changelog" {
            foreach ($line in (Get-Content $changelogPath)) {
                if ($line -match "^\D*(?<Version>(\d+\.){1,3}\d+)") {
                    $script:changelogVersion = $matches.Version
                    break
                }
            }
            $script:changelogVersion                | Should Not BeNullOrEmpty
            $script:changelogVersion -as [Version]  | Should Not BeNullOrEmpty
        }

        It "changelog and manifest versions are the same" {
            $script:changelogVersion -as [Version] | Should be ( $Manifest.Version -as [Version] )
        }

        # if (Get-Command git.exe -ErrorAction SilentlyContinue) {
        #     $script:tagVersion = $null
        #     It "is tagged with a valid version" -skip {
        #         $thisCommit = git.exe log --decorate --oneline HEAD~1..HEAD

        #         if ($thisCommit -match 'tag:\s*(\d+(?:\.\d+)*)') {
        #             $script:tagVersion = $matches[1]
        #         }

        #         $script:tagVersion                  | Should Not BeNullOrEmpty
        #         $script:tagVersion -as [Version]    | Should Not BeNullOrEmpty
        #     }

        #     It "all versions are the same" {
        #         $script:changelogVersion -as [Version] | Should be ( $Manifest.Version -as [Version] )
        #         #$Manifest.Version -as [Version] | Should be ( $script:tagVersion -as [Version] )
        #     }
        # }
    }
}
