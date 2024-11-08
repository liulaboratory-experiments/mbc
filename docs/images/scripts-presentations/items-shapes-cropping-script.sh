#!/bin/bash

# Directory containing the images
image_dir="/Users/jouta1/github-projects/mbc/docs/images/item-shapes"
output_dir="/Users/jouta1/github-projects/mbc/docs/images/images-cropped"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each PNG file in the directory
for image in "$image_dir"/*.png; do
  # Check if the file exists (to handle cases where no .png files are found)
  if [[ -f "$image" ]]; then
    # Get the filename without the directory
    filename=$(basename "$image")
    
    # Use ImageMagick to trim whitespace based on the square shape content and output to the new directory
    magick "$image" -fuzz 10% -trim +repage "$output_dir/$filename"
  else
    echo "No .png files found in $image_dir"
  fi
done