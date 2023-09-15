#!/bin/sh
set -e

URL_SDK="https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip"

DEBIAN_FRONTEND="noninteractive" sudo apt update &&
    sudo apt install --no-install-recommends -y openjdk-22-jdk-headless unzip wget &&
    apt clean

mkdir -p "$ANDROID_HOME/$FOLDER"
chown -R "$_REMOTE_USER:$_REMOTE_USER" "$ANDROID_HOME"

su - "$_REMOTE_USER"

wget -q "$URL_SDK" -O sdk.zip
unzip -q sdk.zip -d "$ANDROID_HOME/$FOLDER/latest"
rm -rf sdk.zip
