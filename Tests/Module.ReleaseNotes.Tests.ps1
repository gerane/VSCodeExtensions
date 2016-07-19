
Describe 'Module Release Notes' {
    $ReleaseNotes = Get-Content "$PSScriptRoot\..\CHANGELOG.md"

    Context 'Release Notes are Valid' {

        It "should not contain single quote" {
            ,$ReleaseNotes | Should Not Match "'"
        }
    }
}