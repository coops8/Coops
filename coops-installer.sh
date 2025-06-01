#!/bin/bash

echo "📦 Installing CoopsOS core components..."

# Make directories
mkdir -p ~/Coops/bin
mkdir -p ~/Coops/ota

# Download the OTA Updater Script
curl -L -o ~/Coops/bin/ota-updater.sh https://raw.githubusercontent.com/CoopsOS/ota/main/ota-updater.sh
chmod +x ~/Coops/bin/ota-updater.sh

# Set up a cron or at-job (optional)
# echo "@daily ~/Coops/bin/ota-updater.sh" >> ~/.crontab

echo "✅ CoopsOS environment installed."
echo "🚀 Launching OTA Updater..."
bash ~/Coops/bin/ota-updater.sh
