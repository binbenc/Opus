LOCAL_PATH := $(call my-dir)
# 固定保存工程根目录，避免 include 其他 mk 后 LOCAL_PATH 变化影响路径解析
TOP_LOCAL_PATH := $(LOCAL_PATH)

# 设置平台版本（修复警告）

# 编译 libogg（静态库）
include $(CLEAR_VARS)
LOCAL_MODULE := ogg_static
LOCAL_SRC_FILES := \
    $(TOP_LOCAL_PATH)/ogg/src/bitwise.c \
    $(TOP_LOCAL_PATH)/ogg/src/framing.c
LOCAL_C_INCLUDES := $(TOP_LOCAL_PATH)/ogg/include
LOCAL_CFLAGS := -O2
include $(BUILD_STATIC_LIBRARY)

# 编译 libogg（共享库）
include $(CLEAR_VARS)
LOCAL_MODULE := ogg
LOCAL_SRC_FILES := \
    $(TOP_LOCAL_PATH)/ogg/src/bitwise.c \
    $(TOP_LOCAL_PATH)/ogg/src/framing.c
LOCAL_C_INCLUDES := $(TOP_LOCAL_PATH)/ogg/include
LOCAL_CFLAGS := -O2
include $(BUILD_SHARED_LIBRARY)

# 编译 libopus（使用子目录的 Android.mk）
include $(LOCAL_PATH)/opus/Android.mk

# 重新恢复到当前目录，避免 include 后 LOCAL_PATH 停留在 opus/ 下
LOCAL_PATH := $(TOP_LOCAL_PATH)

# 编译 libopusenc
include $(CLEAR_VARS)
LOCAL_MODULE := opusenc

LOCAL_SRC_FILES := \
    $(TOP_LOCAL_PATH)/libopusenc/src/opusenc.c \
    $(TOP_LOCAL_PATH)/libopusenc/src/opus_header.c \
    $(TOP_LOCAL_PATH)/libopusenc/src/picture.c \
    $(TOP_LOCAL_PATH)/libopusenc/src/ogg_packer.c \
    $(TOP_LOCAL_PATH)/libopusenc/src/resample.c \
    $(TOP_LOCAL_PATH)/libopusenc/src/unicode_support.c

LOCAL_STATIC_LIBRARIES := ogg_static
LOCAL_SHARED_LIBRARIES := opus
LOCAL_LDLIBS := -lm -llog

# 关键：正确包含所有头文件路径
LOCAL_C_INCLUDES := \
    $(TOP_LOCAL_PATH)/libopusenc/include \
    $(TOP_LOCAL_PATH)/libopusenc/src \
    $(TOP_LOCAL_PATH)/opus/include \
    $(TOP_LOCAL_PATH)/ogg/include \
    $(TOP_LOCAL_PATH)/opus

LOCAL_CFLAGS := -DHAVE_OGG -DOUTSIDE_SPEEX -DRANDOM_PREFIX=oe_ -O2 \
    -DPACKAGE_NAME=\"libopusenc\" \
    -DPACKAGE_VERSION=\"0.2.1\"

include $(BUILD_SHARED_LIBRARY)