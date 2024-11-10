#!/bin/bash

# Ensure to have jq installed on your system to run this script

echo "Starting the transformation process..."

input_file="./inputs/identity-frontend-sbom.json"
output_file="./results/identity-frontend-aosd.json"
license_summary="./results/identity-frontend-licenseSummary.json"

if [ -f "$input_file" ]; then
    echo "Processing $input_file..."
    
    # (1) Transform the input SBOM to the AOSD format
    echo "Transforming SBOM to AOSD format..."

    # (1.1) Transform the SBOM to the AOSD format
    jq -f ./transformToAosd.jq $input_file | 
      # (1.2) Add license priorities
      jq -f ./addLicensePrio.jq |
      # (1.3) Reduce to one license per dependency based on set priorities
      jq -f ./reduceToOneLicense.jq |
      # (1.4) Add parts
      jq -f ./addParts.jq |
      tee $output_file

    echo "Transformation complete. Output saved to $output_file."

    # (3) Extract unique licenses from the transformed AOSD file
    echo "Extracting unique licenses..."

    jq '[.dependencies[].licenses[].spdxId] | unique | .[] | [ {spdxId: ., text: "tbd"} ]' $output_file |
     tee $license_summary

    echo "License extraction complete. Output saved to $license_summary." 
else
    echo "Input file $input_file not found."
fi

echo "Script execution finished."