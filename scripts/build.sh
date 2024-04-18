#!/usr/bin/env bash

P=".."
LOG_FILE="${P}/build.log"

cd $(dirname $0)
# echo "PWD is $PWD" | tee -a ${LOG_FILE}
echo "" | tee -a ${LOG_FILE}
echo "" | tee -a ${LOG_FILE}
echo "" | tee -a ${LOG_FILE}
echo "====================================" | tee -a ${LOG_FILE}
date "+[INFO] Start %Y/%m/%d %H:%M:%S ===" | tee -a ${LOG_FILE}
echo "====================================" | tee -a ${LOG_FILE}

nix build ${P} 2>&1 | tee -a ${LOG_FILE}
### $? captures status after pipe
RESULT=${PIPESTATUS[0]}
if [[ $RESULT -eq 0 ]]; then
	echo "[SUCCESS]: after $SECONDS seconds" | tee -a ${LOG_FILE}
	mv result ..
else
	echo "[ERROR]: after $SECONDS seconds" | tee -a ${LOG_FILE}
fi
echo "====================================" | tee -a ${LOG_FILE}
