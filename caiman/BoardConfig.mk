#
# Copyright (C) 2020 The Android Open-Source Project
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

TARGET_BOARD_INFO_FILE := device/google/caimito/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := caiman
TARGET_SCREEN_DENSITY := 480
BOARD_USES_GENERIC_AUDIO := true
USES_DEVICE_GOOGLE_CAIMITO := true

RELEASE_GOOGLE_PRODUCT_RADIO_DIR := $(RELEASE_GOOGLE_CAIMAN_RADIO_DIR)
RELEASE_GOOGLE_PRODUCT_RADIOCFG_DIR := $(RELEASE_GOOGLE_CAIMAN_RADIOCFG_DIR)
RELEASE_GOOGLE_PRODUCT_NTNRADIO_DIR := $(RELEASE_GOOGLE_CAIMAN_NTNRADIO_DIR)

include device/google/caimito/device-caimito-common.mk

include device/google/zumapro/BoardConfig-common.mk
-include vendor/google_devices/zumapro/prebuilts/BoardConfigVendor.mk
include device/google/gs-common/check_current_prebuilt/check_current_prebuilt.mk
-include vendor/google_devices/caiman/proprietary/BoardConfigVendor.mk
include device/google/caimito/sepolicy/caiman-sepolicy.mk
include device/google/caimito/wifi/BoardConfig-wifi.mk

ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
-include device/google/common/etm/6_1/BoardUserdebugModules.mk
endif

DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/caiman
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigDerpFest.mk
