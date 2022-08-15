# my dotfiles

## Prerequisites

Ensure the following are already installed on your system:

- [Homebrew](https://brew.sh/)/[Linuxbrew](https://docs.brew.sh/Homebrew-on-Linux)
  - [GNU Make](https://formulae.brew.sh/formula/make#default)
  - [Starship](https://formulae.brew.sh/formula/starship#default)
  - [GNU Stow](https://formulae.brew.sh/formula/stow#default)
  - [Git](https://formulae.brew.sh/formula/git#default)
  - [GitHUb CLI](https://formulae.brew.sh/formula/gh#default)
  - [ZSH](https://formulae.brew.sh/formula/zsh#default)
  - [Neovim](https://formulae.brew.sh/formula/neovim)
  - `brew install make starship stow git gh zsh neovim`
- [ZSH Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) (optional)

## Installation

Clone the repo to a desired directory (will be linked to the home directory later)

```bash
git clone https://github.com/RATIU5/dotfiles.git
```
then run

```bash
make
```

### WSL2

- Move `alacritty/.config/alacritty/alacritty.yml` to `C:/Users/username/alacritty.yml`
  - Adjust alacritty settings according to preferences
  
## Uninatall

Run the following colland to uninstall

```bash
make delete
```
