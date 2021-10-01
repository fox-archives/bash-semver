# shellcheck shell=bash

eval "$(basalt-package-init)"; basalt.package-init
basalt.package-load
basalt.load 'github.com/hyperupcall/bats-common-utils' 'load.bash'

load './util/test_util.sh'
