-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- hyprpm plugins (hyprexpo, used by F3 / Mission Control) are loaded live
-- when installed via `hyprpm enable`, but that load does not persist across
-- Hyprland restarts -- without this, F3 hits a nil `hl.plugin.hyprexpo` and
-- throws a Lua error until `hyprpm reload` is run manually. The script
-- also shows a notification to rebuild the plugin if it does not load.
o.exec_on_start(os.getenv("HOME") .. "/.local/bin/hyprexpo-ensure")
