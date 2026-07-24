-- ######## Custom Window Rules ########

-- Vicinae (app launcher overlay)
hl.window_rule({ match = { class = "^(Vicinae)$" }, float = true })
hl.window_rule({ match = { class = "^(Vicinae)$" }, center = true })
hl.window_rule({ match = { class = "^(Vicinae)$" }, pin = true })
hl.window_rule({ match = { class = "^(Vicinae)$" }, stay_focused = true })

-- Transparency + blur for specific apps
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.85 0.8" })
hl.window_rule({ match = { class = "^(code-url-handler)$" }, opacity = "0.85 0.8" })
hl.window_rule({ match = { class = "^(code)$" }, opacity = "0.85 0.8" })
hl.window_rule({ match = { class = "^(vscodium)$" }, opacity = "0.85 0.8" })
hl.window_rule({ match = { class = "^(antigravity)$" }, opacity = "0.85 0.8" })

-- show-me-the-key
hl.window_rule({
	match = { class = "^one\\.alynx\\.showmethekey$" },
	size = { 1000, 75 },
	move = { 910, 995 },
	pin = true,
	no_initial_focus = true,
	float = true,
	rounding = 0,
	border_size = 0,
	no_focus = true,
})

hl.window_rule({
	match = { class = "^screenkey$" },
	size = { 1000, 75 },
	move = { 910, 995 },
	pin = true,
	no_initial_focus = true,
	float = true,
	rounding = 0,
	border_size = 0,
	no_focus = true,
})

-- Generate Password dialogs
hl.window_rule({
	match = { title = "^(Generate Password)(.*)$" },
	center = true,
	float = true,
})

-- Anki "Edit Current" popup
hl.window_rule({
	match = { class = "^(anki)$", title = "Edit Current" },
	float = true,
	no_screen_share = true,
})

-- hl.window_rule({
-- 	match = { float = true },
-- 	center = true,
-- })

-- hl.window_rule({ match = { title = ".*is sharing (a window|your screen).*" }, float = true })
-- hl.window_rule({ match = { title = ".*is sharing (a window|your screen).*" }, pin = true })
-- hl.window_rule({
-- 	match = { title = ".*is sharing (a window|your screen).*" },
-- 	move = { "(monitor_w*.5-window_w*.5)", "(monitor_h-window_h-12)" },
-- })