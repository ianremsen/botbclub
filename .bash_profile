# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Sets the PKG env for alias shortcut.
if [ -n "$(command -v yum)" ]; then
    export PKG='yum'
elif [ -n "$(command -v apt-get)" ]; then
    export PKG='apt-get'
elif [ -n "$(command -v pkg)" ]; then
    export PKG='pkg'
fi

if [ -n "$(command -v go)" ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/code/go
    export GOBIN=$GOPATH/bin
fi

if [ "$CYGWIN" == "1" ]; then
    SSHAGENT=/usr/bin/ssh-agent
    SSHAGENTARGS="-s"
    if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
        eval `$SSHAGENT $SSHAGENTARGS` >> /dev/null
        trap "kill $SSH_AGENT_PID" 0
    fi
fi

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
