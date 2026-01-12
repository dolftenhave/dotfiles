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

```bash
pacstrap -K /mnt base linux linux-firmware git clang rust make vi vim nvim tmux man-db networkmanager openssh stow
```

### Optional

- ripgrep (for faster grep)
- zoxide (for better cd'ing)
- lazygit

```bash
bacstrap -K /mnt ripgrep zoxide lazygit
```
