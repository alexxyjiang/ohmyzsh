# Login shells load ~/.profile from ~/.zprofile instead (after /etc/zprofile's
# path_helper runs), otherwise path_helper reorders PATH and puts /usr/bin
# ahead of /opt/homebrew/bin again.
if [[ ! -o login ]]; then
    [ -f ~/.profile ] && source ~/.profile
fi
