rmex(){ find $1 -type f -not -name $2 -delete; } #delete all except
iv() {
    vimiv $1 &>/dev/null & disown
}

alias j=z
alias neofetchl='neofetch | lolcat'
alias v=nvim
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias vconf='nvim ~/.config/nvim/init.lua'
alias zshrc='nvim ~/.zshrc'
alias soz='source ~/.zshrc'
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias transmission='transmission-gtk &>/dev/null & disown'
alias mgba='mgba-qt &>/dev/null & disown'
alias c='clear'
alias pm='~/Documents/dotfiles/pm.sh'
alias i3c='nvim ~/.config/i3/config'
alias polc='nvim ~/.config/polybar/config'
alias weather='curl wttr.in'
alias xm="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
alias langs="setxkbmap -model pc105 -layout us,gr -option grp:lalt_lshift_toggle"
alias alc='nvim ~/.config/alacritty/alacritty.yml'
alias rofic='nvim ~/.config/rofi/config'
alias stars='nvim ~/.config/starship.toml'
alias muttc='nvim ~/.config/neomutt/neomuttrc'
alias vifm='sh ~/.config/vifm/scripts/vifmrun'
alias nem='neomutt'
alias ytmp3='youtube-dl -x --audio-format mp3'
alias gimme_mirrors='sudo pacman-mirrors --fasttrack 20'

csd3972() {
    ssh csd3972@$1.csd.uoc.gr
}

csdscp() {
    scp -r $2 csd3972@$1.csd.uoc.gr:$3
}

pgsql_start() {
    sudo mkdir /run/postgresql
    sudo chown postgres /run/postgresql
    sudo su postgres -c 'pg_ctl start -D /usr/local/pgsql/data -l /var/lib/postgres/serverlog'
}

xdgopen() {
    xdg-open $* &>/dev/null & disown
}
alias open=xdgopen

startAndDisown() {
    $1 &>/dev/null & disown
}
alias s=startAndDisown

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"
plugins=(vi-mode cp extract zsh-syntax-highlighting)
autoload -U compinit && compinit -u

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
alias gst='git status'
alias ga='git add'
alias gaa='git add -A'
alias glg='git log --stat'
alias gcmsg='git commit -m'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
alias gcm='git checkout master'
alias gch='git checkout'
alias gcb='git checkout -b'
alias ls='exa --color=always --group-directories-first --icons'
alias la='ls -a'
function list_all() {
    emulate -L zsh
    ls -a
}
chpwd_functions=(${chpwd_functions[@]} "list_all")
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
[ -f "/home/kwstas/.ghcup/env" ] && source "/home/kwstas/.ghcup/env" # ghcup-env

export PNPM_HOME="/home/kwstas/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
