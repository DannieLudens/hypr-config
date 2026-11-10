-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- macOS muscle memory: F3 = Mission Control, F4 = Launchpad.
-- F3 -> hyprexpo workspace overview (github.com/sandwichfarm/hyprexpo).
-- F4 -> Omarchy's apps grid, same as SUPER + ALT + SPACE.
-- If hyprexpo isn't loaded (e.g. after a Hyprland update before
-- `hyprpm update`), fall back to the apps grid instead of a Lua error.
o.bind("XF86LaunchA", "Mission Control (overview)", function()
  local ok = pcall(function() hl.plugin.hyprexpo.expo("toggle") end)
  if not ok then hl.dispatch(hl.dsp.exec_cmd("omarchy-menu toggle apps")) end
end, { locked = true })
o.bind("XF86LaunchB", "Apps menu", "omarchy-menu toggle apps", { locked = true })

-- No physical PrintScreen key on this keyboard. Omarchy's screenshot binds
-- are all on PRINT (see bindings/utilities.lua). Tried to mirror macOS's
-- Cmd+Shift+3/4/5 muscle memory, but SUPER+SHIFT+3/4/5 already moves the
-- active window to that workspace (Omarchy default) -- confirmed both fired
-- at once. Using CTRL+SHIFT+3/4/5 instead to avoid the clash.
o.bind("CTRL + SHIFT + 3", "Screenshot (full screen)", "omarchy-capture-screenshot fullscreen save")
o.bind("CTRL + SHIFT + 4", "Screenshot (select region)", "omarchy-capture-screenshot region")
o.bind("CTRL + SHIFT + 5", "Capture menu", "omarchy-menu toggle capture")

-- The other 3 default PRINT-based binds are just as unreachable, and would
-- keep showing up in SUPER+K as dead entries. Unbind them and move their
-- exact commands (from bindings/utilities.lua) to reachable keys instead.
hl.unbind("PRINT")
hl.unbind("ALT + PRINT")
hl.unbind("SUPER + PRINT")
hl.unbind("SUPER + CTRL + PRINT")

o.bind(
  "CTRL + SHIFT + 6",
  "Screenrecording",
  "omarchy-capture-screenrecording --stop-recording || omarchy-menu toggle trigger.capture.screenrecord"
)
o.bind("CTRL + SHIFT + 7", "Color picker", "pkill hyprpicker || hyprpicker -a")
o.bind("CTRL + SHIFT + 8", "Extract text (OCR) from screenshot", "omarchy-capture-text")

-- Dictation keys from before Alt + Space and Right Alt became the defaults.
-- Remove these lines to give the keys back to applications.
if o.dictation_installed and o.dictation_installed() then
  o.bind("SUPER + CTRL + X", "Toggle dictation", "omarchy-dictation toggle")
  o.bind_hold("F9", "Start dictation (push-to-talk)", "omarchy-dictation start", "Stop dictation (push-to-talk)", "omarchy-dictation stop")
end
