#!/bin/bash
# ==========================================
# CRACKEN ULTIMATE LOADER
# Engineered by Nayeem Dev
# ==========================================

BINARY_URL="https://github.com/owneraniex/Cracken/releases/download/v5.0/ny-crackenvps"
INSTALL_PATH="/usr/local/bin/ny-crackenvps"

# --- UI COLORS ---
RESET="\033[0m"
GREEN="\033[38;5;46m"
MAGENTA="\033[38;5;213m"
BOLD="\033[1m"

# --- HEADER ---
clear
echo -e "${MAGENTA}${BOLD}"
echo "   CRACKEN ULTIMATE"
echo "   Engineered by Nayeem Dev"
echo -e "${RESET}"

# --- ROOT CHECK ---
if [[ $EUID -ne 0 ]]; then
   echo -e "${MAGENTA}[!] Error: This script must be run as root.${RESET}"
   echo "    Use: sudo bash <(curl ...)"
   exit 1
fi

# --- DOWNLOADER ---
echo -e "${GREEN}[*] Downloading Secure Core...${RESET}"

# Use wget if available (cleaner bar), else curl
if command -v wget >/dev/null 2>&1; then
    wget -q --show-progress -O "$INSTALL_PATH" "$BINARY_URL"
else
    curl -L -o "$INSTALL_PATH" "$BINARY_URL" --progress-bar
fi

# --- VERIFICATION ---
if [ ! -f "$INSTALL_PATH" ]; then
    echo -e "${MAGENTA}[!] Error: Download failed.${RESET}" 
    echo "    Check your internet or the GitHub link."
    exit 1
fi

chmod +x "$INSTALL_PATH"

# --- EXECUTION ---
echo -e "${GREEN}[*] Launching Wizard...${RESET}"
sleep 1

# THE FIX: Explicitly disconnect from the curl pipe and attach to user keyboard
# This prevents the "auto-skip" bug at the Y/N prompt.
exec "$INSTALL_PATH" < /dev/tty
