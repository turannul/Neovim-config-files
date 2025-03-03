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

function setup() {
	mkdir -p "$nvim_dir"
	cp -Rv lua/ init.lua "$nvim_dir"
	echo "Moved Neovim config to $nvim_dir"
}

if [ -d "$nvim_dir" ]; then
	if backup && cleanup; then
		setup
	else
		echo "Error: Backup or cleanup failed. Aborting."
		exit 1
	fi
else
	setup
fi