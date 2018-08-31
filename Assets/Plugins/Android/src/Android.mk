include $(CLEAR_VARS)

OPENCV_SDK_ROOT:=/fill/me/in
OPENCV_INSTALL_MODULES:=on
include $(OPENCV_SDK_ROOT)/sdk/native/jni/OpenCV.mk

# override strip command to strip all symbols from output library; no need to ship with those..
# cmd-strip = $(TOOLCHAIN_PREFIX)strip $1 

LOCAL_ARM_MODE  := arm
LOCAL_PATH      := $(NDK_PROJECT_PATH)
LOCAL_MODULE    := libnative
LOCAL_CFLAGS    := -Werror
LOCAL_SRC_FILES := NativeCode.cc camera_wrapper.cc
LOCAL_LDLIBS    := -llog -lGLESv2 -lcamera2ndk -lmediandk

include $(BUILD_SHARED_LIBRARY)
