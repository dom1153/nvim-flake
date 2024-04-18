#!/usr/bin/env bash

P="$PWD"
LOG_FILE="${P}/build.log"
nix build ${P} 2>&1 | tee -a ${LOG_FILE}
