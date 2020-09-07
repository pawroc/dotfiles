#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
INSTALL_DIR="${INSTALL_DIR:=${HOME}}"

#shellcheck source=./../bash/colors.sh
source "${SCRIPT_DIR}/../bash/colors.sh"

function remove_file()
{
  local file_path; file_path="${1}"
  rm -v "${file_path}"
}

function uninstall()
{
  for file in "${SCRIPT_DIR}"/.zsh*; do
    local file_path; file_path="${INSTALL_DIR}/${file##*/}"
    [[ -f "${file_path}" ]] && remove_file "${file_path}"
  done
}

function main()
{
  uninstall
}

main
