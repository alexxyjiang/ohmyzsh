# Locale
export LC_ALL="en_US.UTF-8"
# Editor
export EDITOR="vim"

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

# ssh-agent: reuse one agent across shells instead of spawning duplicates.
# macOS already runs one via launchd (com.openssh.ssh-agent), so SSH_AUTH_SOCK
# is normally pre-set there; this mainly kicks in on Linux, and only in
# interactive shells (the `-t 0` check skips it for scripts/cron).
if [ -z "${SSH_AUTH_SOCK}" ] && [ -t 0 ] && command -v ssh-agent >/dev/null 2>&1; then
    SSH_ENV="${HOME}/.ssh/agent.env"
    [ -f "${SSH_ENV}" ] && source "${SSH_ENV}" >/dev/null
    if [ -z "${SSH_AGENT_PID}" ] || ! kill -0 "${SSH_AGENT_PID}" 2>/dev/null; then
        mkdir -p -m 700 "${HOME}/.ssh"
        (umask 077; ssh-agent -s > "${SSH_ENV}")
        source "${SSH_ENV}" >/dev/null
        ssh-add
    fi
    unset SSH_ENV
fi

# rg with color
alias rg="rg --smart-case --colors \"line:style:bold\" --colors \"line:fg:red\" --colors \"match:bg:blue\" --colors \"match:fg:white\" --colors \"path:style:underline\" --colors \"path:fg:green\""

# yazi
alias yz="yazi"
