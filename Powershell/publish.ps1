## build cfg for publish
$buildConfig = $env:BUILDCONFIGURATION;
$buildNoRestore= $env:norestoreonpublish;
$buildNoRestoreStr = '';
$noBuild = $env:nobuildonpublish;
$noBuildStr = '';


# if ($test -eq $False)
# {
#     $buildConfig ='debug';
# }

if ($buildNoRestore)
{
    $buildNoRestoreStr = '--no-restore';
}

if ($noBuild)
{
    $noBuildStr = '--no-build';
}

###

### TODO: configure logging
ForEach ($path in (Get-Childitem **/**.csproj -Recurse)) 
{
    #$path.FullName;
    Write-Output "dotnet publish $($path.FullName) -v n -c $buildConfig $buildNoRestoreStr $noBuildStr";
    dotnet publish $path.FullName -v n -c $buildConfig $buildNoRestoreStr $noBuildStr;
}