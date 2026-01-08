@echo off
echo Deploying Portfolio to GitHub Pages...
echo.

REM Check if git is initialized
if not exist ".git" (
    echo Initializing Git repository...
    git init
    git branch -M main
)

REM Add all files
echo Adding files to Git...
git add .

REM Commit changes
echo Committing changes...
git commit -m "Update portfolio website - %date% %time%"

REM Check if remote exists
git remote -v | findstr "origin" >nul
if %errorlevel% neq 0 (
    echo.
    echo Please add your GitHub repository as remote:
    echo git remote add origin https://github.com/YOUR_USERNAME/portfolio.git
    echo.
    echo Then run this script again.
    pause
    exit /b 1
)

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main

echo.
echo ✅ Portfolio deployed successfully!
echo.
echo Next steps:
echo 1. Go to your GitHub repository
echo 2. Click Settings ^> Pages
echo 3. Select "Deploy from a branch"
echo 4. Choose "main" branch and "/ (root)" folder
echo 5. Save and wait for deployment
echo.
echo Your portfolio will be available at:
echo https://YOUR_USERNAME.github.io/portfolio
echo.
pause
