# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# set PATH so it includes user's private bin if it exists
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

# If Go is installed, initialize the environment variables involved
if [ -d /usr/local/go ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/code/go
    export GOBIN=$GOPATH/bin
fi

# The same for Racket
if [ -d /usr/racket ]; then
    export PATH=$PATH:/usr/racket/bin
fi

# The same for Mono
if [ -d /usr/bin/mono ]; then
    export PATH=$PATH:/usr/bin/mono
fi

# Sets the PKG env for alias shortcut.
if [ -n $(command -v yum) ] && ! [ -n $(command -v dnf) ]; then
    export PKG='yum'
elif [ -n $(command -v dnf) ]; then
    export PKG='dnf'
elif [ -n $(command -v apt-get) ]; then
    export PKG='apt-get'
elif [ -n $(command -v pkg) ]; then
    export PKG='pkg'
elif [ -n $(command -v pacman) ]; then
    export PKG='pacman'
fi

# Wine
if [ -n $(command -v wine) ]; then
    export C='$HOME/.wine/drive_c/'
fi

# Includes my lovingly-crafted .bashrc
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

# Removes duplicate entries
if [ -n $PATH ]; then
    oldPATH=$PATH:; PATH=
    while [ -n $oldPATH ]; do
        x=${oldPATH%%:*}
        case $PATH: in
            *:$x:*) ;;
            *) PATH=$PATH:$x;;
        esac
        oldPATH=${oldPATH#*:}
    done
    PATH=${PATH#:}
    unset oldPATH x
fi
