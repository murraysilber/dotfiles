#!/bin/zsh

# macOS Version
IS_APPLE_CPU=$(sysctl -n machdep.cpu.brand_string | grep -i "apple") # Apple M1 Hardware = "Apple processor"
echo "Apple CPU: " ${IS_APPLE_CPU}
MAC_OS_VERSION=$(sw_vers -productVersion)
echo "version: " ${MAC_OS_VERSION}
OS_MAJOR_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\1/')
echo "major version: " ${OS_MAJOR_VERSION}
OS_MINOR_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\2/')
echo "minor version: " ${OS_MINOR_VERSION}

if [ ${OS_MAJOR_VERSION} -eq 14 ]; then
    IS_SONOMA=true
    OS_UNSUPPORTED=false
else
    OS_UNSUPPORTED=true
fi

# elif [ ${OS_MAJOR_VERSION} -eq 10 ]; then
#     if [ ${OS_MINOR_VERSION} -gt 14 ]; then
#         IS_CATALINA=true # 15 (Catalina)
#     elif [ ${OS_MINOR_VERSION} -eq 14 ]; then
#         IS_CATALINA=false # 14 (Mojave)
#         DEFAULT_SHELL="bash"
#         SHELL_PROFILE_FILE="${BASH_PROFILE_PATH}"
#     else
#         OS_UNSUPPORTED=true
#     fi
# else
#     OS_UNSUPPORTED=true
# fi

echo "unsupported?: " ${OS_UNSUPPORTED}
