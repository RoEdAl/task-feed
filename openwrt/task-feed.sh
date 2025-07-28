#!/bin/sh

readonly FEEDS_URL=https://roedal.github.io/task-feed
readonly FINGERPRINT=5e469ef69a7a32b4

echoerr() {
  echo "$@" | logger -st graphite-feed
}

get_distrib_arch() {
  . /etc/openwrt_release
  echo "$DISTRIB_ARCH"
}

test_feed() {
  wget -qO /dev/null "$1/Packages.manifest"
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
echoerr Architecture: $ARCH

readonly FEED_URL="$FEEDS_URL/$ARCH/graphite"
if ! test_feed "$FEED_URL"; then
  echoerr Error - invalid feed URL: $FEED_URL
  exit 1
fi

readonly CUSTOM_FEED=$(cat /etc/opkg/customfeeds.conf | grep graphite)
if [ -z "$CUSTOM_FEED" ]; then
  echoerr Installing feed: $FEED_URL
  echo "src/gz graphite $FEED_URL" >>/etc/opkg/customfeeds.conf
  if [ $? -ne 0 ]; then
    exit 1
  fi
fi

readonly SIGNING_KEY="/etc/opkg/keys/$FINGERPRINT"
if [ ! -s "$SIGNING_KEY" ]; then
  echoerr Installing signing key: $FINGERPRINT
  if ! wget -qO $SIGNING_KEY "$FEEDS_URL/signing-key/$FINGERPRINT"; then
    exit 1
  fi
fi

echoerr Done
exit 0
