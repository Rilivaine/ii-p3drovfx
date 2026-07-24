hl.on("hyprland.start", function ()
    -- Icon and Cursor styling
    -- hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme Deepin2022")
    hl.exec_cmd("hyprctl setcursor BreezeX-Light 28")
    -- hl.exec_cmd("kwriteconfig6 --file kdeglobals --group Icons --key Theme Deepin2022")
    
    -- Vicinae application launcher daemon
    -- hl.exec_cmd("bash -c 'sleep 5 && env QT_QPA_PLATFORM=xcb /home/pedro/AppImages/vicinae.appimage server --replace > /tmp/vicinae.log 2>&1'")
    
    -- KDE Connect integration
    -- hl.exec_cmd("/usr/libexec/kdeconnectd")
    -- hl.exec_cmd("kdeconnect-indicator")


	hl.exec_cmd("vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --start-minimized")
	hl.exec_cmd("keepassxc")
	hl.exec_cmd("hyprland-per-window-layout")
end)


hl.on("hyprland.start", function ()
end)