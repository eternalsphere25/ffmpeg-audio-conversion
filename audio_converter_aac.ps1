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
$File_Path = Read-Host -Prompt "Enter full file path"
$Output_Directory = Read-Host -Prompt "Enter destination directory"

#Assemble strings for input/output
$Output_File = $Output_Directory + "\" + (Get-Item $File_Path).Basename + ".m4a"

#Convert file to AAC
ffmpeg -i (Get-Item $File_Path) -c:v copy -q:a 1.5 $Output_File