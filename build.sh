#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install packages
rpm-ostree install screen

# Install a package from rpmfusion (commented out)
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Clean up the downloaded RPM
rm -f /tmp/1password-latest.rpm

