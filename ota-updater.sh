#!/bin/bash

# === CONFIG ===
LOCAL_VERSION="CoopsOS-v2025-05-26-6328"
VERSION_FILE_URL="https://raw.githubusercontent.com/CoopsOS/ota/main/version.txt"
OTA_PACKAGE_URL="https://raw.githubusercontent.com/CoopsOS/ota/main/update.zip"
TMPDIR="${TMPDIR:-$HOME/tmp}"
mkdir -p "$TMPDIR"

echo "🌐 Checking for latest OTA..."

# Fetch latest version
REMOTE_VERSION=$(curl -s "$VERSION_FILE_URL")

if [[ "$REMOTE_VERSION" == *"<html>"* ]]; then
  echo "❌ Failed to fetch OTA info. Check your URL or repo visibility."
  exit 1
fi

echo "🔍 Local version: $LOCAL_VERSION"
echo "🔍 Remote version: $REMOTE_VERSION"

if [ "$REMOTE_VERSION" != "$LOCAL_VERSION" ]; then
  echo "⬇️  New update found: $REMOTE_VERSION"
  echo "📥 Downloading OTA package..."
  curl -L -o "$TMPDIR/ota-update.zip" "$OTA_PACKAGE_URL"
  
  echo "📂 Extracting OTA..."
  unzip -o "$TMPDIR/ota-update.zip" -d ~/Coops/
  
  echo "✅ OTA Update Applied!"
  echo "💾 Please reboot the device for changes to take effect."
else
  echo "✅ CoopsOS is already up to date."
fi
