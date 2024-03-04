#------------------------------------------------------------------------------
# Explanation of command line arguments:
# 
# -i <file>     Input file path
# -c:v copy     Copies the video stream as-is (album art is considered video)
# -c:a libopus  Specifies the libopus codec 
# -vbr on       Uses VBR
# -b:a n        Sets bitrate
#
# For more information:
# https://www.ffmpeg.org/ffmpeg-codecs.html#libopus-1
#------------------------------------------------------------------------------

#Define variables (input)
$Source_Directory = Read-Host -Prompt "Enter source directory"
$Output_Directory = Read-Host -Prompt "Enter destination directory"

#Convert files to Opus
Get-ChildItem -Path $Source_Directory | ForEach-Object -Process `
{ffmpeg -i $_.fullname -c:v copy -c:a libopus -vbr on -b:a 128k `
($Output_Directory + "\" + ($_.Basename) + ".opus")}