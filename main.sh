#!/bin/bash

set -euo pipefail
# The script body. Declaring a function instead of running it
# directly prevents half-execution due to a disconnection during
# download of this script.
script_body() {
    # Downloads a file and source it.
    # Params:
    # $1: the URL of the file
    # $2: the file name
    download_and_source() {
        wget -O "$2" "$1"
        source "$2"
    }

    # Download and allow the user to modify the configuration
    modify_configuration ()
    {
        apt-get install -y dialog
        wget -O "configuration.sh" "https://raw.githubusercontent.com/asperan/PC-minimal-setup/main/configuration.sh"
        dialog --erase-on-exit --no-cancel --title "Personalize configuration" --editbox "configuration.sh" $(( $(tput lines) / 3 * 2 )) $(( $(tput cols) / 3 * 2 ))

        CONTINUE_CONFIGURATION="$?"

        if [ ! "${CONTINUE_CONFIGURATION}" ] ; then
            echo "Configuration cancelled." >&2
            exit 1
        fi

        source "configuration.sh"
    }

    # Assure this script has root privileges
    if [ "$(whoami)" != "root" ] ; then
        echo "This script must be run with root privileges" >&2
        exit 1;
    fi

    download_and_source "https://raw.githubusercontent.com/asperan/PC-minimal-setup/main/enable-testing.sh" "enable-testing.sh"

    modify_configuration

    download_and_source "https://raw.githubusercontent.com/asperan/PC-minimal-setup/main/additional-packages.sh" "additional-packages.sh"

    download_and_source "https://raw.githubusercontent.com/asperan/PC-minimal-setup/main/doas.sh" "doas.sh"

    download_and_source "https://raw.githubusercontent.com/asperan/PC-minimal-setup/main/git.sh" "git.sh"

    # Install i3, download its configuration
    # Install terminal emulator (termux? Alacritty? ...)
    # Install neovim, download configuration
    # Install nnn
    # Other software

}

script_body
