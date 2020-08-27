#!/bin/bash

SCRIPT_DIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
INSTALL_DIR="${HOME}/.bin"
ANTIGEN_PATH="${INSTALL_DIR}/antigen.zsh"

source "${SCRIPT_DIR}/../bash/colors.sh"

if [[ ! -e "${ANTIGEN_PATH}" ]]; then
  echo -e "${YELLOW}Installing antigen...${RESET_COLORS}"
  mkdir -p ${INSTALL_DIR}
  touch ${ANTIGEN_PATH}
  curl -L git.io/antigen > "${ANTIGEN_PATH}"
  echo -e "${GREEN}Done. Antigen installed in ${ANTIGEN_PATH}"
else
  echo -e "${GREEN}You already have antigen installed in '${ANTIGEN_PATH}'${RESET_COLORS}"
fi
