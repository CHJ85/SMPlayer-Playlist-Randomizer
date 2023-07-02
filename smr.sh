#!/bin/bash

playlist="$1"

if [[ -z "$playlist" ]]; then
  echo "Usage: $0 /path/to/playlist.m3u"
  exit 1
fi

# Check if SMPlayer is installed
if ! command -v smplayer &> /dev/null; then
  echo "SMPlayer is not installed. Please install SMPlayer and try again."
  exit 1
fi

# Shuffle the playlist
shuffled_playlist="/tmp/shuffled_playlist.m3u"
sort -R "$playlist" > "$shuffled_playlist"

# Open SMPlayer with the shuffled playlist
smplayer "$shuffled_playlist"
