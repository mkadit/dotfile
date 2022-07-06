# Dotfiles

My daily work machine setup managed by [chezmoi](https://www.chezmoi.io/quick-start)

## Setup

- **Distro**       : Arch Linux
- **WM**           : [Openbox](https://github.com/danakj/openbox)
- **Status Bar**   : [tint2](https://gitlab.com/o9000/tint2)
- **Shell**        : [zsh](https://github.com/zsh-users/zsh)
- **File Manager** : [vifm](vifm,%20pcmandfm), [Thunar](https://docs.xfce.org/xfce/thunar/start)
- **Terminal**     : [st](https://github.com/mkadit/st)
- **Editor**       : [neovim (nightly)](nvim%20(nightly))

## Screenshot

![Screenshot](./assets/normal.png)
![Screenshot2](./assets/nvim_zathura.png)

## Download

1. [Install chezmoi](https://www.chezmoi.io/install/)
2. Run the following command:
- If you have the necessary key (which you probably don't) run:

```bash
chezmoi init --apply mkadit
```

- If you **don't** have the necessary key (which you probably are) run:

```bash
chezmoi init --apply --exclude=encrypted mkadit
```
Chezmoi will automatically clone the dotfile and apply them, and launch the
[install script](./local/src/scripts/install.sh) and clone
[external modules](.chezmoiexternal.toml). If you don't want to launch the
install script or external modules then add `script` to the `--exclude` flag
and separate the list of targets with commas. E.x Install the dotfile
without encryption files, scripts, or outside modules:

```bash
chezmoi init --apply --exclude=encrypted,externals,scripts mkadit
```
For more information look [here](https://www.chezmoi.io/reference/command-line-flags/common/%23-f-format-jsonyaml)
