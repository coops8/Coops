#!/data/data/com.termux/files/usr/bin/bash

echo "🧠 CoopsGPT Terminal Assistant Activated!" | lolcat
echo "Type your question or command. Type 'exit' to quit." | lolcat
while true; do
  read -p "🤖 You: " input
  if [[ "$input" == "exit" ]]; then
    echo "👋 Exiting CoopsGPT. See you soon!" | lolcat
    break
  elif [[ "$input" == coops* ]]; then
    echo "⚙️ Running CoopsOS command: $input" | lolcat
    bash coops-hq.sh $input
  elif [[ "$input" == help ]]; then
    echo "Available Commands:"
    echo "- status"
    echo "- update"
    echo "- version"
    echo "- changelog"
    echo "- secure"
    echo "- devmode"
  else
    echo "🧠 (Simulated AI): That's a good question! Imagine I answered it perfectly 😉" | lolcat
  fi
done
