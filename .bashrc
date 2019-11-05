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
  if [[ -f "$1" && -r "$1" ]] ; then
    . "$1"
  fi
}

# Resize window after each command acordingly
shopt -s checkwinsize

# Prompt
PS1="[\[\e[32m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]:\[\e[31m\]\W\[\e[m\]]\$(get_git_branch)\n$ "

# Add .bin for user-made executables
if [ -d $HOME/.bin ] ; then
  PATH="$PATH:$HOME/.bin"
fi

# Add sbin for more executables
if [ -d /usr/local/sbin ] ; then
  PATH="$PATH:/usr/local/sbin"
fi

# Add local bin
if [ -d $HOME/.local/bin ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

# Add cargo binaries
if [ -d $HOME/.cargo/bin ] ; then
  PATH="$PATH:$HOME/.cargo/bin"
fi

# Aliases
source_if_exists "$HOME/.bash_aliases"

# Completions
source_if_exists "$HOME/.git_completions"
source_if_exists "$HOME/.bash_completions"
if [ -d /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# History
export HISTSIZE=20000
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="clear":"cd ~":"cd ..":"cd -":"fg":"ls":"la"
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r;"

# NeoVim as default editor
export EDITOR=nvim
export VISUAL=nvim

# Keep history on iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Other nice tools
source_if_exists "$HOME/.asdf/asdf.sh"
source_if_exists "$HOME/.asdf/completions/asdf.bash"

# Add direnv if present
if [ -x "$(command -v direnv)" ] ; then
  eval "$(direnv hook bash)"
fi

# Locale settings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
