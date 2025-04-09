#!/bin/bash

root_check() {
    if getent group wheel > /dev/null 2>&1; then
        echo "Please set your root password in a few seconds."
        echo "Be careful to not lose this password, otherwise"
        echo "you will lose root access entirely."
        sleep 3
        passwd root
        grep "^wheel:" /etc/group | cut -d':' -f4 | while IFS=',' read -r user; do
            gpasswd --delete "$user" wheel
        done
        groupdel wheel
    fi
}

cshell() {
    if [[ ! -d "$HOME/.config/containerconf" ]]; then
        clear
        echo "Hello there! Welcome to bourbonOS!"
        echo "You may (or may not) be asked for your password in a few seconds."
        sleep 3
        pkexec root_check
        echo "Now, for you to access your shell, we need to set up the default container."
        echo "Don't worry! This wont take long."
        echo "The shell will open when we are done."
        mkdir -p $HOME/.config/containerconf
        clear && exec distrobox-assemble create --file /etc/containerconf/.cherry/cherry.ini
    else
        clear
        echo "Starting your shell...."
        exec distrobox-enter cherry-cli
    fi
}

if [[ -d /var/home/$USER ]]; then
    if [[ "$TERM" == "xterm-256color" ]]; then
        cshell
    elif [[ "$TERM" == "linux" ]]; then
        echo "Would you like to enter debug mode? (access to host shell)"
        read -p "y/n: " debug_ask
        if [[ "$debug_ask" == "y" ]]; then
            exec PS1='[\u@\h-baseos][\W] \\$ ' sh
        else
            cshell
        fi
    fi
fi