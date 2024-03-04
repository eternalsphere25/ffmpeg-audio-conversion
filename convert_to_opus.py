import subprocess
from pathlib import Path


def clean_up_path_str(input_str):
    if (input_str.startswith('"') == True 
        and input_str.endswith('"') == True):
        path_out = Path(input_str[1:-1])
    else:
        path_out = Path(input_str)
    return path_out


#------------------------------------------------------------------------------
# STEP 0: Define global variables
#------------------------------------------------------------------------------

kid3_cli_path = Path(fr"Z:\その他\Software Tools\kid3-3.9.5-win32-x64", 
                     "kid3-cli.exe")


#------------------------------------------------------------------------------
# STEP 1: Convert file to Opus
#------------------------------------------------------------------------------

# Input file location and output drectory
file_path_str = input("Enter full file path: ")
output_dir_str = input("Enter destination directory: ")

# Convert strings to path objects
file_path = clean_up_path_str(file_path_str)
output_dir = clean_up_path_str(output_dir_str)

# Set output file
output_file = Path(output_dir, f"{file_path.stem}.opus")

# Input command and break up into list
args = (f"-c:v copy -c:a libopus -vbr on -b:a 128k")
args = args.split(" ")
args.append(output_file)
program = ["ffmpeg", "-i", file_path]
command = program + args

# Convert file to Opus
subprocess.run(command)


#------------------------------------------------------------------------------
# STEP 2: Add album art
#------------------------------------------------------------------------------

# Extract album art from source file
album_art = Path(output_dir, f"temp.jpg")
args = [kid3_cli_path, "-c", f"get picture:'{album_art}'", f"{file_path}"]
print("Extracting album art from source file...")
subprocess.run(args)

# Add extractd album art to Opus file
args = [kid3_cli_path, "-c", f"set picture:'{album_art}' ''", f"{output_file}"]
print("Embedding album art into Opus file...")
subprocess.run(args)

# Delete temp image file
album_art.unlink()