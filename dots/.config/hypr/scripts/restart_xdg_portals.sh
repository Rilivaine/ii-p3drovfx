#!/usr/bin/env bash

export QT_QPA_PLATFORMTHEME="${QT_QPA_PLATFORMTHEME:-kde}"
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland;xcb}"

if systemctl --user is-active plasma-xdg-desktop-portal-kde.service &>/dev/null; then
  systemctl --user import-environment QT_QPA_PLATFORMTHEME QT_QPA_PLATFORM 2>/dev/null || true
  systemctl --user restart plasma-xdg-desktop-portal-kde.service
  exit 0
fi

sleep 1

# Define all known xdg-desktop-portal backends
backends=(
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gnome
  xdg-desktop-portal-kde
  xdg-desktop-portal-lxqt
  xdg-desktop-portal-wlr
  xdg-desktop-portal
)

# Kill all backends and the main portal, ignoring errors
for backend in "${backends[@]}"; do
  killall "$backend" 2>/dev/null || true
done

sleep 1

# Set libexec directory
if [ -d /run/current-system/sw/libexec ]; then
  libDir=/run/current-system/sw/libexec
else
  libDir=/usr/lib
fi

# Start hyprland backend if it exists
if [ -x "$libDir/xdg-desktop-portal-hyprland" ]; then
  echo "Starting xdg-desktop-portal-hyprland..."
  "$libDir/xdg-desktop-portal-hyprland" &
else
  echo "xdg-desktop-portal-hyprland not found in $libDir"
fi

sleep 2

# Start main portal if it exists
if [ -x "$libDir/xdg-desktop-portal" ]; then
  echo "Starting xdg-desktop-portal..."
  "$libDir/xdg-desktop-portal" &
else
  echo "xdg-desktop-portal not found in $libDir"
fi

