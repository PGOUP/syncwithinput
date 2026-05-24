#!/bin/bash
# Linux/Mac 构建 SyncClipboard Android IME
# 输出: app-debug.apk

echo "========================================"
echo "SyncClipboard Android IME 构建脚本"
echo "========================================"
echo ""

cd "$(dirname "$0")"
cd SyncClipboard.AndroidIME

echo "[1/3] 检查 Gradle Wrapper..."
if [ ! -f "gradlew" ]; then
    echo "错误：未找到 Gradle Wrapper！"
    echo "请在项目目录运行"
    exit 1
fi

chmod +x gradlew

echo "[2/3] 开始构建 Debug APK..."
./gradlew assembleDebug
if [ $? -ne 0 ]; then
    echo "构建失败！"
    exit 1
fi

echo "[3/3] 构建成功！
echo ""
echo "APK 位置:"
echo "$(pwd)/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "打开 APK 目录:"
open "$(pwd)/app/build/outputs/apk/debug"
