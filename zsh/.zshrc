# interactive shells only
[[ -o interactive ]] || return

# aliases
alias ls='ls -p --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

AUTOSUGGESTIONS="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
SYNTAX_HIGHLIGHTING="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ -r "$AUTOSUGGESTIONS" ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4C566A'
    source "$AUTOSUGGESTIONS"
fi

# git information
git_prompt() {
    local branch dirty

    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) ||
        branch=$(git rev-parse --short HEAD 2>/dev/null) ||
        return

    if ! git diff --quiet --ignore-submodules -- 2>/dev/null ||
       ! git diff --cached --quiet --ignore-submodules -- 2>/dev/null ||
       [[ -n "$(git ls-files --others --exclude-standard 2>/dev/null | head -n 1)" ]]; then
        dirty=1
    fi

    local gray='%F{#B8C0CC}'
    local purple='%F{#B48EAD}'
    local red='%B%F{#BF616A}'
    local reset='%f%b'

    if [[ -n "$dirty" ]]; then
        print -n "${gray}git:(${purple}${branch}${gray}) ${red}✗${reset}"
    else
        print -n "${gray}git:(${purple}${branch}${gray})${reset}"
    fi
}

# prompt
setopt PROMPT_SUBST
PROMPT='%B%F{#EBCB8B}➤%f%b %F{#88C0D0}%~%f $(git_prompt) %F{#ECEFF4}❯%f '

# highlighting
[[ -r "$SYNTAX_HIGHLIGHTING" ]] && source "$SYNTAX_HIGHLIGHTING"
