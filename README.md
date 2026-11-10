# Hyprland config (Omarchy)

Personal overrides on top of Omarchy's defaults, tuned for a MacBook Air 2017.

- `input.lua`: `latam-mac` layout (`xkb/symbols/latam-mac`, symlinked from
  `~/.config/xkb/symbols/latam-mac`), Mac-style
  trackpad (natural scroll, two-finger right click), 3-finger workspace swipe.
- `bindings.lua`: F3 = Mission Control (hyprexpo), F4 = apps menu,
  CTRL+SHIFT+3..8 = screenshots / recording / color picker / OCR.
- `scripts/hypr-config-check.hook`: Omarchy post-update hook (symlinked in
  `~/.config/omarchy/hooks/post-update.d/`); notifies if an update changed
  anything here.
- `autostart.lua` + `scripts/hyprexpo-ensure`: loads hyprexpo at login; if it
  fails (Hyprland updated), shows a notification to rebuild it with
  `hyprpm update -f && hyprpm reload`. `~/.local/bin/hyprexpo-ensure` is a
  symlink to the script here.

## After an Omarchy update

    cd ~/.config/hypr
    git status        # new *.bak.* files or modified files = Omarchy touched something
    git diff          # see exactly what changed
    git checkout -- <file>   # restore your version of a file
    git push                 # after committing, back it up to GitHub

## Restore on a fresh install

    git clone https://github.com/DannieLudens/hypr-config ~/.config/hypr
    ln -s ~/.config/hypr/scripts/hyprexpo-ensure ~/.local/bin/hyprexpo-ensure
    ln -s ~/.config/hypr/scripts/hypr-config-check.hook ~/.config/omarchy/hooks/post-update.d/
    mkdir -p ~/.config/xkb/symbols && ln -s ~/.config/hypr/xkb/symbols/latam-mac ~/.config/xkb/symbols/
    # then install hyprexpo:
    # sudo pacman -S hyprpm && hyprpm add https://github.com/sandwichfarm/hyprexpo && hyprpm enable hyprexpo
