#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_nmcli_security() {
	if command_exists "nmcli"; then
		nmcli -f ACTIVE,SECURITY dev wifi list | awk '$1=="yes" {print $2}'
	fi
}

main() {
        print_nmcli_security
}
main
