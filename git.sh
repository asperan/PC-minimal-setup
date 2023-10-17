apt-get install -y git

configure_git() {
    git config --global user.name "${GIT_USER_NAME}"
    git config --global user-email "${GIT_USER_EMAIL}"
}

su -l -c configure_git "${SYSTEM_USER}"

