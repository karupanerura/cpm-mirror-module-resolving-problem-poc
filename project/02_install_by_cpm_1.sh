#!/bin/bash
set -ue

cd $(dirname $0)

# show commands
set -x

# cleanup
[ -d local ] && rm -rf local

cpm install --snapshot=cpanfile.snapshot --mirror=file://$(pwd)/../darkpan
