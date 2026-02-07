#!/usr/bin/env bash
# Push this folder's contents to the F5-Traffic-Simulator repo on GitHub.
# Usage: ./push_to_f5_traffic_repo.sh [repo-url]
# Default: https://github.com/angelatierney/F5-Traffic-Simulator.git

set -e

REPO_URL="${1:-https://github.com/angelatierney/F5-Traffic-Simulator.git}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
TEMP_DIR="${PARENT_DIR}/f5-traffic-push-$$"

echo "Copying f5-traffic-simulator to temporary directory..."
rsync -a --exclude='.git' --exclude='*.retry' "$SCRIPT_DIR/" "$TEMP_DIR/"

echo "Initializing git and creating initial commit..."
cd "$TEMP_DIR"
git init
git add .
git commit -m "Initial commit: F5 Traffic Simulator (load balancer IaC)"

echo "Pushing to $REPO_URL ..."
git branch -M main
git remote add origin "$REPO_URL"
# If the repo already has an initial README/commit, overwrite with this project
git push -u origin main --force

echo "Cleaning up..."
cd /
rm -rf "$TEMP_DIR"

echo "Done. F5-Traffic-Simulator repo is now populated."
echo "To work from a dedicated clone: git clone $REPO_URL F5-Traffic-Simulator && cd F5-Traffic-Simulator"
