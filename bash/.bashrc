#set -x
export PLATFORM=$(uname -s)
[ -f /etc/bashrc ] && . /etc/bashrc



export CLICOLOR=1
export HOMEBREW_GITHUB_API_TOKEN="0ec8a2aa509bf05122e8a5a483da88ac0dd9ca1a"
export EDITOR=nano
export LANG=en_US.UTF-8
[ "$PLATFORM" = 'Darwin' ] ||
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
### OS X
export COPYFILE_DISABLE=true
#Edit 7-12-2017
shopt -s nocaseglob;
shopt -s cdspell;
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;
#End Edit

# make less more friendly for non-text input files, see lisspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Better history
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTIGNORE="ls:pwd:exit"

# File navigation aliases
alias ..='cd ..'
alias _='cd -'
# alias ls='ls -hF -G --color'  # add colors for filetype recognition
alias tmux='tmux -CC'

#Edit 7-12-20170
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias reload="exec $SHELL -l"
alias path='echo -e ${PATH//:/\\n}'

#End Edit

alias ll='ls -AHl ${colorflag}'
alias la='ls -A ${colorflag}'
alias du='du -kh' 
alias df='df -kTh'
alias lll='ll -lrt ${colorflag}'
alias nano='nano -c'
alias logs='cd /var/log/'
alias gosource='cd ~/Documents/source/'
alias sshhome='mosh -ssh="ssh  -p 2222" mantene@mantene.ddns.net'
alias sshathome='mosh -ssh="ssh -p 2222" mantene@192.168.1.253'

# Colored output in grep
alias grep='grep --color=auto'

export PS1="\[$(tput bold)\]\[$(tput setaf 5)\][\[$(tput setaf 2)\]\u\[$(tput setaf 5)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 5)\]]\[$(tput setaf 4)\]\w\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

complete -W "$echo $(grep ^Host ~/.ssh/config | sed -e 's/Host //' | grep -v "\*"))" ssh

export CFLAGS="-O2 -falign-functions=16 -falign-loops=16 -march=native -fPIC"
export CXXFlags=$CFLAGS

if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

unset PROMPT_COMMAND
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
source ~/.bash-git-prompt/gitprompt.sh


