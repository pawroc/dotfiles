#!/bin/bash

SCRIPT_DIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))"
INSTALL_DIR="${HOME}/.bin"
ANTIGEN_PATH="${INSTALL_DIR}/antigen.zsh"

source "${SCRIPT_DIR}/../bash/colors.sh"

if [[ ! -e "${ANTIGEN_PATH}" ]]; then
  echo -e "${YELLOW}Installing antigen into ${ANTIGEN_PATH}...${RESET_COLORS}"
  mkdir -p ${INSTALL_DIR}
  touch ${ANTIGEN_PATH}
  curl -L git.io/antigen > "${ANTIGEN_PATH}"
else
  echo -e "${GREEN}You already have antigen installed in '${ANTIGEN_PATH}'${RESET_COLORS}"
  exit 1
fi

echo -e "${YELLOW}Installing .antigenrc...${RESET_COLORS}"
ln -sv ${SCRIPT_DIR}/.antigenrc ${HOME}/.antigenrc
echo -e "${GREEN}Done${RESET_COLORS}"
