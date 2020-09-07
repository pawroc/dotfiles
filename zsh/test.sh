#!/usr/bin/env bash

set -ueo pipefail

# shellcheck source=./../bash/colors.sh
source "${PWD}/../bash/colors.sh"

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

function run_test()
{
  install_dir=$(mktemp -d)
  expected_files=$(find "${PWD}" -name ".zsh*")

  INSTALL_DIR="${install_dir}" "./install.sh"
  tests_failed=""
  for file in "${expected_files[@]}"; do
    file="${file##*/}"
    [[ -f "${install_dir}/${file}" ]] || fail "File ${install_dir}/${file} does not exists"
  done
  [[ -z "${tests_failed}" ]] && success
}

run_test
