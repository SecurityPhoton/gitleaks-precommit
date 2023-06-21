# Gitleaks-precommit 
Script for GIT hook to check sensitive info on commit

## Gitleaks pre-commit hook installation and usage

This script installs the Gitleaks pre-commit hook in your Git project, which checks for sensitive information in your code before each commit using the Gitleaks tool.
## Installation Linux (Debian \ Ubuntu)

To install the pre-commit hook and its config file, run the following command in the root directory of your Git project:
```
curl -sSL https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/install.sh | sh
```
This will download and run the installation script, which will download the pre-commit.py script and .gitleaks.toml config file from the pontarr/gitleaks-precommit GitHub repository and save them in the .git/hooks directory and the root project directory, respectively. The pre-commit hook will be automatically executed before each commit.

## Installation MacOS
You need have a python3 preinstalled on your system.
You can just git clone this repo or download files and put the [script file](https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/pre-commit.py) into your .git/hooks/pre-commit file and [config file](https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/.gitleaks.toml) into the root of your git repo.
I have no chance to verify it working on Mac and thus it can be tricky to run it and might need changes.

## Installation Windows 
You need have a python3 preinstalled on your system. As well you need to have a choco packet manager installed.
You can just git clone this repo or download files and put the [script file 1](https://github.com/pontarr/gitleaks-precommit/blob/main/pre-commit-win.py) and [script file 2](https://github.com/pontarr/gitleaks-precommit/blob/main/pre-commit) into your .git/hooks/ folder preserving their names and [config file](https://raw.githubusercontent.com/pontarr/gitleaks-precommit/main/.gitleaks.toml) into the root of your git repo.


## Usage

Once the pre-commit hook is installed, it will automatically run before each commit. If Gitleaks detects any sensitive information in your code, the commit will be aborted and an error message will be displayed in the terminal.

You can customize the Gitleaks configuration by editing the .gitleaks.toml file in your project root.

To uninstall the pre-commit hook, simply delete the pre-commit file in your .git/hooks directory.
