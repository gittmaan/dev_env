# MacPorts Installer addition on 2010-11-02_at_09:05:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=$PATH:/Developer/android/android-sdk-mac_86/tools:/Developer/android/android-sdk-mac_86

RVM_FILE="$HOME/.rvm/scripts/rvm"

if [ -f $RVM_FILE ];
then
   [[ -s $RVM_FILE ]] && source $RVM_FILE  # This loads RVM into a shell session.
fi

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

. /etc/git-completion.bash

function __git_dirty {
git diff --quiet HEAD &>/dev/null
[ $? == 1 ] && echo "!"
}

function __git_branch {
local branch=$(__git_ps1 "%s")
if [ "$branch" != "" ]; then
echo "($branch)"
fi
}

function __my_rvm_ruby_version {
local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
[ "$gemset" != "" ] && gemset="@$gemset"
local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
[ "$version" == "1.8.7" ] && version=""
local full="$version$gemset"
[ "$full" != "" ] && echo "$full "
}

# via http://tammersaleh.com/posts/a-better-rvm-bash-prompt
bash_prompt() {
local NONE="\[\033[0m\]" # unsets color to term's fg color

# regular colors
local K="\[\033[0;30m\]" # black
local R="\[\033[0;31m\]" # red
local G="\[\033[0;32m\]" # green
local Y="\[\033[0;33m\]" # yellow
local YBold="\[\033[01;33m\]" # yellow
local B="\[\033[0;34m\]" # blue
local M="\[\033[0;35m\]" # magenta
local C="\[\033[0;36m\]" # cyan
local CBold="\[\033[01;36m\]" # cyan
local W="\[\033[0;37m\]" # white

local UC=$W # user's color
[ $UID -eq "0" ] && UC=$R # root's color

if [ -f $RVM_FILE ];
then
  PS1="$W\u $G\$(rvm-prompt v g) $CBold\w $YBold\$(__git_branch)$R\$(__git_dirty)${NONE}$ "
else
  PS1="$W\u@\h $G\$(v g) $R\w $Y\$(__git_branch)$R\$(__git_dirty)${NONE}$ "
fi

}

bash_prompt


