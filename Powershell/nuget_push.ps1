$apiKey = '27019456-2140-4f0f-804a-84b4ba47ed87';
$source = 'https://www.nuget.org/api/v2/package';


ForEach ($path in (Get-Childitem **/**.nupkg -Recurse)) 
{
    $path.FullName;
    dotnet nuget push $path.FullName -s $source -k $apiKey
    Remove-Item $path.FullName;
}
    