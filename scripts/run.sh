#!/usr/bin/env bash

if [[ -d result ]]; then
	exe=${PWD}/result/bin/nvim
	# cd ~/tmp
	$exe
fi
