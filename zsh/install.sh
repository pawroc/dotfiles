#!/bin/bash

SCRIPT_DIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
INSTALL_DIR="${HOME}"

source "${SCRIPT_DIR}/../bash/colors.sh"

echo -e "${YELLOW}Checking zsh...${RESET_COLORS}"
if ! command -v zsh &>/dev/null; then
  echo -e "${RED}zsh is not installed. Install it first and run script again${RESET_COLORS}"
fi

if [[ ! -e "${INSTALL_DIR}/.zshrc" ]]; then
  ln -sv ${SCRIPT_DIR}/.zshrc ${INSTALL_DIR}/.zshrc
else
  echo -e "You already have .zshrc installed"
fi

echo -e "${GREEN}Done${RESET_COLORS}"
