#!/bin/bash

DEPS=(z nvm zsh-syntax-highlighting tmux yarn reattach-to-user-namespace terminal-notifier fd httpie ripgrep pwgen watchman)

brew install "${DEPS[@]}"
