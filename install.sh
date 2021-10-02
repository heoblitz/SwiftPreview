#!/usr/bin/env sh

# path
XCODE_DIR=$HOME'/Library/Developer/Xcode'
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/SwiftPreview'

# check xcode folder
if [ ! -d "$XCODE_DIR" ]; then
  echo "Error: XCODE is not installed 🤖"
  echo "${XCODE_DIR} is not exist"
  exit 1
fi

# check template folder
if [ ! -d "$XCODE_TEMPLATE_DIR" ]; then
  echo "Add: template folder 🗂"
  mkdir -p "$XCODE_TEMPLATE_DIR"
  echo "-> ${XCODE_TEMPLATE_DIR}"
fi

# install SwiftPreview

# install SwiftPreviewController

