#!/usr/bin/env zsh

message() {

  # Color Outputs
  local GREEN="\033[0;32m"
  local RED="\033[0;31m"
  local YELLOW="\033[0;33m"
  local NC="\033[0m"
  local BLUE="\033[00;34m"

  if [[ "$1" = "success" ]]; then
    local msg="\n${NC}[${GREEN} OK ${NC}] ${2}${NC}"
  elif [[ "$1" = "warning" ]]; then
    local msg="\n${NC}[${YELLOW}WARN${NC}] ${2}${NC}"
  elif [[ "$1" = "fail" ]]; then
    local msg="\n${NC}[${RED}FAIL${NC}] ${2}${NC}"
  elif [[ "$1" = "info" ]]; then
    local msg="\n${NC}[${BLUE}INFO${NC}] ${2}${NC}"
  fi

  shift
  printf "${msg}"
}

message "info" "Info message using message function"
message "warning" "Warning message using message function"
message "fail" "Failure message using message function"
message "success" "Success message using message function"
