if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
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
        eval `$SSHAGENT $SSHAGENTARGS`
        trap "kill $SSH_AGENT_PID" 0
    fi
fi
