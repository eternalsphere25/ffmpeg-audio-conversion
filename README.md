## Overview
This repository contains a bunch of useful scripts for batch audio conversion. The Powershell scripts only require FFmpeg, while the Python Opus scripts require both FFmpeg and Kid3 (FFmpeg does not yet support encoding album art into Opus files, so Kid3 is used to fill in the gap).

## Lossless Formats
* FLAC (batch)
  - Default: Compression Level 5

## Lossy Formats
* AAC (single file, batch)
  - Default: Quality 1.5
* Opus (single file, batch)
  - Default: 128 kbps

## Software Used
* FFmpeg: https://www.ffmpeg.org/download.html
* Kid3: https://kid3.kde.org/
