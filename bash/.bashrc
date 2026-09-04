#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -p --color=auto'
alias grep='grep --color=auto'
alias vim="nvim"

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\t":menu-complete'

git_prompt() {
    local branch dirty

    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) ||
        branch=$(git rev-parse --short HEAD 2>/dev/null) ||
        return

    if ! git diff --quiet --ignore-submodules -- 2>/dev/null ||
       ! git diff --cached --quiet --ignore-submodules -- 2>/dev/null ||
       [ -n "$(git ls-files --others --exclude-standard 2>/dev/null | head -n 1)" ]; then
        dirty=1
    fi

    local gray=$'\001\e[38;2;184;192;204m\002'
    local purple=$'\001\e[38;2;180;142;173m\002'
    local red=$'\001\e[1;38;2;191;97;106m\002'
    local reset=$'\001\e[0m\002'

    if [ -n "$dirty" ]; then
        printf "${gray}git:(${purple}%s${gray}) ${red}✗${reset}" "$branch"
    else
        printf "${gray}git:(${purple}%s${gray})${reset}" "$branch"
    fi
}

PS1='\[\e[1;38;2;235;203;139m\]➤\[\e[0m\] \[\e[38;2;136;192;208m\]\w \[\e[38;2;180;142;173m\]$(b=$(git_prompt); [ -n "$b" ] && printf "%s " "$b")\[\e[38;2;236;239;244m\]❯ \[\e[0m\]'
