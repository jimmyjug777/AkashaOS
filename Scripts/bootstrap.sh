
#!/data/data/com.termux/files/usr/bin/bash
# bootstrap.sh — Full Ritual Setup

echo "[🧱] Initiating TruthFlow Setup..."

# Core Packages
pkg update -y && pkg upgrade -y
pkg install -y git openssh termux-api termux-services tsu curl nano

# Setup SSH Key (if absent)
if [ ! -f ~/.ssh/id_ed25519 ]; then
  echo "[🔑] Generating SSH key..."
  mkdir -p ~/.ssh
  ssh-keygen -t ed25519 -C "JimmyBuilder@truthflow" -f ~/.ssh/id_ed25519 -N ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
  echo "[📋] SSH Public Key:"
  cat ~/.ssh/id_ed25519.pub
fi

# Git Identity
git config --global user.name "JimmyBuilder"
git config --global user.email "your@email.com"

# Clone Main Grimoire Repo
REPO_URL="git@github.com:yourusername/yourrepo.git"
REPO_DIR=~/yourrepo

if [ ! -d "$REPO_DIR" ]; then
  echo "[🌱] Cloning your Grimoire..."
  git clone $REPO_URL $REPO_DIR
fi

echo "[✅] Initial Ritual Complete. Ready to Flow."
