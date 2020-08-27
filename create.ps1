param (
    [string]$SourceRepo = (Get-Item .).FullName,
    [string]$QaRepo = "C:\Users\wmorrison\source\fcqa"
)

$branch = git rev-parse --abbrev-ref HEAD;

npm run build;

if (!(Test-Path $QaRepo/$branch)) {
    mkdir $QaRepo/$branch;
}

cp build/* $QaRepo/$branch;

cd $QaRepo/; git add .; git commit -m "updates"; git push origin master;

cd $SourceRepo

Write-Host "Deployed at https://wmorrison-frontlineed.github.io/fcqa/$branch" -ForegroundColor Blue