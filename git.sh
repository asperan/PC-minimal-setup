apt-get install -y git

su -l -c "git config --global user.name '${GIT_USER_NAME}' && git config --global user.email '${GIT_USER_EMAIL}'" "${SYSTEM_USER}"

