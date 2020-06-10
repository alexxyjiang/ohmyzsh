# Michele Bologna's theme, modified by Alex Jiang
# http://michelebologna.net
#
# This a theme for oh-my-zsh. Features a colored prompt with:
# * username@host: [jobs] [git] workdir %
# * hostname color is based on hostname characters. When using as root, the
# prompt shows only the hostname in red color.
# * [jobs], if applicable, counts the number of suspended jobs tty
# * [git], if applicable, represents the status of your git repo (more on that
# later)
# * '%' prompt will be green if last command return value is 0, yellow otherwise.
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

local green="%F{010}"
local red="%F{009}"
local cyan="%F{014}"
local yellow="%F{011}"
local blue="%F{012}"
local magenta="%F{013}"
local white="%F{015}"
local green_bg="%{$bg_bold[green]%}"
local red_bg="%{$bg_bold[red]%}"
local cyan_bg="%{$bg_bold[cyan]%}"
local yellow_bg="%{$bg_bold[yellow]%}"
local blue_bg="%{$bg_bold[blue]%}"
local magenta_bg="%{$bg_bold[magenta]%}"
local white_bg="%{$bg_bold[white]%}"
local reset="%{$reset_color%}"

# local -a color_array
# color_array=($green $red $cyan $yellow $blue $magenta $white)

local username_normal_color=$yellow
local hostname_normal_color=$cyan
local username_root_color=$red
local hostname_root_color=$blue

# calculating hostname color with hostname characters
# for i in `hostname`; local hostname_normal_color=$color_array[$[((#i))%7+1]]
local -a hostname_color
hostname_color=%(!.$hostname_root_color.$hostname_normal_color)

local current_dir_color=$blue
local username_command="%n"
local hostname_command="%m"
local current_dir="%~"

local time_output="$magenta%D{%a %b %d} $green%D{%H:%M}$reset"
local username_output="%(!..$username_normal_color$username_command$reset@)"
local hostname_output="$hostname_color$hostname_command$reset"
local current_dir_output="$current_dir_color$current_dir$reset"
local jobs_bg="${red}fg: %j$reset"
local last_command_output="%(?.%(!.$red.$green).$yellow)"

ZSH_THEME_GIT_PROMPT_PREFIX="{"
ZSH_THEME_GIT_PROMPT_SUFFIX="}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="$blue?"
ZSH_THEME_GIT_PROMPT_MODIFIED="$red*"
ZSH_THEME_GIT_PROMPT_ADDED="$green+"
ZSH_THEME_GIT_PROMPT_STASHED="$blue$$"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="$green="
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="$green>"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="$red<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$red<>"

PROMPT='$time_output $username_output$hostname_output:$current_dir_output%1(j. [$jobs_bg].)'
GIT_PROMPT='$(out=$(git_prompt_info)$(git_prompt_status)$(git_remote_status);if [[ -n $out ]]; then printf %s " $white=$out$reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+="
$last_command_output%#$reset "
RPROMPT=""
