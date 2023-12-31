#!/bin/bash

set -euo pipefail
# The script body. Declaring a function instead of running it
# directly prevents half-execution due to a disconnection during
# download of this script.
script_body() {

    # The command to run to install packages. It should accept the option '-y'.
    INSTALL_PACKAGE="xbps-install"
    BASE_URL="https://raw.githubusercontent.com/asperan/PC-minimal-setup/main"

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
        ${INSTALL_PACKAGE} -y dialog
        wget -O "configuration.sh" "${BASE_URL}/configuration.sh"
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

    modify_configuration

    download_and_source "${BASE_URL}/cli-tools.sh" "cli-tools.sh"

    download_and_source "${BASE_URL}/git.sh" "git.sh"

    download_and_source "${BASE_URL}/window-manager.sh" "window-manager.sh"

    # Install nnn
    # Other software

}

script_body
