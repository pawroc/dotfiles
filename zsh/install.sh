#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
INSTALL_DIR=${INSTALL_DIR:="${HOME}"}

# shellcheck source=./../bash/colors.sh
source "${SCRIPT_DIR}/../bash/colors.sh"

function installed()
{
  local cmd; cmd=$(command -v "${1}")

  [[ -n "${cmd}" ]] && [[ -f "${cmd}" ]]
  return ${?}
}

function die()
{
  >&2 echo -e "${RED}Fatal: ${1}${RESET_COLORS}"
  exit 1
}

function install()
{
  for file in "${SCRIPT_DIR}"/.zsh*; do
    local file_name; file_name="${file##*/}"
    if [[ ! -e "${INSTALL_DIR}/${file_name}" ]]; then
      cp "${file}" "${INSTALL_DIR}/${file_name}"
    else
      echo -e "You already have ${file_name} installed"
    fi
  done

  echo -e "${GREEN}Done${RESET_COLORS}"
}

function main()
{
  installed "zsh" || die "zsh is not installed. Install it first and run script again"
  install
}

main
