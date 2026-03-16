#!/bin/bash

export ANDROID_HOME="$(pwd)"/.android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
unset ANDROID_SDK_ROOT

# sdkmanager --version
# sdkmanager --list

# Accept Android licenses
sdkmanager --licenses

# Get the Android stuff
sdkmanager --sdk_root="$ANDROID_HOME" "platform-tools" \
                                      "build-tools;35.0.0" \
                                      "emulator" \
                                      "sources;android-35" \
                                      "platforms;android-35" \
                                      "system-images;android-35;default;x86_64"

# Create folder for Android virtual devices
mkdir -v "$ANDROID_HOME/avd"
