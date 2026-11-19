#!/bin/bash
set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE}")/.." && pwd)"

install -Dm755 "$REPO_DIR/bin/fml_pkg" /usr/bin/fml_pkg
if [ ! -f /etc/fml_pkg.conf ]; then
    install -Dm644 "$REPO_DIR/config/fml_pkg.conf" /etc/fml_pkg.conf
fi
echo "[+] fml_pkg установлен в /usr/bin/fml_pkg."
