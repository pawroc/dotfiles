#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
INSTALL_DIR=${INSTALL_DIR:="${HOME}"}

# shellcheck source=./../bash/colors.sh
source "${SCRIPT_DIR}/../bash/colors.sh"

echo -e "${YELLOW}Checking zsh...${RESET_COLORS}"
if ! command -v zsh &>/dev/null; then
  echo -e "${RED}zsh is not installed. Install it first and run script again${RESET_COLORS}"
  exit 1
fi

files_to_be_installed=(".zshrc" ".zsh_variables" ".zsh_aliases")

for file in "${files_to_be_installed[@]}"; do
  if [[ ! -e "${INSTALL_DIR}/${file}" ]]; then
    cp "${SCRIPT_DIR}/${file}" "${INSTALL_DIR}/${file}"
  else
    echo -e "You already have ${file} installed"
  fi
done

echo -e "${GREEN}Done${RESET_COLORS}"
