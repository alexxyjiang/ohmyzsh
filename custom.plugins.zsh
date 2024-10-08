#!/bin/zsh 
# install my custom plugins
export ZSH_CUSTOM="${ZSH}/custom"
[ -d "${ZSH_CUSTOM}/plugins/you-should-use" ] || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM}/plugins/you-should-use
[ -d "${ZSH_CUSTOM}/plugins/autoupdate" ] || git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM}/plugins/autoupdate
[ -d "${ZSH_CUSTOM}/plugins/command-time" ] || git clone https://github.com/popstas/zsh-command-time.git ${ZSH_CUSTOM}/plugins/command-time
[ -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
[ -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
