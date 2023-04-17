#------------------------------------------------------------------------------
# Explanation of command line arguments:
# 
# -vn       Disables video input (ffmpeg will interpret artwork as video)
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
$File_Name = Read-Host -Prompt "Enter file name"
#$Output_Format = Read-Host -Prompt "Enter output format (mp3, m4a, flac etc)"

#Assemble strings for input/output
$Input_File = $Source_Directory + "\" + $File_Name
$Output_File = $Output_Directory + "\" + ($File_Name.split('.')[0]) + ".m4a"

#Convert file to AAC
ffmpeg -i $Input_File -vn -q:a 2 $Output_File