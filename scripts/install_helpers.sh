#!/bin/bash

function install_file()
{
  local file="${1}"
  local destination="${2}"

  if [[ -e "${destination}" ]]; then
    read -p "File '${destination}' exists. Do you want to override it? [y/n] " answer

    if [[ "${answer}" =~ [yY] ]]; then
      cp -v "${file}" "${destination}"
    fi
  fi
}

