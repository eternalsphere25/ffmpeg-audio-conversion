#------------------------------------------------------------------------------
# Explanation of command line arguments:
# 
# -vn       Disables video input (ffmpeg will interpret artwork as video)
# -c:v copy Copies the video stream as-is (album art is considered video)
# -q:a n    Uses VBR (valid values of n are from 0.1-2.0)
# -b:a n    Uses CBR (valid values of n are 96k, 128k, 192k etc)
#
# For more information:
# https://ffmpeg.org/ffmpeg-all.html#flac-2
#------------------------------------------------------------------------------

#Define variables (input)
$Source_Directory = Read-Host -Prompt "Enter source directory"
$Output_Directory = $Source_Directory + "-flac"
#$Output_Directory = Read-Host -Prompt "Enter destination directory"
#$Output_Format = Read-Host -Prompt "Enter output format (mp3, m4a, flac etc)"

#Make output directory
New-Item -Path (Split-Path -Path $Source_Directory) -Name ((Split-Path -Path $Source_Directory -Leaf) + "-flac") -ItemType "Directory"

#Convert file to FLAC
Get-ChildItem -Path $Source_Directory | ForEach-Object -Process `
{ffmpeg -i $_.fullname -c:v copy -compression_level 5 `
($Output_Directory + "\" + ($_.name.split('.')[0]) + ".flac")}