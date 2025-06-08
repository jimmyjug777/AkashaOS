#!/data/data/com.termux/files/usr/bin/bash
# auto-setup-git-ssh.sh
# Sets up SSH keys, configures git user, and clones repo

# Generate SSH key if none exists
if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -C "u0_a249@localhost" -f ~/.ssh/id_ed25519 -N ""
fi

# Start ssh-agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Configure git user info
git config --global user.name "JimmyBuilder"
git config --global user.email "your-email@example.com"

# Add github.com to known hosts to avoid prompt
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clone your repo if it doesn't exist
REPO_URL="git@github.com:yourusername/yourrepo.git"
REPO_DIR=~/yourrepo

if [ ! -d "$REPO_DIR" ]; then
  git clone $REPO_URL $REPO_DIR
fi

echo "Git + SSH setup complete."