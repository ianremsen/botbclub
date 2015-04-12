if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export REMOTE=1 # Change this to 0 if the machine is local
export CYGWIN=0 # Change this to 1 if the machine is Cygwin

if [ -n "$(command -v go)" ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/code/go
    export GOBIN=$GOPATH/bin
fi
