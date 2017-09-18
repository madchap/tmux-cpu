#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

nmcli_interpolation=(
	"\#{nmcli_signal}"
	"\#{nmcli_ssid}"
	"\#{nmcli_bars}"
	"\#{nmcli_rate}"
	"\#{nmcli_security}"
	"\#{nmcli_channel}"
)
nmcli_commands=(
	"#($CURRENT_DIR/scripts/nmcli_signal.sh)"
	"#($CURRENT_DIR/scripts/nmcli_ssid.sh)"
	"#($CURRENT_DIR/scripts/nmcli_bars.sh)"
	"#($CURRENT_DIR/scripts/nmcli_rate.sh)"
	"#($CURRENT_DIR/scripts/nmcli_security.sh)"
	"#($CURRENT_DIR/scripts/nmcli_channel.sh)"
)

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#nmcli_commands[@]}; i++)); do
		all_interpolated=${all_interpolated/${nmcli_interpolation[$i]}/${nmcli_commands[$i]}}
	done
	echo "$all_interpolated"
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
