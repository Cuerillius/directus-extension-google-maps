#!/bin/bash

extensionsPath=$1

if [ -z "$extensionsPath" ]; then
  echo "Please provide the path to the extensions folder"
  exit 1
fi

# Remove trailing slash if present
extensionsPath="${extensionsPath%/}"

# Read package name and version from package.json
pkgName=$(jq -r '.name' package.json)
pkgVersion=$(jq -r '.version' package.json)

if [ -z "$pkgName" ]; then
  echo "Couldn't find the package name in package.json"
  exit 1
fi

fullPath="${extensionsPath}/${pkgName}"
fullPath="$(realpath -s "$fullPath")"

# Check if the directory exists
if [ -d "$fullPath" ]; then
  # Confirm with the user before removing the existing directory
  read -p "Confirm deletion of ${fullPath}? (Y/n) " confirm
  confirm=${confirm:-Y}
  if [[ "$confirm" != "Y" && "$confirm" != "y" ]]; then
    echo "Operation cancelled."
    exit 0
  fi

  # Remove the existing directory
  rm -r "$fullPath"
fi

# Create new directory and copy files
mkdir -p "$fullPath"
cp -r dist "${fullPath}/dist"
cp package.json "${fullPath}/package.json"

echo "Upgraded extension to ${pkgName}@${pkgVersion} at ${fullPath}"
