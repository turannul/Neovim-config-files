#!/bin/bash
set -euo pipefail

nvim_dir=~/.config/nvim
backup_loc=~/.config/nvim_backup.zip

if ! command -v zip &>/dev/null || ! command -v git &>/dev/null; then
	echo "Error: 'zip' and 'git' must be installed."
	exit 1
fi

function backup() {
	zip -r "$backup_loc" "$nvim_dir"
	echo "Backup created: $backup_loc"
}

function cleanup() {
	rm -rf "$nvim_dir"
	echo "Removed $nvim_dir"
}

function clone() {
	git clone https://github.com/turannul/Neovim-config-files.git "$nvim_dir"
	echo "Cloned Neovim config to $nvim_dir"
}

if [ -d "$nvim_dir" ]; then
	if backup && cleanup; then
		clone
	else
		echo "Error: Backup or cleanup failed. Aborting."
		exit 1
	fi
else
	clone
fi