#!/bin/sh

DIR=$(dirname $(readlink -f $0))

# warn if default.nix has been modified since last time we rebuilt shell.drv
if [ default.nix -nt shell.drv ]
then
    echo <<EOF
WARNING: default.nix has been modified more recently than shell.drv.
If dependencies have changed you may need to update the derivation by
running the following command:

nix-instantiate . --indirect --add-root \$PWD/shell.drv
EOF
fi

if [ $# -gt 0 ]
then
    nix-shell --pure $DIR/shell.drv --run "$*"
else
    nix-shell --pure $DIR/shell.drv
fi
