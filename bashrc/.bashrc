# I have no idea what this does
case $- in
    *i*) ;;
      *) return;;
esac

# Includes the machine-specific settings file
if [ -f ~/.bashspec ]; then
    source ~/.bashspec
fi

# Misc env
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Debian BS
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Term colors!
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Force said colors!
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Checks if env var is set for this being a remote system, and properly sets the PS1
if [ "$REMOTE" == "0" ]; then
    export PS1="\[\e[01;34m\]\u\[\e[0m\]\[\e[01;37m\]@\h\[\e[0m\]\[\e[00;37m\]:[\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]: \[\e[0m\]"
else
    export PS1="\[\e[01;31m\]\u\[\e[0m\]\[\e[01;37m\]@\h\[\e[0m\]\[\e[00;37m\]:[\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]: \[\e[0m\]"
fi

# Checks if the user is root, and properly sets the PS1
if [ "$USER" == "root" ]; then
    export PS1="\[\e[01;35m\]\u\[\e[0m\]\[\e[01;37m\]@\h\[\e[0m\]\[\e[00;37m\]:[\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]: \[\e[0m\]"
fi

# Includes the aliases file
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Bash completion!
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
