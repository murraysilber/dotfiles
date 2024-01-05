#!/bin/zsh

# Mac Details
CPU_ARCHITECTURE=$(arch)
MAC_OS_VERSION=$(sw_vers -productVersion)
OS_MAJOR_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\1/')
OS_MINOR_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\2/')

# Is this Mac supported?
is_mac_supported() {
  echo 'Checking if your Mac is supported'
  # check if macOS is Sonoma AND CPU is ARM Architecture
  # TODO add check for Ventura as well, in fact, anything from Big Sur that supports ARM architecture. Need to decide Just how much testing I want to do.

  if [[ "${CPU_ARCHITECTURE}" == "arm64" && "${OS_MAJOR_VERSION}" -eq 14 ]]; then
    # TODO fix messaging if time permits. Make prettier and explain why
    message "You are good to go\n"
  else
    message "stop" "Your Mac is unsupported"
    exit 1
  fi
}

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Run Pre-flight Checks
pre_flight_checks() {
  message "info" "Running pre-flight checks\n"
  is_mac_supported
}

pre_flight_checks
