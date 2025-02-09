#!/usr/bin/env bash

# macOS Version
IS_APPLE_CPU=$(sysctl -n machdep.cpu.brand_string | grep -i "apple") # Apple M1 Hardware = "Apple processor"
echo "Apple CPU: " ${IS_APPLE_CPU}
MAC_OS_VERSION=$(sw_vers -productVersion)
echo "version: " ${MAC_OS_VERSION}
OS_MAJOR_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\1/')
echo "major version: " ${OS_MAJOR_VERSION}
OS_MINOR_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\2/')
echo "minor version: " ${OS_MINOR_VERSION}
OS_MINOR_PATCH_VERSION=$(echo $MAC_OS_VERSION | sed -E 's/([0-9]+)\.([0-9]+)\.?([0-9]+)?/\3/')
echo "minor patch version: " ${OS_MINOR_PATCH_VERSION}

# support from macOS Monterey
if [[ ${OS_MAJOR_VERSION} -gt 12 ]]; then
  OS_UNSUPPORTED=false
else
  OS_UNSUPPORTED=true
fi

echo "unsupported?: " ${OS_UNSUPPORTED}
