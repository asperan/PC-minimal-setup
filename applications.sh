#!/bin/false
# shellcheck shell=bash

LIBREOFFICE_LANGS="$(tr -s "," " " <<< "${LIBREOFFICE_LANG_PACKS}")"

LIBREOFFICE_PACKAGES="libreoffice-fresh"

for lang in $LIBREOFFICE_LANGS
do
    LIBREOFFICE_PACKAGES="${LIBREOFFICE_PACKAGES} libreoffice-fresh-${lang}"
done

# For libreoffice packages there need to be word splitting
# shellcheck disable=2086
${INSTALL_PACKAGE} ${NO_CONFIRM_FLAG} firefox thunderbird ${LIBREOFFICE_PACKAGES} podman btop flatpak
