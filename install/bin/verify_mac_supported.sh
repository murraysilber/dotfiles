#!/bin/zsh
#
# Pre flight checks to ensure Mac architecture and macOS Version is valid for the installation.

#######################################
# Verifies if the script will run on the target Mac.
# Currently, only tested on Sonoma and on Apple Silicon.
# Outputs (Output to STDOUT or STDERR):
#   Feedback to the user on stdout
#######################################
is_mac_supported() {
  local cpu_architecture
  cpu_architecture=$(arch)
  local mac_os_version
  mac_os_version=$(sw_vers -productVersion)
  local os_major_version
  os_major_version=$(echo $mac_os_version | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\1/')
  local os_minor_version
  os_minor_version=$(echo $mac_os_version | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\2/')

  echo 'Checking if your Mac is supported'
  # TODO add check for Ventura as well, in fact, anything from Big Sur that supports ARM architecture (Apple Silcon). Need to decide Just how much testing I want to do and if I will ever need an OS older than Sonoma, or even a Mac with Intel CPU architecture.

  if [[ "${cpu_architecture}" == "arm64" && "${os_major_version}" -eq 14 ]]; then
    # TODO fix messaging if time permits. Make prettier and explain why
    message 'You are good to go\n'
  else
    message "stop" 'Your Mac is unsupported\nExiting the script now!!!!'
    exit 1
  fi
}

#######################################
# Run Pre-flight Checks
# Outputs (Output to STDOUT or STDERR):
#   Feedback to the user on stdout
#######################################
pre_flight_checks() {
  message "info" "Running pre-flight checks"
  is_mac_supported
}

pre_flight_checks
