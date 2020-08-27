#!/bin/bash

SCRIPT_DIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
FZF_DIR="${HOME}/.fzf"
FZF_FILES=("key_bindings.zsh"
	   "completion.zsh")

source "${SCRIPT_DIR}/../bash/colors.sh"

echo -e "${YELLOW}Checking fzf...${RESET_COLORS}"
if ! command -v fzf &>/dev/null; then
  echo -e "${RED}fzf is not installed or not added to PATH. Install it first and run script again${RESET_COLORS}"
fi

[[ ! -d ${FZF_DIR} ]] && mkdir -p ${FZF_DIR}

for file in "${FZF_FILES[@]}"; do
  if [[ ! -e "${FZF_DIR}/${file}" ]]; then
      ln -sv ${SCRIPT_DIR}/${file} ${FZF_DIR}/${file}
  fi
done

echo -e "${GREEN}Done${RESET_COLORS}"
