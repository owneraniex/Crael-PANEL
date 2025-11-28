#!/bin/bash
# ==========================================
# CRACKEN ULTIMATE INSTALLER
# Engineered by Nayeem Dev
# ==========================================

# 1. SETUP - PASTE YOUR GITHUB LINK BELOW
#    Example: https://github.com/owneraniex/Cracken/releases/download/v5.0/installer
BINARY_URL="https://github.com/plumsoftwaredev-bit/FFMB/releases/download/v1.0/installer"
INSTALL_PATH="/usr/local/bin/ny-crackenvps"

# 2. UI HELPERS
RESET="\033[0m"
GREEN="\033[32m"
MAGENTA="\033[35m"

clear
echo -e "${MAGENTA}"
echo "   CRACKEN ULTIMATE INSTALLER"
echo "   Powered by Nayeem Dev"
echo -e "${RESET}"

# 3. DOWNLOAD
echo -e "${GREEN}[*] Downloading Core Binary...${RESET}"
curl -L --progress-bar -o "$INSTALL_PATH" "$BINARY_URL"

# 4. VERIFY DOWNLOAD
if [ ! -f "$INSTALL_PATH" ]; then
    echo "Error: Download failed. Please check the URL in install.sh"
    exit 1
fi

# 5. PERMISSIONS & EXECUTION
chmod +x "$INSTALL_PATH"

echo -e "${GREEN}[*] Launching Wizard...${RESET}"
sleep 1

# --- THE FIX IS HERE ---
# We force the binary to read from /dev/tty (Your Keyboard) instead of the curl pipe.
"$INSTALL_PATH" < /dev/tty
