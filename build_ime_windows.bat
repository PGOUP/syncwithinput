@echo off
REM Windows 构建 SyncClipboard Android IME
REM 输出: app-debug.apk

echo ========================================
echo SyncClipboard Android IME 构建脚本
echo ========================================
echo.

cd /d "%~dp0"
cd /d src\SyncClipboard.AndroidIME

echo [1/3] 检查 Gradle Wrapper...
if not exist "gradlew.bat" (
    echo 错误：项目未找到 Gradle Wrapper！
    echo 请先在项目目录运行
    pause
    exit /b 1
)

echo [2/3] 开始构建 Debug APK...
call gradlew.bat assembleDebug
if errorlevel 1 (
    echo 构建失败！
    pause
    exit /b 1
)

echo [3/3] 构建成功！
echo.
echo APK 位置:
echo %cd%\app\build\outputs\apk\debug\app-debug.apk
echo.
echo 正在打开 APK 目录...
explorer "%cd%\app\build\outputs\apk\debug
pause
