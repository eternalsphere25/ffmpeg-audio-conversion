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
$File_Path = Read-Host -Prompt "Enter full file path"
$Output_Directory = Read-Host -Prompt "Enter destination directory"

#Assemble strings for input/output
$Output_File = $Output_Directory + "\" + ( `
Get-Item $File_Path).Basename + ".opus"

#Convert file to Opus
ffmpeg -i (Get-Item $File_Path) -c:v copy -c:a libopus -vbr on -b:a 128k `
$Output_File