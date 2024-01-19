#!/bin/bash

# Check if curl is installed
if ! command -v curl &>/dev/null; then
  log_error "curl is not installed. Please install curl."
  exit 1
fi

# Define the GitHub API URL
github_api_url="https://api.github.com/repos/errata-ai/vale/releases/latest"

# Get the latest release information
release_info=$(curl -sSL "$github_api_url")

# Extract the download URL from the release_info using grep
download_url=$(echo "$release_info" | grep -o -E "https://.*Linux_64-bit.*\.tar\.gz")

# Check if download_url is empty
if [ -z "$download_url" ]; then
  log_error "Failed to extract download URL from release information."
  exit 1
fi

# Create a temporary directory
temp_dir=$(mktemp -d)

# Extract the filename from the URL
downloaded_filename=$(basename "$download_url")

# Download the latest release file
echo "Downloading the latest release from: $download_url"
if ! curl -sSL -o "$temp_dir/$downloaded_filename" "$download_url"; then
  log_error "Failed to download the latest release."
  rm -rf "$temp_dir"
  exit 1
fi

# Extract the downloaded file
tar -xzf "$temp_dir/$downloaded_filename" -C "$temp_dir"

# Move the executable to a directory in your PATH
sudo mv "$temp_dir/vale" /usr/local/bin/

# Clean up temporary files
rm -rf "$temp_dir"

echo "Vale installation complete. You can now use the 'vale' command."

