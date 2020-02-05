#!/bin/bash
set -ue

cd $(dirname $0)

# show commands
set -x

# cleanup
[ -d local ] && rm -rf local

export PERL_CARTON_MIRROR=file://$(pwd)/../darkpan
carton install --deployment
