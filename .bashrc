# ~/.bashrc
# If not running interactively, do nothing
case $- in
  *i*) ;;
  *) return;;
esac

get_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
source_if_exists() {
  if [ -f "$1" ] ; then
    . "$1"
  fi
}

# Resize window after each command acordingly
shopt -s checkwinsize

# Prompt
PS1='[\u@\h \w]\[\e[32m\]$(get_git_branch)\[\e[0m\]\n$ '

# Add .bin for user-made executables
if [ -d ~/.bin ] ; then
  PATH="$PATH:~/.bin"
fi

# Aliases
source_if_exists "$HOME/.bash_aliases"

# Completions
source_if_exists "$HOME/.bash_completions"
if [ -d /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# History
export HISTSIZE=5000
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="clear":"cd ~":"cd ..":"cd -":"fg":"ls":"la"

# NeoVim as default editor
export EDITOR=nvim
export VISUAL=nvim

# Other nice tools
source_if_exists "$HOME/.asdf/asdf.sh"
source_if_exists "$HOME/.asdf/completions/asdf.bash"
