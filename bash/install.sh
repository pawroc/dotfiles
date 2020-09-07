#!/bin/bash

INSTALL_DIR="${HOME}/.bash"
SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# shellcheck source=../scripts/install_helpers.sh
source "${SCRIPT_PATH}/../scripts/install_helpers.sh"

[[ ! -d "${INSTALL_DIR}" ]] && mkdir -p "${INSTALL_DIR}"

install_file "${INSTALL_DIR}/colors.sh" "${INSTALL_DIR}/colors.sh"
install_file "${SCRIPT_PATH}/.bashrc" "${HOME}/.bashrc"
install_file "${SCRIPT_PATH}/.bash_aliases" "${HOME}/.bash_aliases"
install_file "${SCRIPT_PATH}/.bash_variables" "${HOME}/.bash_variables"

#[[ ! -e "${INSTALL_DIR}/colors.sh" ]] && cp "${SCRIPT_PATH}/colors.sh" "${INSTALL_DIR}/colors.sh"
#[[ ! -e "${HOME}/.bashrc" ]] && cp "${SCRIPT_PATH}/.bashrc" "${HOME}/.bashrc"
#[[ ! -e "${HOME}/.bash_aliases" ]] && cp "${SCRIPT_PATH}/.bash_aliases" "${HOME}/.bash_aliases"
#[[ ! -e "${HOME}/.bash_variables" ]] && cp "${SCRIPT_PATH}/.bash_variables" "${HOME}/.bash_variables"

