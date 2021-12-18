# DStarLinkToAPRSStatus
## Prerequisites
inotify-tools

For APRS-IS : socat

For AX25 only : ax25-tools ax-25-app

To run as a Systemd service : tmux

## Install
sudo make install
Once installed, edit config file /usr/local/etc/dstarlinktoaprsstatus.conf and run `sudo service dstarlinktoaprsstatus start` to start 
