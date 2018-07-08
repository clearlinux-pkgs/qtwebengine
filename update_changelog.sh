#!/bin/sh
# Get version from Makefile
eval `sed -En '/URL\s*:?=\s*/{s///;s,.*-([0-9.]+)-clean\.tar.xz,VERSION=\1,p;}' Makefile`

PKG_NAME=qtwebengine
CHANGES_FILE=https://code.qt.io/cgit/qt/$PKG_NAME.git/plain/dist/changes-$VERSION?h=v$VERSION

rm -f NEWS ChangeLog
wget -O ChangeLog "$CHANGES_FILE" || \
    echo > ChangeLog "No changelog file found for $PKG_NAME $VERSION"
