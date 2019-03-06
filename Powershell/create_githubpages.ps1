$cmd = git.exe branch -r; 

Write-Host $cmd;

$ghPagesExists = $cmd.Where( { $_ -like "*gh-pages*" }, 'First').Count -gt 0
Write-Host $ghPagesExists;
if (!$ghPagesExists) {
    #cd /path/to/repo-name
    git symbolic-ref HEAD refs/heads/gh-pages
    rm .git/index
    git clean -fdx
    #echo "My GitHub Page" > index.html
    git add .
    git commit -a -m "gh-pages initial" --allow-empty
    git push origin gh-pages --porcelain
}

