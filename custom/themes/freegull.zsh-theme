# Michele Bologna's theme, modified by Alex Jiang
# http://michelebologna.net
#
# This a theme for oh-my-zsh. Features a colored prompt with:
# {date} {time} {username}@{host}:{workdir} [jobs] [git]
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

# omit user name when is root
local username_color=${green}
local username_command="%n"
local username_output="%(!..$username_color$username_command$reset@)"

# hostname color array, red for root, pick a color based on the first character of hostname for normal user
local hostname_root_color=${red}
local hostname_normal_color_array=(${yellow} ${cyan} ${magenta})
local hostname_normal_color=$hostname_normal_color_array[$[((#HOST))%3+1]]
local hostname_color="%(!.$hostname_root_color.$hostname_normal_color)"
local hostname_command="%m"
local hostname_output="$hostname_color$hostname_command$reset"

# other part which is static even is root
local time_output="${yellow}%D{%a %b %d} - %D{%H:%M:%S}$reset"
local current_dir_color=${blue}
local current_dir_command="%~"
local current_dir_output="$current_dir_color$current_dir_command$reset"
local jobs_bg_output="${yellow}fg: %j$reset"
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
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="$green>"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="$magenta<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$magenta<>"

PROMPT='$time_output $username_output$hostname_output:$current_dir_output%1(j. [$jobs_bg_output].)'
GIT_PROMPT='$(out=$(git_prompt_info)$(git_prompt_status)$(git_remote_status);if [[ -n $out ]]; then printf %s "$out$reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+="
$last_command_output%#$reset "
RPROMPT=""
