#!/bin/bash
source ~/color.sh  # Ensure color.sh contains variables like ${cyan}, ${blue}, ${reset}

echo -e "${cyan}Enter YouTube Video URL (Example: https://youtu.be/BgZ0_paJ9nc)${reset}"
echo -ne "${blue}Enter URL: ${reset}"
read url

# Default save path
default_path="/sdcard/Downloads"
audio_quality=128K

# URL input validation
if [ -z "$url" ]; then
  echo -e "${red}Error: No URL provided.${reset}"
  exit 1
fi

# Ask for saving directory
echo -e "${cyan}Press Enter to save in default directory: ${default_path}${reset}\n"
echo -ne "${blue}Enter saving path: ${reset}"
read path

# Use default path if input is empty
if [ -z "$path" ]; then
  path="$default_path"
else
  mkdir -vp "$path"
fi

# Download process
echo -e "${green}Downloading MP3...${reset}"
yt-dlp -f "bestaudio[ext=m4a]" \
      "$url" \
      --extract-audio \
      --audio-format mp3 \
      --audio-quality "$audio_quality" \
      -o "${path}/%(title)s.%(ext)s"

echo -e "${green}Download completed!${reset}"
