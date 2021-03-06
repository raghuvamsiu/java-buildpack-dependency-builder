#!/usr/bin/env bash

set -e -u -o pipefail

source $(dirname "$0")/common.sh

VERSION=$(cat your-kit-archives/version)

INDEX_PATH_MOUNTAINLION="/your-kit/mountainlion/x86_64/index.yml"
INDEX_PATH_TRUSTY="/your-kit/trusty/x86_64/index.yml"
UPLOAD_PATH_MOUNTAINLION="/your-kit/mountainlion/x86_64/your-kit-$VERSION.jnilib"
UPLOAD_PATH_TRUSTY="/your-kit/trusty/x86_64/your-kit-$VERSION.so"

unzip -qq "your-kit-archives/yjp-*.zip"

transfer_to_s3 'yjp-*/bin/mac/libyjpagent.jnilib' $UPLOAD_PATH_MOUNTAINLION
transfer_to_s3 'yjp-*/bin/linux-x86-64/libyjpagent.so' $UPLOAD_PATH_TRUSTY
update_index $INDEX_PATH_MOUNTAINLION $VERSION $UPLOAD_PATH_MOUNTAINLION
update_index $INDEX_PATH_TRUSTY $VERSION $UPLOAD_PATH_TRUSTY
invalidate_cache $INDEX_PATH_MOUNTAINLION $UPLOAD_PATH_MOUNTAINLION $INDEX_PATH_TRUSTY $UPLOAD_PATH_TRUSTY
