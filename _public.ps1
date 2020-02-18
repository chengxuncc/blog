Split-Path $MyInvocation.MyCommand.Path | Set-Location

git add .
git commit -m "daily update"
git push

cd public
git pull

cd ..
hugo --gc --minify
cd public
git add .
git commit -m "public by script"
git push

cd ..