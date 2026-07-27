-- User Keybindings
-- hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"), { description = "Edit shell config" })
-- hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), { description = "Edit user keybinds" })

-- Vicinae Launcher overlay keybinding
-- hl.bind("CTRL + Space", hl.dsp.exec_cmd("~/.config/hypr/vicinae_wrapper.sh"), { description = "Vicinae Application Launcher" })

-- Close programs
-- hl.bind("ALT + F4", hl.dsp.window.close(), { description = "Close program" })

local hyprScripts = "$HOME/.config/hypr/scripts"

-- Unbinds
hl.unbind("SUPER + Tab")
hl.unbind("SUPER + A")
hl.unbind("SUPER + ALT")
hl.unbind("SUPER + B")
hl.unbind("SUPER + O")
hl.unbind("SUPER + SHIFT + ALT + mouse:273")
for i = 1, 4 do
	local arrowkey = { "Left", "Right", "Up", "Down" }
	hl.unbind("SUPER + SHIFT + " .. arrowkey[i])
end
hl.unbind("SUPER + G")
hl.unbind("SUPER + J")
hl.unbind("ALT + F4")
hl.unbind("SUPER + ALT + Space")
hl.unbind("SUPER + F")
hl.unbind("SUPER + L")
hl.unbind("SUPER + W")
hl.unbind("CTRL + ALT + T")
hl.unbind("SUPER + K")
hl.unbind("SUPER + SHIFT + L")
hl.unbind("CTRL + Space")
hl.unbind("SUPER + Space")

--##! Shell
hl.bind("SUPER + O", hl.dsp.global("quickshell:overlayToggle"), { description = "Toggle widget overlay" })
hl.bind("SUPER + ALT + W", hl.dsp.global("quickshell:barToggle"), { description = "Toggle bar" })
hl.bind("CTRL + SUPER + Escape", hl.dsp.global("quickshell:sessionToggle"), { description = "Toggle session menu"})

--##! User
hl.bind("CTRL + SUPER + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/illogical-impulse/config.json"), { description = "Edit shell config" })
hl.bind("CTRL + SUPER + ALT + Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), { description = "Edit user keybinds" })

--##! Apps
hl.bind("SUPER + D", hl.dsp.exec_cmd("vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland"), { description = "Vesktop" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { description = "Browser" })

--##! Window
hl.bind("SUPER + G", hl.dsp.group.toggle(), { description = "Toggle the window group mode" })
hl.bind("SUPER + Tab", hl.dsp.group.next(), { description = "Switch to next windows in current group" })
hl.bind("SUPER + SHIFT + Tab", hl.dsp.group.prev(), { description = "Switch to previous window in current group" })
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }), {  description = "Float/Tile" })
hl.bind("ALT + Return", hl.dsp.window.fullscreen({ action = "toggle" }), {  description = "Fullscreen" })

local workspaceKeys = {"1","2","3","4","5","6","7","8","9","0"}
--#/# bind = SUPER+SHIFT, Hash,, # Move focused window to a workspace
for i = 1, 10 do
	hl.bind("SUPER + SHIFT + "..workspaceKeys[i], hl.dsp.window.move({ workspace = i }))
end

--##! Utilities
hl.bind("ALT + Equal", hl.dsp.exec_cmd(hyprScripts.."/clipboard-typer.sh"), { description = "Run clipboard typer" })
hl.bind("Escape", hl.dsp.exec_cmd("kill \"$(cat /tmp/clipboard-typer.pid)\" 2>/dev/null"), { non_consuming = true, description = "Stop clipboard typer" })
hl.bind("SUPER + ALT + K", hl.dsp.exec_cmd(hyprScripts.."/showmethekey.sh"), { description = "Show the key" })

--##! Workspace
-- Move/Change window focus
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))

-- Move selected workspace to a relative monitor
--#/# bind = SUPER+SHIFT, H/L/K/J,, # Move selected workspace to a relative monitor
hl.bind("SUPER + SHIFT + H", hl.dsp.exec_cmd(hyprScripts.."/move_workspace_to_monitor.sh left"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd(hyprScripts.."/move_workspace_to_monitor.sh right"))
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd(hyprScripts.."/move_workspace_to_monitor.sh up"))
hl.bind("SUPER + SHIFT + J", hl.dsp.exec_cmd(hyprScripts.."/move_workspace_to_monitor.sh down"))