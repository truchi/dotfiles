# ZSH

Set as default shell:
```
chsh -s $(which zsh) # Then log out and back in
```

Refresh:
```
exec zsh
```

## Plugins

- [Auto suggestions plugin](https://github.com/zsh-users/zsh-autosuggestions)
- [Syntax highlight plugin](https://github.com/zsh-users/zsh-syntax-highlighting)
- [History substring search plugin](https://github.com/zsh-users/zsh-history-substring-search)

## Tools (to install)

- [fasd](https://github.com/clvv/fasd)
- [highlight](https://linux.die.net/man/1/highlight)
- [thefuck](https://github.com/nvbn/thefuck)
- [NerdFonts](https://github.com/ryanoasis/nerd-fonts) (FiraMono, already in /fonts)
- [colorls](https://github.com/athityakumar/colorls)

## Features

### Completion

- Command correction (system & fuck)
- Install suggestions
- Command completions caching
- Autosuggestions

### Prompts

- Syntax highlight
- Allows comments
- No beeps

### History

- Shared, time & duration
- No dups nor blanks
- Ignores (after next command) commands with leading blank
- Ignores (after next command) function definitions
- Substring search

### Keybindings

- Emacs keymap
- Custom bindings

### Navigation & List

- Symlink resolution
- Auto cd/pushd
- fasd
- Auto ls & git status
- colorls (ls, on accept empty line)

### Aliases / Functions

- dog: colored, paged, cat

### Misc

- Colored man pages

## Docs & Resources

- (Website)[http://zsh.sourceforge.net/Doc/Release/zsh_toc.html]
- (ZSH reference card)[http://www.bash2zsh.com/zsh_refcard/refcard.pdf]
- (Awesome ZSH)[https://github.com/unixorn/awesome-zsh-plugins]
