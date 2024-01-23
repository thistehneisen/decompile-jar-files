#!/bin/bash

output_dir="decompiled"
mkdir -p "$output_dir"

find . -name "*.jar" -exec sh -c '
    for jarfile do
        # Create a subdirectory in the output directory for each JAR file
        decompile_dir="$0/$(basename "${jarfile}" .jar)"
        mkdir -p "$decompile_dir"

        # Decompile the JAR file into its designated directory
        jd-cli "$jarfile" -od "$decompile_dir"
    done
' "$output_dir" {} +
