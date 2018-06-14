# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Variables                           #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
DIR=$(readlink -e ~/.dotfiles/zsh)      # Resolved path

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Environment variables               #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

export VISUAL=nano
export EDITOR=$VISUAL
export PAGER='less'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Completions                         #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Loads & inits
autoload -Uz compinit                   # Completion system
compinit -d "$DIR/caches/.zcompdump"

# Parameters
SPROMPT='%R->%r? [nyae]'                # Command correction prompt

# Options
setopt   CORRECT                        # Tries to correct misspelled commands (no,yes,abort,edit)
unsetopt AUTO_REMOVE_SLASH              # Remove slashes at end of completions
setopt   EXTENDED_GLOB                  # ‘#’, ‘~’ and ‘^’ treated as pattern part for file extension
setopt   GLOB_DOTS                      # Matches dotfiles

# @see https://github.com/mattjj/my-oh-my-zsh/blob/master/completion.zsh
# Highlight current completion
zstyle ':completion:*' menu select

# Approximate completions
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Group matches and describe
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Command not found
if [[ -s '/etc/zsh_command_not_found' ]] # Debian-based
then
    source '/etc/zsh_command_not_found'
fi

# NPM completions caching
# (@see https://github.com/sorin-ionescu/prezto/blob/master/modules/node/init.zsh#L31)
cache_file="$DIR/caches/.node-cache.zsh"
if [[ "$commands[npm]" -nt "$cache_file" || ! -s "$cache_file" ]]
then
  npm completion >! "$cache_file" 2> /dev/null
fi
source "$cache_file"
unset cache_file

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Prompts                             #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Loads & inits
autoload -Uz promptinit                 # Prompt module
promptinit

# Prompt
prompt adam2

# Options
setopt   INTERACTIVE_COMMENTS           # Allows comments in interactive shells

# Syntax highlight, @see below

# Shut up!
unsetopt BEEP                           # Beeps on ZLE errors
unsetopt HIST_BEEP                      # Beeps on history errors
unsetopt LIST_BEEP                      # Beeps on completions errors

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Keybindings                         #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Parameters
KEYTIMEOUT=40                           # Multi char sequence timeout (ms)

# Keymap
bindkey -e                              # Emacs keymap

# Bindings
#   `read` or `showkey -a` to discover key sequences
#   `bindkey` to list bindings for current map
#   `zle -al` to list all zle widgets
# Accept
bindkey "^[^M"      accept-and-hold                         # (M-RET    ) Runs command and prints it back in
# Move
bindkey "^[[1;2C"   end-of-line                             # (S-RIGHT  ) End of line
bindkey "^[[1;5C"   forward-word                            # (C-RIGHT  ) Beginning of next word
bindkey "^[[1;6C"   vi-forward-blank-word-end               # (C-S-RIGHT) End of word
bindkey "^[[1;3C"   vi-forward-word                         # (M-RIGHT  ) Beginning of next sub-word
bindkey "^[[1;4C"   vi-forward-word-end                     # (M-S-RIGHT) End of sub-word
bindkey "^[[1;2D"   beginning-of-line                       # (S-LEFT   ) Beginning of line
bindkey "^[[1;5D"   backward-word                           # (C-LEFT   ) Beginning of word
bindkey "^[[1;6D"   vi-backward-blank-word-end              # (C-S-LEFT ) End of previous word
bindkey "^[[1;3D"   vi-backward-word                        # (M-LEFT   ) Beginning of sub-word
bindkey "^[[1;4D"   vi-backward-word-end                    # (M-S-LEFT ) End of prev sub-word
# Kill & yank
bindkey "^V"        yank                                    # (C-V      ) Yank
bindkey "^[^H"      kill-buffer                             # (C-M-DEL  ) Kills whole buffer
bindkey "^[[3;5~"   kill-word                               # (C-DEL    ) Kills to end of word
bindkey "^[[3;3~"   kill-line                               # (M-DEL    ) Kills to end of buffer
bindkey "^H"        backward-kill-word                      # (C-BCK    ) Kills to beginning of word
bindkey "^[^?"      backward-kill-line                      # (M-BCK    ) Kills to beginning of buffer
# Undo & redo
bindkey "^Z"        undo                                    # (C-z      ) Undo
bindkey "^[z"       redo                                    # (M-z      ) Redo
# Good to know, also in emacs keymap:
# (C-l) clear-screen
# (M-u) up-case-word
# (M-l) down-case-word
# (M-c) capitalize-word
# (C-w) backward-kill-word
# (M-s) spell-word
# (M-h) run-help
# NOTE
# beginning/end-of-line should have be C-M-LEFT/RIGHT but Ubuntu ...

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Navigation                          #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Parameters
DIRSTACKSIZE=1000                       # Max size of directory stack

# Options
setopt   CHASE_LINKS                    # `cd` resovles symbolic links
setopt   AUTO_CD                        # Changes directory if command is not a command
setopt   AUTO_PUSHD                     # `cd` pushes to directory stack
setopt   PUSHD_IGNORE_DUPS              # Dedups directory stack
setopt   PUSHD_SILENT                   # Silences `pushd`
setopt   PUSHD_MINUS                    # `cd -` from most recent, `cd +n` from oldest
setopt   PUSHD_TO_HOME                  # `pushd` without args goes to $HOME

# fasd (https://github.com/clvv/fasd)
# Init (with cache)
cache_file="$DIR/caches/.fasd-cache.zsh"
if [[ "${commands[fasd]}" -nt "$cache_file" || ! -s "$cache_file"  ]]
then
    fasd --init auto >! "$cache_file" 2> /dev/null
fi
source "$cache_file"
unset cache_file

# Suggestions from man page
compdef _gnu_generic fasd

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > History                             #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Parameters
HISTFILE="$DIR/caches/.zhistory"        # History file location
HISTSIZE=1024                           # Max number of events stored in internal history list
SAVEHIST=$HISTSIZE                      # Max number of events stored in history file

# Options
setopt   SHARE_HISTORY                  # Shares history among sessions
setopt   EXTENDED_HISTORY               # Saves events with time and duration
setopt   HIST_IGNORE_DUPS               # Ignores successive dups
setopt   HIST_IGNORE_ALL_DUPS           # Removes older dups in history
setopt   HIST_SAVE_NO_DUPS              # Doesn't write dups
setopt   HIST_FIND_NO_DUPS              # Doesn't display dups when searching through history
setopt   HIST_REDUCE_BLANKS             # Removes superfluous blanks
setopt   HIST_IGNORE_SPACE              # Forgets commands with leading space (after next command)
setopt   HIST_NO_FUNCTIONS              # Forgets function definitions (after next command)
setopt   HIST_FCNTL_LOCK                # Locks with OS locking system

# Aliases
alias h='history'

# Respect order (best at end of file): zsh-autosuggestions, zsh-syntax-highlighting, zsh-history-substring-search
# Auto suggestions plugin (https://github.com/zsh-users/zsh-autosuggestions)
source "$DIR/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlight plugin (https://github.com/zsh-users/zsh-syntax-highlighting)
source "$DIR/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# History substring search plugin (https://github.com/zsh-users/zsh-history-substring-search)
source "$DIR/modules/zsh-history-substring-search/zsh-history-substring-search.zsh"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ##################################### #
# > Aliases / Functions                 #
# ##################################### #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Colorized, paged cat
dog() {
    highlight -l --force -O ansi $1 | $PAGER -R
}

