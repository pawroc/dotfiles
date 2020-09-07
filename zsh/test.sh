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
  echo -e "${GREEN}${1} PASSED${RESET_COLORS}"
}

function cleanup()
{
  [[ -d "${install_dir}" ]] && rm -frv "${install_dir}"
}
trap cleanup EXIT

function run_install_cmd()
{
  INSTALL_DIR="${install_dir}" "./install.sh"
}

function run_uninstall_cmd()
{
  INSTALL_DIR="${install_dir}" "./uninstall.sh"
}

function check_installed_files()
{
  local failed; failed=0
  local expected_files; expected_files=".zsh*"
  for file in "${SCRIPT_DIR}"/${expected_files}; do
    file_name="${file##*/}"
    [[ -f "${install_dir}/${file_name}" ]] || { fail "File ${file_name} not installed properly"; failed=1; }
  done
  return "${failed}"
}

function check_uninstalled_files()
{
  local failed; failed=0
  for file in "${install_dir}"/.zsh*; do
    [[ -f "${file}" ]] && { fail "File ${file} not uninstalled properly"; failed=1; }
  done
  return "${failed}"
}

function test_install()
{
  install_dir=$(mktemp -d)
  local expected_files; expected_files=".zsh*"

  run_install_cmd
  check_installed_files && success "test_install"
}

function test_uninstall()
{
  install_dir=$(mktemp -d)

  run_install_cmd
  run_uninstall_cmd
  check_uninstalled_files && success "test_uninstall"
}

function run_tests()
{
  test_install
  test_uninstall
}

run_tests
