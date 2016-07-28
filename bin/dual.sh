#!/bin/sh
MIRROR="mirror"
DUAL="dual"
ORIGIN="origin"

#xrandr -s 0

if [ $# -eq 0 ] || [ "$ORIGIN" = $1 ]; then
    echo "$ORIGIN"
    xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --off --output VIRTUAL1 --off --output DP1 --off --output VGA1 --off
elif [ "$MIRROR" = $1 ]; then
    echo "$MIRROR"
    xrandr --output LVDS1 --mode 1366x768 --rotate normal --output VGA1 --mode 1024x768 --rotate normal --left-of LVDS1 --same-as LVDS1
elif [ "$DUAL" = $1 ]; then
    echo "$DUAL"
    xrandr --output LVDS1 --primary --mode 1366x768 --rotate normal --output VGA1 --mode 1024x768 --rotate normal --left-of LVDS1
else
	echo "Choose one option"
	echo ""
	echo "[mirror] - mirror your monitor"
	echo "[dual] - have two monitors with different things =D"
	echo "[origin] - just one monitor"
fi

nitrogen --restore