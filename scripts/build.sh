#!/usr/bin/env bash

P="$PWD"
LOG_FILE="${P}/build.log"
date "+[INFO] Start %Y/%m/%d %H:%M:%S ===" | tee -a ${LOG_FILE}

### nix will skip untracked files
git add .

nix build ${P} 2>&1 | tee -a ${LOG_FILE}

RESULT=${PIPESTATUS[0]}
if [[ $RESULT -eq 0 ]]; then
	echo "[SUCCESS]: after $SECONDS seconds" | tee -a ${LOG_FILE}
else
	echo "[ERROR]: after $SECONDS seconds" | tee -a ${LOG_FILE}
fi
