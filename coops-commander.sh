#!/data/data/com.termux/files/usr/bin/bash
if [[ "$CMD" == *"coops-rom123654"* ]]; then
  echo "🔐 Verified remote dev command"
  # execute
else
  echo "❌ Unauthorized remote command"
  exit 1
fi
REPO_PATH="$HOME/CoopsOSRepo"
COMMAND_FILE="$REPO_PATH/remote-control/command.txt"
OUTPUT_FILE="$REPO_PATH/remote-control/output.log"

echo "🛰️ Checking GitHub for new Coops commands..." | lolcat

cd $REPO_PATH || exit 1

# Pull latest
git pull origin main

if [ -f "$COMMAND_FILE" ]; then
  CMD=$(cat "$COMMAND_FILE")
  echo "⚙️ Executing remote command: $CMD" | lolcat

  bash -c "$CMD" > "$OUTPUT_FILE" 2>&1
  echo "[✔️] Command completed. Logging output..." | lolcat

  # Optional: Push back the results
  git add "$OUTPUT_FILE"
  git commit -m "Remote command output $(date '+%Y-%m-%d %H:%M:%S')"
  git push origin main
else
  echo "🟡 No remote command found." | lolcat
fi
