#!/data/data/com.termux/files/usr/bin/bash

VERSION=$(cat version.txt)
OTA_ZIP=$(ls output/CoopsOS-OTA-*.zip | tail -n1)
CHANGELOG=$(cat CHANGELOG.md | sed -n "/## $VERSION/,/---/p")

echo "Pushing GitHub release for $VERSION..." | lolcat

gh release create "$VERSION" "$OTA_ZIP" \
  --title "$VERSION" \
  --notes "$CHANGELOG"

echo "Release published: $VERSION" | lolcat
  cd ~/Coops && git pull origin main
  sleep 1

#!/data/data/com.termux/files/usr/bin/bash

echo "🔼 Pushing updates to GitHub..." | lolcat
cd ~/Coops || exit 1
git add .
git commit -m "🚀 CoopsOS Auto Push: $(date)"
git push origin main
