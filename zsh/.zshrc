autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export EDITOR=nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/home/fly/.local/bin"
eval "$(zoxide init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config '/mnt/c/Users/FLY/AppData/Local/Programs/oh-my-posh/themes/montys.omp.json')"
neofetch
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias spicetify='/mnt/c/Users/FLY/AppData/Local/spicetify/spicetify.exe'
alias la='ls -a'
alias g='git'
alias gst='git status'
alias gcm='git commit'


#yazi cd
function yz() {
    local tmpfile="/tmp/yazi-cwd"
    yazi --cwd-file="$tmpfile" "$@"
    if [[ -f "$tmpfile" ]]; then
        cd "$(cat "$tmpfile")"
        rm "$tmpfile"
    fi
}

#ascii 
aic() {
  if [[ "$@" == *"-nc"* ]]; then
    ascii-image-converter ${(s: :)${@/-nc/}}
  else
    ascii-image-converter --color "$@"
  fi
}


