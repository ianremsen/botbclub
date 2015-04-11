if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Change this to 0 if the machine is local
REMOTE=1

if [ -n "$(command -v go)" ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/code/go
    export GOBIN=$GOPATH/bin
fi
