#!/usr/bin/env bash

releases=$(
	curl -fsSLI "https://github.com/jrrom/desktop-kDrive-flake/releases/latest/" |
		grep -oP "tag/([0-9]\.)+[0-9]" |
		sed "s/tag\///"
)

echo $releases;
