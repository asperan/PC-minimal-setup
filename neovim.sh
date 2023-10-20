NVIM_CONFIG_PATH="/home/${SYSTEM_USER}/.config/nvim"

mkdir -p "${NVIM_CONFIG_PATH}"

# Download config into right folder
git clone "${NVIM_CONFIG_REPOSITORY_URL}" "${NVIM_CONFIG_PATH}"

system_user_own "${NVIM_CONFIG_PATH}"

