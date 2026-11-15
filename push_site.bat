@echo off
chcp 65001 >nul
title MKA System - نشر الموقع
cd /d "%~dp0"

echo ============================================
echo    MKA System - رفع الموقع على GitHub
echo ============================================
echo.
git remote add origin https://github.com/mohamedkhaledabdelbaset/MKASystem-Site.git 2>nul
git push -u origin main

echo.
if %ERRORLEVEL% NEQ 0 (
    echo    فشل الرفع! الأسباب المحتملة:
    echo    1- الريبو مش موجود بعد - أنشئه من: github.com/new
    echo       الاسم بالظبط: MKASystem-Site   واختار: Public
    echo    2- تسجيل الدخول اتلغى - شغّل الملف تاني وسجل دخول
    echo    3- مسجل دخول بحساب تاني - لازم حساب mohamedkhaledabdelbaset
) else (
    echo    تم الرفع بنجاح!
    echo.
    echo    آخر خطوة - فعّل Pages:
    echo    https://github.com/mohamedkhaledabdelbaset/MKASystem-Site/settings/pages
    echo    Source: اختر GitHub Actions
    echo.
    echo    بعد دقيقتين الموقع هيفتح على:
    echo    https://mohamedkhaledabdelbaset.github.io/MKASystem-Site/
)
echo.
pause
