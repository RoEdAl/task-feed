#!/bin/sh

readonly FEEDS_URL=https://roedal.github.io/task-feed

echoerr() {
  echo "$@" | logger -st task-feed
}

get_distrib_arch() {
  . /etc/openwrt_release
  echo "$DISTRIB_ARCH"
}

test_feed() {
  wget -qO /dev/null "$1/packages.adb"
}

if [ ! -s /etc/openwrt_release ]; then
  echoerr Error - not OpenWRT OS
  exit 1
fi

ARCH=$(get_distrib_arch)
if [ -z "$ARCH" ]; then
  echoerr Error - unable to read architecture
  exit 1
fi
echo Architecture: $ARCH

readonly FEED_URL="$FEEDS_URL/$ARCH/gomplate"
if ! test_feed "$FEED_URL"; then
  echoerr Error - invalid feed URL: $FEED_URL
  exit 1
fi

readonly REPO_LIST=/etc/apk/repositories.d/gomplate.list
if [ ! -s "$REPO_LIST" ]; then
  echo Repository: $FEED_URL
  echo "$FEED_URL/packages.adb" > $REPO_LIST
  if [ $? -ne 0 ]; then
    echoerr Error installing repository
    exit 1
  fi
fi

readonly SIGNING_KEY="/etc/apk/keys/gomplate.pem"
if [ ! -s "$SIGNING_KEY" ]; then
  echo Installing signing key
  if ! wget -qO $SIGNING_KEY "$FEEDS_URL/signing-key/gomplate.pem"; then
    echoerr Error installing signing key
    exit 1
  fi
fi

echo Done
exit 0
