#!/bin/bash

INSTALL_DIR="${HOME}/.bash"
SCRIPT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

[[ ! -d "${INSTALL_DIR}" ]] && mkdir -p "${INSTALL_DIR}"

ln -sv "${SCRIPT_PATH}/colors.sh" "${INSTALL_DIR}/colors.sh"
