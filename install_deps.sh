#!/bin/bash

DEPS=(z nvm zsh-syntax-highlighting tmux yarn reattach-to-user-namespace terminal-notifier fd httpie ripgrep pwgen watchman uni2ascii git-quick-stats)

brew install "${DEPS[@]}"
