#!/bin/bash

set -euo pipefail
# The script body. Declaring a function instead of running it
# directly prevents half-execution due to a disconnection during
# download of this script.
script_body() {
    # DEBUG mode do not download the files, but it just execute them.
    # It can be useful if the files have been modified without pushing
    # the diffs to somewhere.
    if [ "${DEBUG:-false}" ] ; then
        download_and_source() {
            source "$2"
        }
    else
        # Downloads a file and source it.
        # Params:
        # $1: the URL of the file
        # $2: the file name
        download_and_source() {
            wget -O "$2" "$1"
            source "$2"
        }
    fi

    # Download and allow the user to modify the configuration
    modify_configuration ()
    {
        apt-get install -y dialog
        # wget -O "configuration.sh" ""
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

    # Change repository to testing and do a full upgrade
    download_and_source "URL" "enable-testing.sh"

    modify_configuration

    download_and_source "URL" "doas.sh"
    # Install doas, configure the user and add an alias
    download_and_source "URL" "git.sh"
    # Install git, configure it

    # Install i3, download its configuration
    # Install terminal emulator (termux? Alacritty? ...)
    # Install neovim, download configuration
    # Install nnn
    # Other software

}

script_body
