#!/bin/bash

# blue light filter
redshift-gtk >/tmp/redshift.log 2>&1 &
until xwininfo -tree -root | grep redshift-gtk; do sleep 1; done

# solaar is a utility for configuring logitech devices, such as my MX Master 3S
solaar -w hide > /tmp/solaar.log 2>&1 &
until xwininfo -tree -root | grep solaar; do sleep 1; done

# bluetooth control
blueman-applet > /tmp/blueman-applet.log 2>&1 &
until xwininfo -tree -root | grep blueman-applet; do sleep 1; done

# wireguard control
wireguird > /tmp/wireguird.log 2>&1 &
until xwininfo -tree -root | grep wireguird; do sleep 1; done

# wi-fi indicator icon (iwd)
# iwgtk -i > /tmp/iwgtk.log 2>&1 &
# until xwininfo -tree -root | grep iwgtk; do sleep 1; done

# wi-fi indicator icon (network manager)
nm-applet > /tmp/nm-applet.log 2>&1 &
until xwininfo -tree -root | grep nm-applet; do sleep 1; done

# volume control
# pasystray > /tmp/pasystray-logs.out & # other volume indicator
volumeicon > /tmp/volumeicon.log 2>&1 &
until xwininfo -tree -root | grep volumeicon; do sleep 1; done

# battery indicator
cbatticon > /tmp/cbatticon.log 2>&1 &
