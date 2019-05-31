export LC_ALL="en_US.UTF-8"
export GREP_COLOR="1;32"
export LSCOLORS="ExFxbxdxCxEhFhEgFgaeaf"

# add all ssh public keys
if [ -z "${SSH_AUTH_SOCK}" ]
then
  eval `ssh-agent -s`
  ssh-add
fi
