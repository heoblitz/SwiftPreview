#!/usr/bin/env sh
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
    echo "Add: Template folder 🗂"
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

  CORES=(
    "TemplateIcon-1016.png"
    "TemplateIcon-1016@2x.png"
    "TemplateInfo.plist"
  )

  mkdir "$VIEW_PATH"
  mkdir "$CONTROLLER_PATH"

  for NAME in ${VIEWS[@]}; do
    CURRENT_PATH="${VIEW_PATH}/${NAME}"
    mkdir "$CURRENT_PATH"
    FILE_URL="${GIT_PATH}/SwiftPreview.xctemplate/${NAME}/___FILEBASENAME___.swift"
    download "$CURRENT_PATH" "$FILE_URL" "${NAME}/___FILEBASENAME___.swift"

    if [[ $NAME == *"XIB"* ]]; then
      FILE_URL="${GIT_PATH}/SwiftPreview.xctemplate/${NAME}/___FILEBASENAME___.xib"
      download "$CURRENT_PATH" "$FILE_URL" "${NAME}/___FILEBASENAME___.xib"
    fi
  done

  for NAME in ${CORES[@]}; do
    FILE_URL="${GIT_PATH}/SwiftPreview.xctemplate/${NAME}"
    download "$VIEW_PATH" "$FILE_URL" "${NAME}"
  done

  for NAME in ${CONTROLLERS[@]}; do
    CURRENT_PATH="${CONTROLLER_PATH}/${NAME}"
    mkdir "$CURRENT_PATH"
    FILE_URL="${GIT_PATH}/SwiftPreviewController.xctemplate/${NAME}/___FILEBASENAME___.swift"
    download "$CURRENT_PATH" "$FILE_URL" "${NAME}/___FILEBASENAME___.swift"

    if [[ $NAME == *"XIB"* ]]; then
      FILE_URL="${GIT_PATH}/SwiftPreviewController.xctemplate/${NAME}/___FILEBASENAME___.xib"
      download "$CURRENT_PATH" "$FILE_URL" "${NAME}/___FILEBASENAME___.xib"
    fi
  done

  for NAME in ${CORES[@]}; do
    FILE_URL="${GIT_PATH}/SwiftPreviewController.xctemplate/${NAME}"
    download "$CONTROLLER_PATH" "$FILE_URL" "${NAME}"
  done

  echo "Complete: SwiftPreview template installed 🖼"
}

download() {
  echo "Download: ${3} 🗳"
  cd "$1" && { curl -sSOL "$2" ; cd - > /dev/null ; }
}

init
install
