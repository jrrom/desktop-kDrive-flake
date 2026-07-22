#!/usr/bin/env bash

version=$(
	curl -fsSLI "https://github.com/jrrom/desktop-kDrive-flake/releases/latest/" |
		grep -oP "tag/([0-9]\.)+[0-9]" |
		sed "s/tag\///"
)

url="https://github.com/jrrom/desktop-kDrive-flake/releases/download/${version}/kDrive-${version}-amd64.AppImage";

hash=$(nix-prefetch-url "$url")
hash=$(nix hash convert --hash-algo sha256 --to sri "$hash")

sed -Ei "s|[0-9](\.[0-9])+|${version}|" default.nix
sed -Ei "s|url = \".*\"|url = \"${url}\"|" default.nix
sed -Ei "s|hash = \".*\"|hash = \"${hash}\"|" default.nix

echo "Complete"
