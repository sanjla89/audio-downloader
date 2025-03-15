#!/bin/bash

# User se playlist URL input le
read -p "Enter playlist URL: " playlist_url

# Agar URL nahi diya gaya
if [ -z "$playlist_url" ]; then
    echo "Error: No URL provided."
    exit 1
fi

# Playlist ke videos list dikhaye
yt-dlp --flat-playlist "$playlist_url"

# User se starting aur ending video number le
read -p "Enter starting video number: " starting
read -p "Enter ending video number: " ending

# MP3 download kare
yt-dlp --yes-playlist \
    --playlist-start "$starting" \
    --playlist-end "$ending"  \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 128K \
    -o "/sdcard/Downloads/%(playlist)s/%(title)s.%(ext)s" \
    "$playlist_url"

echo "Download Complete!"
