#!/bin/zsh

welcome() {
    m[0]="\n${YELLOW}  ___  ____  ____  __  __  ____\n"
    m[1]="/ __)( ___)(_  _)(  )(  )(  _ \\ \n"
    m[2]="\__ \ )__)   )(   )(__)(  )___/\n"
    m[3]="(___/(____) (__) (______)(__)\n${NC}\n"

    echo -e "${m[@]}"
    echo -e "This script will automate a lot of processes.\n"
    echo -e "Though not recommended interrupting, exit this script at any time with Ctrl-C.\n"
    sleep 2
    echo -e "Press Ctrl-C to STOP ${EMOJI_STOP} now if you ${RED}don't${NC} wish to proceed. Starting in 5 seconds...\n"
    sleep 5
    echo -e "Starting automated install:\n"
    echo -e "Type: ${SETUP_TYPE}\n"
    echo -e "Mode: $(if [ -n "${MODE}" ]; then echo "${MODE}"; else echo "N/A"; fi)\n"
    echo -e "\n"
}
