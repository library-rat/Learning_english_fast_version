#!/bin/sh
echo -ne '\033c\033]0;Learning English Fast Versions\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Learning English Final Version.x86_64" "$@"
