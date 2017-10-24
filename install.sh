#!/bin/bash
NARGS=2
INSTALL_PREFIX=/usr/local

while test $NARGS -gt 0; do
        case "$1" in
                -h|--help)
                        echo "lbatch-install.sh - install the lbatch job scheduler"
                        echo "Usage: lbatch-install.sh [options] "
                        echo " "
                        echo "options:"
                        echo "-h, --help                	show help"
                        echo "-p, --prefix=[/usr/local]     specify the installation prefix"
                        exit 0
                        ;;
                -p)
                        shift
                        if test $NARGS -gt 0; then
                                INSTALL_PREFIX=$1
                        else
                                echo "no process specified"
                                exit 1
                        fi
                        shift
                        ;;
                --prefix*)
                        INSTALL_PREFIX=$(echo "$1" | sed -e 's/^[^=]*=//g')
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done


echo "***** Installing lbatch *****"
echo "Installing to $INSTALL_PREFIX"
INSTALL_DIR=$INSTALL_PREFIX"/bin/"
if [ -d "$INSTALL_DIR" ]
then
    cp lbatch-sh "$INSTALL_DIR" # Core script

    cp lstat "$INSTALL_DIR" # Status script
    cp lsub "$INSTALL_DIR" # Submission script
else
    echo "Error: Directory $INSTALL_DIR does not exist."
fi
