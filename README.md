# Tmux nmcli (NetworkManager) wifi status

Enables displaying network wifi connection and status icon in Tmux status-right.

(Currently not thoroughly tested, except on my laptop, your mileage may vary)

## Requirements

You must be running NetworkManager for your Linux distribution, and it must be handling your network connections.

## Installation
### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'madchap/tmux-nmcli'

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/madchap/tmux-nmcli.git ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/nmcli.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

If format strings are added to `status-right`, they should now be visible.

## Usage

Add `#{nmcli_ssid}`, `#{nmcli_bars}` `#{nmcli_rate}`, `#{nmcli_security}`, `#{nmcli_signal}` and/or `#{nmcli_channel}` format strings to existing `status-right` tmux option.

Example:

    # in .tmux.conf
    set -g status-right 'Connected to #{nmcli_ssid} #{nmcli_bars} | %a %h-%d %H:%M '


## Examples
Overall nmcli wifi output:<br/>
![nmcli_output](/screenshots/overall_nmcli_output.png)

My meaningful usage:<br/>
![my_tmux_nmcli_output](/screenshots/minimal_tmux_example.png)

Including all possible attributes:<br/>
![all_attributes_output](/screenshots/maximal_tmux_example.png)

## (Ephemeral) Maintainer

 - [Fred Blaise](https://github.com/madchap)

### License

[MIT](LICENSE.md)
