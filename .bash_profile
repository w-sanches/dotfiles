# ~/.bash_profile

# New MacOS uses zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
