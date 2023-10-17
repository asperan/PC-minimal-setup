#!/bin/bash

BASE_DEBIAN_VERSION="$(source /etc/os-release && echo "${VERSION_CODENAME}")"
SOURCE_LIST_FILE="/etc/apt/sources.list"
FIX_RELEASE_FILE="/etc/apt/apt.conf.d/00default-release"

# Disable '-updates' source
sed -E -i 's/([^#])(.*)(-updates)(.*)/\# \1\2\3\4/' "${SOURCE_LIST_FILE}"

# Change other repositories to 'testing'
sed -E -i "s/([^#])(.*)(${BASE_DEBIAN_VERSION})(.*)/\\1\\2testing\\4/" "${SOURCE_LIST_FILE}"

# If present, remove the file which fixes a specific release
[ -e "${FIX_RELEASE_FILE}" ] && rm "${FIX_RELEASE_FILE}"

apt-get update

apt-get upgrade -y

