#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_nmcli_channel() {
	if command_exists "nmcli"; then
		nmcli -f ACTIVE,CHAN dev wifi list | awk '$1=="yes" {print $2}'
	fi
}

main() {
        print_nmcli_channel
}
main