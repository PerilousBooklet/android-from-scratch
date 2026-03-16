#!/bin/bash

# Set env vars
export ANDROID_HOME="$(pwd)"/.android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/build-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools
unset ANDROID_SDK_ROOT

# Go to source code folder
cd src || exit

# Build the Android app
./gradlew clean assembleDebug

# Create a virtual smartphone
cd .. || exit
avdmanager create avd --force \
                      --name android35 \
                      --abi default/x86_64 \
                      --package 'system-images;android-35;default;x86_64' \
                      --path "$ANDROID_HOME/avd/android35"

# Boot the virtual smartphone
emulator -avd android35

# Install the Android app
# NOTE: for some reason this command doesn't work, so just drag and drop the .apk file into the emulator window
# TODO: write to the Android developers to ask how to write a proper `adb install` command
# adb install -r ./src/app/build/outputs/apk/debug/app-debug.apk

# Run the Android app
# adb shell am start -n com.nl.notes/com.nl.notes.MainActivity
