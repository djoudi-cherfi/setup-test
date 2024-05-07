#!/usr/bin/env bash

echo "download and run the utils file"

echo "ask to run sudo"

ask_for_sudo() {

    # Ask for the administrator password upfront.
    sudo -v &> /dev/null

    # Update existing `sudo` time stamp
    # until this script has finished.

    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &
}