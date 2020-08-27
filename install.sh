#!/bin/bash

SCRIPT_DIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))"

source "${SCRIPT_DIR}/bash/colors.sh"

echo -e "${YELLOW}Installing bash colors...${RESET_COLORS}"
bash "${SCRIPT_DIR}/bash/install.sh"

echo -e "${YELLOW}Installing fzf...${RESET_COLORS}"
bash "${SCRIPT_DIR}/fzf/install.sh"

echo -e "${YELLOW}Installing zsh...${RESET_COLORS}"
bash "${SCRIPT_DIR}/zsh/install.sh"

echo -e "${YELLOW}Installing Antigen...${RESET_COLORS}"
bash "${SCRIPT_DIR}/antigen/install.sh"

echo -e "${GREEN}Done${RESET_COLORS}"
