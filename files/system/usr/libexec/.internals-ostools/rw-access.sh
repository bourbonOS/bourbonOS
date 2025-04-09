#!/bin/bash

GROUP_NAME="nix-rwx-access"
TARGET_DIR="/nix"

if ! getent group "$GROUP_NAME" > /dev/null 2>&1; then
    echo "Group $GROUP_NAME does not exist. Creating group..."
    groupadd "$GROUP_NAME"
    chown -R :"$GROUP_NAME" "$TARGET_DIR"
    chmod -R g+rwx "$TARGET_DIR"
    usermod -aG "$GROUP_NAME" root
else
    echo "Group $GROUP_NAME already exists. Skipping group creation."
fi

for USER_DIR in /var/home/*; do
    if [ -d "$USER_DIR" ]; then
        USERNAME=$(basename "$USER_DIR")
        if id -nG "$USERNAME" | grep -qw "$GROUP_NAME"; then
            echo "$USERNAME is already in group $GROUP_NAME. Skipping."
        else
            echo "Adding $USERNAME to group $GROUP_NAME..."
            usermod -aG "$GROUP_NAME" "$USERNAME"
        fi
    fi
done