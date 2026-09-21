
# Runs after /etc/zprofile's path_helper so brew shellenv (via ~/.profile)
# has the final say on PATH ordering.
[ -f ~/.profile ] && source ~/.profile
