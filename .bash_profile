# MacPorts Installer addition on 2010-11-02_at_09:05:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

. /etc/git-completion.bash 

export PATH=$PATH:/Developer/android/android-sdk-mac_86/tools:/Developer/android/android-sdk-mac_86
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# iTerm Tab and Title Customization and prompt customization

# Put the string " [bash]   hostname::/full/directory/path"
# in the title bar using the command sequence
# \[\e]2;[bash]   \h::\]$PWD\[\a\]

# Put the penultimate and current directory 
# in the iterm tab
# \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]

# Make a simple command-line prompt:  bash-$

export PS1="\[\033[38m\]\u@\h\[\033[01;36m\] \w \[\033[33m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "


