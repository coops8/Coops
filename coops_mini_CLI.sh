#!/data/data/com.termux/files/usr/bin/bash

echo "Welcome to Coops Rebooter"
echo "Choose an option:"
echo "1) Reboot Coops OS"
echo "2) Boot into Recovery"
read choice

if [ "$choice" = "1" ]; then
  echo "Rebooting..."
elif [ "$choice" = "2" ]; then
  echo "Entering Recovery Mode..."
else
  echo "Invalid Option"
fi
