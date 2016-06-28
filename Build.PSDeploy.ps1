Deploy VSCodeExtensions {
    
    By PlatyPS {
        FromSource "VSCodeExtensions\docs\Commands"
        To "VSCodeExtensions\VSCodeExtensions\en-US"
        Tagged Help
        WithOptions @{
            Force = $true
        }
    }

    By FileSystem {
        FromSource VSCodeExtensions
        To "$home\Documents\WindowsPowerShell\Modules\VSCodeExtensions"
        Tagged Prod, Module, Local
        WithOptions @{
            Mirror = $true
        }
        WithPostScript {
            Import-Module -Name VSCodeExtensions -Force
        }
    }

    By PSGalleryModule {
        FromSource VSCodeExtensions
        To PSGallery
        Tagged PSGallery
        WithOptions @{
            ApiKey = $ENV:NugetApiKey
        }
    }
}
