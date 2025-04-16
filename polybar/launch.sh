#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pidof polybar >/dev/null; do sleep 1; done

for MONITOR in $(polybar -m | awk -F: '{print $1}'); do
    if xrandr | grep "${MONITOR}" | grep primary >/dev/null; then
        # deterministically display tray on the primary display
        MONITOR=${MONITOR} MODULES_RIGHT='eth0 eth1 tray' polybar main &
    else
        MONITOR=${MONITOR} MODULES_RIGHT='eth0 eth1' polybar main &
    fi
done
