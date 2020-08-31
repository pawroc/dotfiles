#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
NVIM_CONFIG_DIR="${HOME}/.config/nvim"

# shellcheck source=./../bash/colors.sh
source "${SCRIPT_DIR}/../bash/colors.sh"

# Create symlinks
files=("init.vim" "coc-settings.json")
for file in "${files[@]}"; do
  echo -e "${YELLOW}Installing ${file}${RESET_COLORS}"
  ln -sv "${SCRIPT_DIR}/${file}" "${NVIM_CONFIG_DIR}"
done

# Copy autoload directory
echo -e "${YELLOW}Installing autoload directory${RESET_COLORS}"
cp -r "${SCRIPT_DIR}/autoload" "${NVIM_CONFIG_DIR}"

echo -e "${GREEN}Done${RESET_COLORS}"

