#!/usr/bin/env sh

echo $SwiftPreviews

# path
XCODE_DIR=$HOME'/Library/Developer/Xcode'
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/SwiftPreview'
GIT_PATH="https://raw.githubusercontent.com/heoblitz/SwiftPreview/main/Templates"
VIEW_PATH=$XCODE_TEMPLATE_DIR'/SwiftPreview.xctemplate'
CONTROLLER_PATH=$XCODE_TEMPLATE_DIR'/SwiftPreviewController.xctemplate'

init() {
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
}

install() {
  VIEWS=(
    "UICollectionReusableViewSwift" 
    "UICollectionReusableViewXIBSwift"
    "UICollectionViewCellSwift"
    "UICollectionViewCellXIBSwift"
    "UITableViewCellSwift"
    "UITableViewCellXIBSwift"
    "UIViewSwift"
  )

  CONTROLLERS=(
    "UICollectionViewControllerSwift" 
    "UICollectionViewControllerXIBSwift"
    "UITableViewControllerSwift"
    "UITableViewControllerXIBSwift"
    "UIViewControllerSwift"
    "UIViewControllerXIBSwift"
  )

  mkdir "$VIEW_PATH"
  mkdir "$CONTROLLER_PATH"

  for NAME in ${VIEWS[@]}; do
    CURRENT_PATH="${VIEW_PATH}/${NAME}"
    mkdir "$CURRENT_PATH"
    download "${GIT_PATH}/SwiftPreview.xctemplate/${NAME}/___FILEBASENAME___.swift"
  done

  for NAME in ${CONTROLLERS[@]}; do
    mkdir "${CONTROLLER_PATH}/${NAME}"
    mkdir "$CURRENT_PATH"
    download "${GIT_PATH}/SwiftPreviewController.xctemplate/${NAME}/___FILEBASENAME___.swift"
  done
}

download() {
  echo "$1"
  cd "" && { curl -sSOL "$1" ; cd -; }
}

init
install

