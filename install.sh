#!/bin/bash

# Download the pre-commit script and its config file
curl -sSL https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/pre-commit.py > .git/hooks/pre-commit
curl -sSL https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/.gitleaks.toml > .gitleaks.toml

# Make the pre-commit script executable
chmod +x .git/hooks/pre-commit

echo "Gitleaks pre-commit hook installed in $(pwd)/.git/hooks."
