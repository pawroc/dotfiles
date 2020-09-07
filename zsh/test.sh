#!/usr/bin/env bash

set -ueo pipefail

# shellcheck source=./../bash/colors.sh
source "${PWD}/../bash/colors.sh"

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

function fail()
{
  >&2 echo -e "${RED}TEST FAILED: ${*} ${RESET_COLORS}"
  tests_failed=1
}

function success()
{
  echo -e "${GREEN}SUCCESS!${RESET_COLORS}"
}

function cleanup()
{
  [[ -d "${install_dir}" ]] && rm -frv "${install_dir}"
}
trap cleanup EXIT

function run_cmd()
{
  INSTALL_DIR="${install_dir}" "./install.sh"
}

function run_test()
{
  install_dir=$(mktemp -d)
  local expected_files; expected_files=".zsh*"

  run_cmd
  tests_failed=""
  for file in "${SCRIPT_DIR}"/${expected_files}; do
    file="${file##*/}"
    [[ -f "${install_dir}/${file}" ]] || fail "File ${install_dir}/${file} does not exists"
  done
  [[ -z "${tests_failed}" ]] && success
}

run_test
