#!/bin/bash

rm -rf gitleaks/
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
sudo apt-get install -y git make wget
wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version

git clone https://github.com/gitleaks/gitleaks.git
cd gitleaks
make build
chmod +x gitleaks
mv gitleaks /usr/local/bin
cd ..

# Make the pre-commit script executable
chmod +x .git/hooks/pre-commit
rm go1.20.5.linux-amd64.tar.gz
echo "Gitleaks pre-commit hook installed in $(pwd)/.git/hooks."
