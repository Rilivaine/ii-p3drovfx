# personal scripts (~/.dotscripts from dots/.config/scripts)
[[ -d "$HOME/.dotscripts" && ":$PATH:" != *":$HOME/.dotscripts:"* ]] && export PATH="$HOME/.dotscripts:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

