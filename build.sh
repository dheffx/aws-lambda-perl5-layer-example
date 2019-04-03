#!/bin/bash

set -ue

# install deps
cd "$BASE_DIR" || exit 1
if test -f "cpanfile"; then
    /opt/bin/carton install
fi

# packing
zip -ru "${BASE_DIR}/${FUNC_NAME}.zip" . -x \*.pod -x local/cache/\* -x local/man/\* -x build.sh -x cpanfile\* -x .gitignore -x Makefile -x README.md

