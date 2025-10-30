# https://github.com/geerlingguy/mac-dev-playbook.git

#!/bin/bash

set -e

echo "Installing os-playbook"

# Ensure we're running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "This script is only for macOS."
  exit 1
fi

# Install Xcode Command Line Tools (needed for Homebrew)
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  # Wait until installation completes
  until xcode-select -p &>/dev/null; do
    sleep 5
  done
else
  echo "Xcode Command Line Tools already installed."
fi

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "✅ Homebrew already installed."
fi

# Update and install dependencies
brew update
brew upgrade

# Install Ansible
if ! command -v ansible &>/dev/null; then
  echo "📦 Installing Ansible..."
  brew install ansible
else
  echo "✅ Ansible already installed."
fi

# (Optional) Clone your Ansible repository
REPO_URL="https://github.com/your-org/macos-ansible.git"
TARGET_DIR="$HOME/ansible"

if [ ! -d "$TARGET_DIR" ]; then
  echo "📁 Cloning Ansible playbooks..."
  git clone "$REPO_URL" "$TARGET_DIR"
else
  echo "✅ Ansible playbooks directory already exists: $TARGET_DIR"
fi

# Run an initial ping to verify
echo "🔍 Testing Ansible setup..."
ansible localhost -m ping

echo "🎉 macOS is ready for Ansible management!"
