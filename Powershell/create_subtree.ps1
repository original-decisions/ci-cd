$cmd = !"git log | grep git-subtree-dir | awk '{ print $2 }'"; 

Write-Host $cmd;

$ghSubtreeExists = $cmd.Where( { $_ -like "*docs*" }, 'First').Count -gt 0
Write-Host $ghSubtreeExists;
if (!$ghSubtreeExists) {
    git checkout master;
    git subtree add --prefix docs https://github.com/original-decisions/ci-cd.git gh-pages;
}



