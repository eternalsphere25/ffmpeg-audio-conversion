#------------------------------------------------------------------------------
# Explanation of command line arguments:
# 
# -vn       Disables video input (ffmpeg will interpret artwork as video)
# -c:v copy Copies the video stream as-is (album art is considered video)
# -q:a n    Uses VBR (valid values of n are from 0.1-2.0)
# -b:a n    Uses CBR (valid values of n are 96k, 128k, 192k etc)
#
# For more information:
# https://trac.ffmpeg.org/wiki/Encode/AAC#NativeFFmpegAACEncoder
# https://ffmpeg.org/ffmpeg-all.html#aac
#------------------------------------------------------------------------------

#Define variables (input)
$Source_Directory = Read-Host -Prompt "Enter source directory"
$Output_Directory = Read-Host -Prompt "Enter destination directory"
#$Output_Format = Read-Host -Prompt "Enter output format (mp3, m4a, flac etc)"

#Convert file to AAC
Get-ChildItem -Path $Source_Directory | ForEach-Object -Process `
{ffmpeg -i $_.fullname -c:v copy -q:a 1.5 ($Output_Directory + "\" + `
($_.Basename) + ".m4a")}