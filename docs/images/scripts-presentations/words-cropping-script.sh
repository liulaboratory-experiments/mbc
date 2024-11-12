#!/bin/bash

# Directory containing the images
image_dir="/Users/jouta1/github-projects/mbc-free-sort/docs/images/keynote/items"

# Loop through each PNG file in the directory
for image in "$image_dir"/*.png; do
  # Use ImageMagick to trim whitespace based on content and output the cropped image
  convert "$image" -fuzz 10% -trim +repage "$image"
done