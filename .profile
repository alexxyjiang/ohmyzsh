# Locale
export LC_ALL="en_US.UTF-8"
# Editor
export EDITOR="vim"

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

# add all ssh public keys
if [ -z "${SSH_AUTH_SOCK}" ]
then
  eval `ssh-agent -s`
  ssh-add
fi
