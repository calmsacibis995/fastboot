# Copyright (C) 2007 Google Inc.
# Copyright (C) 2023 Stefanos Stefanidis.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# What platform are we building fastboot for?
#
HOST_OS = $(shell uname -s)

MKBOOTIMG := ../depends/mkbootimg
DEP_INCS:= ../include
CMN_SRCS := protocol.c engine.c bootimg.c fastboot.c 
OUTPUT_BIN := fastboot

ifeq ($(HOST_OS),Linux)
  LOCAL_SRC_FILES += usb_linux.c util_linux.c
endif

ifeq ($(HOST_OS),Darwin)
  MACHDEP_SRCS += usb_osx.c util_osx.c
  MACHDEP_LDLIBS += -lpthread -framework CoreFoundation -framework IOKit -framework Carbon
endif

ifeq ($(HOST_OS),Linux)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := usbtest.c usb_linux.c
LOCAL_MODULE := usbtest
include $(BUILD_HOST_EXECUTABLE)
endif

all: fastboot

fastboot:
	$(CC) -o $(OUTPUT_BIN) $(CMN_SRCS) $(MACHDEP_SRCS) -I$(DEP_INCS) -I$(MKBOOTIMG) \
  $(MACHDEP_LDLIBS) -L../depends/libzipfile -lzipfile -lz

clean:
	rm $(OUTPUT_BIN)
