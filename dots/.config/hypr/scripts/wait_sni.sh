#!/usr/bin/env bash
# Wait for StatusNotifierWatcher (system tray) then exec the given command.
until busctl --user status org.kde.StatusNotifierWatcher >/dev/null 2>&1; do
	sleep 0.2
done
exec "$@"
