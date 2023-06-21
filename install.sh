#!/bin/bash

# Install Python3 if not already installed
if ! command -v python3 > /dev/null; then
    echo "Python3 not found. Installing Python3..."
    sudo apt-get update
    sudo apt-get install -y python3
fi

# Download the pre-commit script and its config file
curl -sSL https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/pre-commit.py > .git/hooks/pre-commit
curl -sSL https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/.gitleaks.toml > .gitleaks.toml

sudo apt-get update
sudo apt-get install -y git make golang
git clone https://github.com/gitleaks/gitleaks.git
cd gitleaks
make build

# Make the pre-commit script executable
chmod +x .git/hooks/pre-commit

echo "Gitleaks pre-commit hook installed in $(pwd)/.git/hooks."
