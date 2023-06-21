#!python3
import subprocess
import sys
import platform
import os

# Function to install gitleaks
def install_gitleaks():
    system = platform.system()
    print(system+"/n")

    if system == 'Darwin':
        brew_install_gitleaks()
    elif system == 'Linux':
        linux_install_gitleaks()
    elif system == 'Windows':
        choco_install_gitleaks()
    else:
        print('Unsupported operating system: {}'.format(system))
        sys.exit(1)

def brew_install_gitleaks():
    try:
        subprocess.run(['brew', 'install', 'gitleaks'], check=True)
    except subprocess.CalledProcessError as err:
        print('Failed to install gitleaks: {}'.format(err))
        sys.exit(1)

def linux_install_gitleaks():
    try:
        # Clone the Gitleaks repository
        subprocess.run(['git', 'clone', 'https://github.com/zricethezav/gitleaks.git'], check=True)
        # Change to the cloned repository directory
        subprocess.run(['cd', 'gitleaks'], check=True, shell=True)
        # Build Gitleaks
        subprocess.run(['make', 'build'], check=True, shell=True)
        # Move the Gitleaks binary into /usr/local/bin
        subprocess.run(['sudo', 'mv', 'gitleaks', '/usr/local/bin'], check=True)
    except subprocess.CalledProcessError as err:
        print('Failed to install gitleaks: {}'.format(err))
        sys.exit(1)

def choco_install_gitleaks():
    try:
        subprocess.run(['choco', 'install', '-y', 'gitleaks'], check=True)
    except subprocess.CalledProcessError as err:
        print('Failed to install gitleaks: {}'.format(err))
        sys.exit(1)

# Function to check for gitleaks installation
def check_gitleaks():
    try:
        subprocess.run(['gitleaks', 'version'], stdout=subprocess.PIPE, check=True)
    except subprocess.CalledProcessError:
        install_gitleaks()


# Check for gitleaks installation and enable it with git config
check_gitleaks()


def gitleaksEnabled():
    """Determine if the pre-commit hook for gitleaks is enabled."""
    out = subprocess.getoutput("git config --bool hooks.gitleaks")
    if out == "false":
        return False
    return True


if gitleaksEnabled():
    process = subprocess.run(['gitleaks', 'protect', '-v', '--staged'], shell=True)
    exitCode = process.returncode
    if exitCode == 1:
        print('''Warning: gitleaks has detected sensitive information in your changes.
To disable the gitleaks precommit hook run the following command:

    git config hooks.gitleaks false
''')
        sys.exit(1)
else:
    print('gitleaks precommit disabled\
     (enable with `git config hooks.gitleaks true`)')
