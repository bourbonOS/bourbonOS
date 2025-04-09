#!/usr/bin/env bash

set -oue pipefail

dnf -y install epel-release 'dnf-command(config-manager)'
crb enable
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-10
