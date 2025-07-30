#!/usr/bin/env bash
set -e
echo "=== Starting system cleanup ==="

echo "Disk usage before cleanup:"
sudo df -h

# Utility to check and run commands safely
run_if_available() {
  local cmd="$1"; shift
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "Running: $*"
    "$@" || echo "⚠️ Failed: $*"
  else
    echo "🔹 Skipping: '$cmd' not installed."
  fi
}

echo "Cleaning APT cache..."
run_if_available apt sudo apt clean autoclean autoremove -y

echo "Removing thumbnail cache..."
sudo rm -rf ~/.cache/thumbnails/*

echo "Removing old journal logs (older than 7d)..."
sudo journalctl --vacuum-time=7d

echo "Emptying Trash..."
sudo rm -rf ~/.local/share/Trash/* /root/.local/share/Trash/*

echo "Cleaning old Snap revisions..."
run_if_available snap LANG=en_US snap set system refresh.retain=2
run_if_available snap sudo snap remove --purge \
  "$(snap list --all | awk '/disabled/{print $1, $3}' | \
   while read snap ver; do echo "${snap} --revision=${ver}"; done)" || true

echo "Clearing pip cache..."
sudo rm -rf ~/.cache/pip

echo "Cleaning Conda packages..."
run_if_available conda conda clean --all -y

echo "Cleaning Docker..."
run_if_available docker sudo docker system prune -af
run_if_available docker sudo docker volume prune -f

echo "Cleaning Flatpak unused packages..."
run_if_available flatpak flatpak uninstall --unused -y

echo "Removing rotated logs..."
sudo find /var/log -type f -name "*.gz" -delete
sudo find /var/log -type f -name "*.1" -delete

echo "Clearing /tmp and /var/tmp directories..."
sudo rm -rf /tmp/* /var/tmp/*

echo "Clearing Firefox cache & session data..."
sudo rm -rf ~/.cache/mozilla/firefox/*
sudo rm -f ~/.mozilla/firefox/*.default/*.sqlite ~/.mozilla/firefox/*.default/sessionstore.js || true

echo "Clearing Chrome/Chromium cache & config..."
sudo rm -rf ~/.cache/google-chrome ~/.config/google-chrome
sudo rm -rf ~/.cache/chromium ~/.config/chromium

echo "Cleaning leaked semaphores and shared memory..."
find /dev/shm -name "sem.*" -exec rm -v {} \;
find /dev/shm -name "shm*" -exec rm -v {} \;

echo "Disk usage after cleanup:"
df -h

echo "=== Cleanup complete! ==="

