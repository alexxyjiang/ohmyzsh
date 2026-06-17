# Michele Bologna's theme, modified by Alex Jiang
# http://michelebologna.net
#
# This is an oh-my-zsh theme with a two-line colored prompt:
# {omz version} {date} - {time} {username}@{host}:{workdir} [jobs] [git]
# {prompt char}
# * hostname and username use softer non-bold colors from the standard 16-color set
# * hostname badges are limited to yellow, cyan, and magenta accents
# * [jobs], if applicable, shows the number of suspended background jobs
# * [git], if applicable, shows git branch and repo status details
# * the prompt char is green on success, yellow for root on success, red on failure
#
# git prompt is inspired by official git contrib prompt:
# https://github.com/git/git/tree/master/contrib/completion/git-prompt.sh
# and it adds:
# * the current branch
# * '%' if there are untracked files
# * '$' if there are stashed changes
# * '*' if there are modified files
# * '+' if there are added files
# * '<' if local repo is behind remote repo
# * '>' if local repo is ahead remote repo
# * '=' if local repo is equal to remote repo (in sync)
# * '<>' if local repo is diverged

local red="%{$fg_bold[red]%}"
local red_bg="%{$bg_bold[red]%}"
local green="%{$fg_bold[green]%}"
local green_bg="%{$bg_bold[green]%}"
local blue="%{$fg_bold[blue]%}"
local blue_bg="%{$bg_bold[blue]%}"
local yellow="%{$fg_bold[yellow]%}"
local yellow_bg="%{$bg_bold[yellow]%}"
local cyan="%{$fg_bold[cyan]%}"
local cyan_bg="%{$bg_bold[cyan]%}"
local magenta="%{$fg_bold[magenta]%}"
local magenta_bg="%{$bg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local white_bg="%{$bg_bold[white]%}"
local gray="%{$fg_bold[black]%}"
local red_plain="%{$fg[red]%}"
local red_bg_plain="%{$bg[red]%}"
local green_plain="%{$fg[green]%}"
local green_bg_plain="%{$bg[green]%}"
local blue_plain="%{$fg[blue]%}"
local blue_bg_plain="%{$bg[blue]%}"
local yellow_plain="%{$fg[yellow]%}"
local yellow_bg_plain="%{$bg[yellow]%}"
local cyan_plain="%{$fg[cyan]%}"
local cyan_bg_plain="%{$bg[cyan]%}"
local magenta_plain="%{$fg[magenta]%}"
local magenta_bg_plain="%{$bg[magenta]%}"
local white_plain="%{$fg[white]%}"
local white_bg_plain="%{$bg[white]%}"
local gray_plain="%{$fg[black]%}"
local reset="%{$reset_color%}"
# Softer hostname badges using the standard 16-color table, limited to yellow/cyan/magenta.
local color_array=(${gray_plain}${yellow_bg_plain} ${gray_plain}${cyan_bg_plain} ${white_plain}${magenta_bg_plain})

# omz version
local omz_version=$(git -C "${ZSH}" rev-parse --short HEAD 2>/dev/null || echo "?")
local omz_version_color=${white}${blue_bg}
local omz_version_output="${omz_version_color} omz:${omz_version} ${reset}"

# omit user name when is root
local username_color=${gray_plain}${green_bg_plain}
local username_command="%n"
local username_output="%(!..${username_color}${username_command}${reset}@)"

# time and hostname for normal user changes color based on first letter of hostname
local time_color=${gray}${white_bg}
local time_output="${time_color} %D{%a %b %d} - %D{%H:%M:%S} ${reset}"
local hostname_root_color=${red}
local hostname_normal_color=${color_array[$[((#HOST))%3+1]]}
local hostname_color="%(!.${hostname_root_color}.${hostname_normal_color})"
local hostname_command="%m"
local hostname_output="${hostname_color}${hostname_command}${reset}"

# other part which is static even is root
local current_dir_color=${blue}
local current_dir_command="%~"
local current_dir_output="${current_dir_color}${current_dir_command}${reset}"
local jobs_bg_output="${gray}${yellow_bg} bg: %j ${reset}"
local last_command_output="%(?.%(!.${yellow}.${green}).${red})"

ZSH_THEME_GIT_PROMPT_PREFIX="$white{"
ZSH_THEME_GIT_PROMPT_SUFFIX="$white}"
ZSH_THEME_GIT_PROMPT_DIRTY="$yellow✘"
ZSH_THEME_GIT_PROMPT_CLEAN="$green✔"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$blue?"
ZSH_THEME_GIT_PROMPT_MODIFIED="$red*"
ZSH_THEME_GIT_PROMPT_ADDED="$yellow+"
ZSH_THEME_GIT_PROMPT_STASHED="$blue$$"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="$green="
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="$cyan>"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="$cyan<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$magenta<>"

PROMPT='$omz_version_output$time_output$username_output$hostname_output:$current_dir_output%1(j. [$jobs_bg_output].)'
GIT_PROMPT='$(out=$(git_prompt_info)$(git_prompt_status)$(git_remote_status);if [[ -n $out ]]; then printf %s "$out$reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+="
$last_command_output$ $reset"
