# Arch Linux

This contains some personal notes and programs that I use on my arch install. It's mainly for future use.

- [<- back](../README.md)

- [Minimal Files](#minimal-files)

## Minimal Files

Install these programs when freshly installing arch.

- base
- linux
- linux-firmware
- git
- clang
- rust
- make
- vi
- vim
- nvim
- tmux
- man-db
- networkmanager
- openssh
- stow
- sudo

```bash
pacstrap -K /mnt base linux linux-firmware git clang rust make vi vim nvim tmux man-db networkmanager openssh stow sudo
```

### Optional

#### utils
- ripgrep (for faster grep)
- zoxide (for better cd'ing)
- lazygit

```bash
pacstrap -K /mnt ripgrep zoxide lazygit
```

#### languages

- golang
- java
- luarocks

(zephyr RTOS)

```bash
pacstrap -K /mnt go jdk-openjdk luarocks
```

#### embeded dev

- minicom
- gdb
- OpenOCD (for on chip debugging)

```bash
pacstrap -K /mnt gdb minicom
```

```bash
sudo pacman -S minicom gdb OpenOCD
```

#### Display manager

- sway
- kitty
- firefox
