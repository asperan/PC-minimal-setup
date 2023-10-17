apt-get install -y doas

DOAS_CONFIG="/etc/doas.conf"
DOAS_ALIAS_FILE="/etc/profile.d/doas.sh"

echo "permit persist ${SYSTEM_USER} as root" > "${DOAS_CONFIG}"

cat <<COMMANDS > "${DOAS_ALIAS_FILE}"
alias sudo='doas'
complete -F _command sudo
COMMANDS

