#!/bin/sh

if [ -d .git ]; then
  git describe --always --tags --dirty > version # get version from git
else
  echo 0.7.3 > version # hard coded versions
fi

libtoolize
aclocal
autoconf
automake --add-missing

CONFIGDIR=$XDG_CONFIG_HOME/cava2

if [ -z "$XDG_CONFIG_HOME" ]; then CONFIGDIR=$HOME/.config/cava2; fi

mkdir -p "$CONFIGDIR"
[ -f "$CONFIGDIR"/config ] || cp example_files/config "$CONFIGDIR"/config
