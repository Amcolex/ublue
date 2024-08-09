#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Download and install 1Password RPM
curl -Lo /tmp/1password-latest.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
rpm-ostree install /tmp/1password-latest.rpm

# Add Brave Browser repository
cat << EOF > /etc/yum.repos.d/brave-browser.repo
[brave-browser]
name=Brave Browser
baseurl=https://brave-browser-rpm-release.s3.brave.com/x86_64/
enabled=1
type=rpm-md
gpgcheck=1
gpgkey=https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
EOF

# Import Brave Browser GPG key
rpm-ostree install https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

# Install packages
rpm-ostree install screen brave-browser

# Install a package from rpmfusion (commented out)
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Clean up the downloaded RPM
rm -f /tmp/1password-latest.rpm

