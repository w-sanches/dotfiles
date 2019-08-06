# ~/.bash_aliases
# Update bash configs with a simple command
alias resource='source $HOME/.bash_profile'

# Docker userful comands
alias docker_stopall='docker stop $(docker ps -a -q)'
alias docker_ps_name="docker ps --format '{{.Names}}'"

# Easy way to handle dotfiles repository
alias dotcfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Enable color support for commands
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Add useful ls aliases
alias l='ls -hAlF'
alias la='ls -A'

# Jobs management
alias jobs='jobs -l'

# Enable default options of mkdir
alias mkdir='mkdir -pv'

# Make commands more human-readable
alias mount='mount | column -t'
alias df='df -H'
alias du='du -ch'

# Increase safety when managing files
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'

# Show opened ports
alias ports='netstat -tulanp'

# NeoVim!
alias vim='nvim'
alias vimdiff='nvim -d'
alias vimrc='$EDITOR ~/.vimrc'
