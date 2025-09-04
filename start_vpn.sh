#!/bin/bash

# This script is used to start a VPN connection based on user input.
# It allows the user to select a main directory containing subdirectories with .ovpn files,
# and then processes each subdirectory to find and start a VPN connection.
# The script uses the 'openvpn' command to initiate the VPN connection.
# The 'pass.txt' file is used to store the authentication credentials for the VPN connection.
# The script assumes that the 'pass.txt' file exists in the same directory as the script.
# The script also assumes that the 'openvpn' command is available on the system.
# The script is designed to be run from the command line.
# Created by: Jesus Clemente

# Set the path to the keys directory
path="keys"

# Function to find and process subdirectories with .ovpn files
function process_subdirectories_and_ovpn_files() {
  local main_dir="$1"  # Capture the passed main directory path

  # Find all subdirectories within the main directory
  subdirs=($(find "$main_dir" -type d))

  # Process each subdirectory
  for subdir in "${subdirs[@]}"; do
    # Find .ovpn files in the current subdirectory
    ovpn_files=($(find "$subdir" -type f -name "*.ovpn"))

    # Check if any .ovpn files were found
    if [[ ${#ovpn_files[@]} -eq 0 ]]; then
      echo "No se encontraron archivos .ovpn en la subcarpeta '$subdir'."
      continue
    fi

    # Display menu of .ovpn files with index numbers
    echo "Selecciona el archivo .ovpn en la subcarpeta '$subdir':"
    for i in "${!ovpn_files[@]}"; do
      echo "$((i + 1)). ${ovpn_files[$i]}"
    done

    # Get user input for .ovpn file selection
    read -p "Selecciona el número del archivo: " ovpn_file_index

    # Validate user input
    if [[ ! "$ovpn_file_index" =~ ^[0-9]+$ ]] || [ "$ovpn_file_index" -lt 1 -o "$ovpn_file_index" -gt ${#ovpn_files[@]} ]; then
      echo "Error: Selección inválida. Inténtalo de nuevo."
      continue
    fi

    # Get the selected .ovpn filename
    selected_ovpn_file="${ovpn_files[$((ovpn_file_index - 1))]}"
    
    echo "Iniciando la conexión VPN utilizando '$selected_ovpn_file'..."
    
    sudo openvpn --config "$selected_ovpn_file" --auth-user-pass "pass.txt"
    break  # Exit the loop after processing one .ovpn file
  done
}

# Find all directories within the current directory
main_dirs=($(find $path -type d))

# Present main folder selection menu
echo "Selecciona la carpeta principal que contiene las subcarpetas VPN:"
for i in "${!main_dirs[@]}"; do
  echo "$((i + 1)). ${main_dirs[$i]}"
done

# Get user input for main folder selection
read -p "Selecciona el número de la carpeta: " main_dir_index

# Validate user input
if [[ ! "$main_dir_index" =~ ^[0-9]+$ ]] || [ "$main_dir_index" -lt 1 -o "$main_dir_index" -gt ${#main_dirs[@]} ]; then
  echo "Error: Selección inválida. Inténtalo de nuevo."
  exit 1
fi

# Get the selected main directory path
selected_main_dir="${main_dirs[$((main_dir_index - 1))]}"

# Process the selected main directory
process_subdirectories_and_ovpn_files "$selected_main_dir"