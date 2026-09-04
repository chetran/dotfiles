# dotfiles
Dotfiles for my linux setup.

`fuzzel` as the launcher
`solaar` to configure mute button to work (logitech keyboard):
- Navigate the keyboard in solaar
- In Key/Button Diversion, select *Mute Microphone* to be *Diverted*
- Press Rule Editor, and make a new *User-defined* rule.
- Right click empty -> Insert here -> Condition -> Key and type "Mute Microphone"
- Insert new rule below -> Action -> Execute and add 4 arguments for: wpctl, set-mute, @DEFAULT_AUDIO_SOURCE@, toggle

Use stow to quickly use and modify:
```bash
sudo pacman -S stow
```

Install font:
```bash
sudo pacman -S ttf-jetbrains-mono-nerd noto-fonts-cjk
```

Set wallpaper in ~/.config/backgrounds , and call it wallpaper.png or change name in hyprpaper.conf
