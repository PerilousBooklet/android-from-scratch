#!/bin/bash

# To enable exclusion in the mv command at line 12
shopt -s extglob

# Create SDK folder
mkdir -vp .android/sdk

# Download the Android CLI tools
wget "https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip"
unzip commandlinetools-linux-13114758_latest.zip -d .android/sdk/
rm -v commandlinetools-linux-13114758_latest.zip

# ?
mkdir -vp ./.android/sdk/cmdline-tools/latest
mv .android/sdk/cmdline-tools/!(latest) .android/sdk/cmdline-tools/latest/

# Get Android stuff
./get_android_stuff.sh

# Generate the project template
./generate_base_project_template.sh
