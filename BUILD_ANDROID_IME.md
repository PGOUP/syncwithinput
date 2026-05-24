# 快速构建 APK 指南

## 前置依赖

### 1. 安装 JDK

需要 JDK 17 或更高版本：

```bash
# 检查 Java 版本
java -version
```

### 2. 安装 Android SDK

需要 Android SDK，包含：
- Android SDK Platform 34
- Android SDK Build-Tools 34.0.0

可以通过 Android Studio SDK Manager 安装。

## Windows 快速构建

### 方式一：使用构建脚本（推荐）

```cmd
# 双击运行或在命令行执行
build_ime_windows.bat
```

### 方式二：手动构建

```cmd
cd src\SyncClipboard.AndroidIME
gradlew.bat assembleDebug
```

## Linux/Mac 快速构建

### 方式一：使用构建脚本（推荐）

```bash
chmod +x build_ime_linux.sh
./build_ime_linux.sh
```

### 方式二：手动构建

```bash
cd src/SyncClipboard.AndroidIME
chmod +x gradlew
./gradlew assembleDebug
```

## 构建产物

APK 文件位置：

```
src/SyncClipboard.AndroidIME/app/build/outputs/apk/debug/app-debug.apk
```

## 安装到设备

### 方式一：通过 ADB 安装

```bash
# 连接设备后
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

### 方式二：复制到设备

直接复制 `app-debug.apk` 到设备，然后点击安装。

## 常见问题

### 1. 找不到 Gradle 下载慢？

使用国内镜像，修改 `build.gradle` 或 `settings.gradle` 添加镜像：

```gradle
repositories {
    maven { url 'https://maven.aliyun.com/repository/google' }
    maven { url 'https://maven.aliyun.com/repository/central' }
    maven { url 'https://maven.aliyun.com/repository/public' }
    maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
}
```

### 2. 网络问题？

设置代理：

```bash
export GRADLE_OPTS="-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=7890"
```

### 3. Android SDK 路径？

设置环境变量：

```bash
export ANDROID_HOME=/path/to/android/sdk
export ANDROID_SDK_ROOT=/path/to/android/sdk
```

## Release 版本

如需签名，修改签名的 Release APK，需要配置签名：

1. 在 `app/build.gradle` 配置签名
2. 运行 `./gradlew assembleRelease`
