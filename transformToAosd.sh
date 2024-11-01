#!/bin/bash

# Ensure to have jq installed on your system to run this script

echo "Starting the transformation process..."

input_file="bom.json"
output_file="output.json"

if [ -f "$input_file" ]; then
    echo "Processing $input_file..."
    
    jq -f ./transformToAosd.jq $input_file |
     tee $output_file

    echo "Transformation complete. Output saved to $output_file."
else
    echo "Input file $input_file not found."
fi

echo "Script execution finished."