#!/bin/bash
set -ue

cd $(dirname $0)

# show commands
set -x

# cleanup
[ -d local ] && rm -rf local

cpm install --resolver=snapshot,http://cpan.metacpan.org --resolver=snapshot,file://$(pwd)/../darkpan
