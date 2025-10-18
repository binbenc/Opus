# Opus Audio Codec for Android NDK

[![Android](https://img.shields.io/badge/Platform-Android-green.svg)](https://developer.android.com/)
[![NDK](https://img.shields.io/badge/Build-NDK-blue.svg)](https://developer.android.com/ndk/)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-yellow.svg)](https://opensource.org/licenses/BSD-3-Clause)

This project provides pre-compiled Opus audio codec libraries for Android NDK, including support for multiple architectures (armeabi-v7a, arm64-v8a, x86, x86_64).

## 📋 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Usage](#-usage)
- [API Documentation](#-api-documentation)
- [Building](#-building)
- [Contributing](#-contributing)
- [License](#-license)
- [Acknowledgments](#-acknowledgments)

## ✨ Features

- **Multiple Architecture Support**: Build for armeabi-v7a, arm64-v8a, x86, x86_64
- **Complete Codec Stack**: Includes libogg, libopus, and libopusenc
- **Android NDK Integration**: Easy integration with Android projects
- **Optimized Performance**: Compiled with -O2 optimization flags
- **Latest Versions**: Uses Opus 1.5.2, libopusenc 0.2.1, and libogg 1.3.6

## 📋 Requirements

- **Android NDK**: r21 or later
- **Android API Level**: 21 (Android 5.0) or higher
- **NDK Build System**: Uses ndk-build

## 🚀 Installation

### Method 1: Direct Integration

1. Clone this repository:
```bash
git clone https://github.com/yourusername/opus-android.git
cd opus-android
```

2. Copy the following files to your Android project:
   - `Android.mk` to your `jni/` directory
   - `Application.mk` to your `jni/` directory
   - Source directories: `ogg/`, `opus/`, `libopusenc/`

### Method 2: Pre-built Libraries

1. Use the pre-compiled libraries from the `libs/` directory
2. Add them to your Android project's `jniLibs/` folder

## 📖 Usage

### Basic Encoding Example

```c
#include <opusenc.h>
#include <ogg/ogg.h>

// Initialize encoder
OggOpusEnc *enc = ope_encoder_create_file("output.opus",
                                          48000, 2, 0, NULL);
if (!enc) {
    // Handle error
}

// Encode audio data
ope_encoder_write(enc, pcm_data, frame_size);

// Clean up
ope_encoder_drain(enc);
ope_encoder_destroy(enc);
```

### Basic Decoding Example

```c
#include <opus/opus.h>

// Create decoder
OpusDecoder *decoder = opus_decoder_create(48000, 2, NULL);
if (!decoder) {
    // Handle error
}

// Decode audio data
int decoded_samples = opus_decode(decoder,
                                  opus_packet,
                                  packet_length,
                                  pcm_output,
                                  max_frame_size,
                                  0);

// Clean up
opus_decoder_destroy(decoder);
```

### Integration in Android.mk

```makefile
# Include in your Android.mk
include $(CLEAR_VARS)
LOCAL_MODULE    := your-native-module
LOCAL_SRC_FILES := your-native-code.c
LOCAL_SHARED_LIBRARIES := opus opusenc ogg
LOCAL_LDLIBS    := -llog -lm
include $(BUILD_SHARED_LIBRARY)
```

## 📚 API Documentation

### Core Functions

- **`ope_encoder_create_file()`**: Create OggOpus encoder for file output
- **`ope_encoder_write()`**: Write PCM data to encoder
- **`ope_encoder_drain()`**: Flush remaining data
- **`opus_decoder_create()`**: Create Opus decoder
- **`opus_decode()`**: Decode Opus packet to PCM

For complete API reference, see:
- [Opus Documentation](https://opus-codec.org/docs/)
- [libopusenc Documentation](https://opus-codec.org/docs/libopusenc/)

## 🔨 Building

### Prerequisites

```bash
# Ensure Android NDK is installed
export NDK_PATH=/path/to/android-ndk
export PATH=$PATH:$NDK_PATH
```

### Build Commands

```bash
# Build all architectures
ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=Android.mk

# Build specific architecture
ndk-build NDK_PROJECT_PATH=. APP_ABI=arm64-v8a

# Clean build
ndk-build clean
```

### Build Output

Compiled libraries will be placed in:
```
libs/
├── armeabi-v7a/
│   ├── libogg.so
│   ├── libopus.so
│   └── libopusenc.so
├── arm64-v8a/
│   ├── libogg.so
│   ├── libopus.so
│   └── libopusenc.so
├── x86/
│   ├── libogg.so
│   ├── libopus.so
│   └── libopusenc.so
└── x86_64/
    ├── libogg.so
    ├── libopus.so
    └── libopusenc.so
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

The underlying libraries have their own licenses:
- **Opus**: BSD 3-Clause License
- **libogg**: BSD 3-Clause License
- **libopusenc**: BSD 3-Clause License

## 🙏 Acknowledgments

- [Opus Codec Team](https://opus-codec.org/) for the excellent audio codec
- [Xiph.Org Foundation](https://xiph.org/) for Ogg container format
- Android NDK team for the native development toolkit

---

# Opus 音频编解码器 Android NDK 版

[![Android](https://img.shields.io/badge/平台-Android-green.svg)](https://developer.android.com/)
[![NDK](https://img.shields.io/badge/构建-NDK-blue.svg)](https://developer.android.com/ndk/)
[![许可证](https://img.shields.io/badge/许可证-BSD%203--Clause-yellow.svg)](https://opensource.org/licenses/BSD-3-Clause)

本项目为 Android NDK 提供预编译的 Opus 音频编解码库，支持多种架构（armeabi-v7a、arm64-v8a、x86、x86_64）。

## 📋 目录

- [功能特性](#-功能特性)
- [系统要求](#-系统要求)
- [安装方法](#-安装方法)
- [使用方法](#-使用方法)
- [API 文档](#-api-文档)
- [编译构建](#-编译构建)
- [贡献指南](#-贡献指南)
- [许可证](#-许可证)
- [致谢](#-致谢)

## ✨ 功能特性

- **多架构支持**: 支持 armeabi-v7a、arm64-v8a、x86、x86_64 架构
- **完整编解码栈**: 包含 libogg、libopus 和 libopusenc
- **Android NDK 集成**: 与 Android 项目轻松集成
- **性能优化**: 使用 -O2 优化标志编译
- **最新版本**: 使用 Opus 1.5.2、libopusenc 0.2.1 和 libogg 1.3.6

## 📋 系统要求

- **Android NDK**: r21 或更高版本
- **Android API 级别**: 21 (Android 5.0) 或更高
- **NDK 构建系统**: 使用 ndk-build

## 🚀 安装方法

### 方法 1: 直接集成

1. 克隆此仓库：
```bash
git clone https://github.com/yourusername/opus-android.git
cd opus-android
```

2. 将以下文件复制到您的 Android 项目：
   - `Android.mk` 复制到您的 `jni/` 目录
   - `Application.mk` 复制到您的 `jni/` 目录
   - 源码目录：`ogg/`、`opus/`、`libopusenc/`

### 方法 2: 预编译库

1. 使用 `libs/` 目录中的预编译库
2. 将它们添加到您的 Android 项目的 `jniLibs/` 文件夹

## 📖 使用方法

### 基础编码示例

```c
#include <opusenc.h>
#include <ogg/ogg.h>

// 初始化编码器
OggOpusEnc *enc = ope_encoder_create_file("output.opus",
                                          48000, 2, 0, NULL);
if (!enc) {
    // 处理错误
}

// 编码音频数据
ope_encoder_write(enc, pcm_data, frame_size);

// 清理资源
ope_encoder_drain(enc);
ope_encoder_destroy(enc);
```

### 基础解码示例

```c
#include <opus/opus.h>

// 创建解码器
OpusDecoder *decoder = opus_decoder_create(48000, 2, NULL);
if (!decoder) {
    // 处理错误
}

// 解码音频数据
int decoded_samples = opus_decode(decoder,
                                  opus_packet,
                                  packet_length,
                                  pcm_output,
                                  max_frame_size,
                                  0);

// 清理资源
opus_decoder_destroy(decoder);
```

### 在 Android.mk 中集成

```makefile
# 在您的 Android.mk 中包含
include $(CLEAR_VARS)
LOCAL_MODULE    := your-native-module
LOCAL_SRC_FILES := your-native-code.c
LOCAL_SHARED_LIBRARIES := opus opusenc ogg
LOCAL_LDLIBS    := -llog -lm
include $(BUILD_SHARED_LIBRARY)
```

## 📚 API 文档

### 核心函数

- **`ope_encoder_create_file()`**: 创建用于文件输出的 OggOpus 编码器
- **`ope_encoder_write()`**: 向编码器写入 PCM 数据
- **`ope_encoder_drain()`**: 刷新剩余数据
- **`opus_decoder_create()`**: 创建 Opus 解码器
- **`opus_decode()`**: 将 Opus 数据包解码为 PCM

完整 API 参考请参见：
- [Opus 文档](https://opus-codec.org/docs/)
- [libopusenc 文档](https://opus-codec.org/docs/libopusenc/)

## 🔨 编译构建

### 前置条件

```bash
# 确保 Android NDK 已安装
export NDK_PATH=/path/to/android-ndk
export PATH=$PATH:$NDK_PATH
```

### 构建命令

```bash
# 构建所有架构
ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=Android.mk

# 构建特定架构
ndk-build NDK_PROJECT_PATH=. APP_ABI=arm64-v8a

# 清理构建
ndk-build clean
```

### 构建输出

编译后的库将放置在：
```
libs/
├── armeabi-v7a/
│   ├── libogg.so
│   ├── libopus.so
│   └── libopusenc.so
├── arm64-v8a/
│   ├── libogg.so
│   ├── libopus.so
│   └── libopusenc.so
├── x86/
│   ├── libogg.so
│   ├── libopus.so
│   └── libopusenc.so
└── x86_64/
    ├── libogg.so
    ├── libopus.so
    └── libopusenc.so
```

## 🤝 贡献指南

欢迎贡献代码！请随时提交 Pull Request。对于重大更改，请先创建 issue 讨论您想要更改的内容。

### 开发环境设置

1. Fork 此仓库
2. 创建您的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 📄 许可证

本项目采用 BSD 3-Clause 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件。

底层库有自己的许可证：
- **Opus**: BSD 3-Clause 许可证
- **libogg**: BSD 3-Clause 许可证
- **libopusenc**: BSD 3-Clause 许可证

## 🙏 致谢

- [Opus Codec 团队](https://opus-codec.org/) 提供的出色音频编解码器
- [Xiph.Org 基金会](https://xiph.org/) 提供的 Ogg 容器格式
- Android NDK 团队提供的原生开发工具包

---

<div align="center">

**⭐ 如果这个项目对您有帮助，请给我们一个 Star！**

Made with ❤️ for Android Audio Development

</div>