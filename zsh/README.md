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

## Tools

- [fasd](https://github.com/clvv/fasd)

## Features

### Completion

- Command correction
- Install suggestions
- Command completions caching

### Prompts

- Syntax highlight
- Allows comments
- No beeps

### Keybindings

- Emacs keymap
- Custom bindings

### Navigation

- Symlink resolution
- Auto cd/pushd
- fasd

### History

- Shared, time & duration
- No dups nor blanks
- Ignores (after next command) commands with leading blank
- Ignores (after next command) function definitions
- Autosuggests
- Substring search

## Docs & Resources

- (Website)[http://zsh.sourceforge.net/Doc/Release/zsh_toc.html]
- (ZSH reference card)[http://www.bash2zsh.com/zsh_refcard/refcard.pdf]
