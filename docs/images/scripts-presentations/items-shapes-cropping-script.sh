#!/bin/bash

# Directory containing the images
image_dir="/Users/jouta1/github-projects/mbc/docs/images/rounded"
output_dir="/Users/jouta1/github-projects/mbc/docs/images/items-shapes-rounded"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Initialize a counter for naming output files
counter=1

# Loop through each PNG file in the directory
for image in "$image_dir"/*.png; do
  # Check if the file exists (to handle cases where no .png files are found)
  if [[ -f "$image" ]]; then
    # Set output filename with the counter (e.g., img1.png, img2.png)
    output_filename="img${counter}.png"
    
    # Use ImageMagick to trim whitespace based on the square shape content and output to the new directory
    magick "$image" -fuzz 10% -trim +repage "$output_dir/$output_filename"
    
    # Increment the counter for the next file
    ((counter++))
  else
    echo "No .png files found in $image_dir"
  fi
done