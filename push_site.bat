@echo off
title MKA System - Deploy Site
cd /d "%~dp0"

echo ============================================
echo    MKA System - Deploy website to GitHub
echo ============================================
echo.
git remote add origin https://github.com/mohamedkhaledabdelbaset/MKASystem-Site.git 2>nul
git push -u origin main
echo.
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo    PUSH FAILED - check these:
    echo    1. Repo must exist first: https://github.com/new
    echo       Name exactly: MKASystem-Site  (Public)
    echo    2. Did you cancel the login window? Run again and login.
    echo    3. You must login as account: mohamedkhaledabdelbaset
) else (
    echo.
    echo    PUSH OK!
    echo.
    echo    Last step - enable Pages:
    echo    https://github.com/mohamedkhaledabdelbaset/MKASystem-Site/settings/pages
    echo    Source: choose "GitHub Actions"
    echo.
    echo    Your site will be live in about 2 minutes at:
    echo    https://mohamedkhaledabdelbaset.github.io/MKASystem-Site/
)
echo.
pause
