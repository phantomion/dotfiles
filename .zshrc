# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
rmex(){ find $1 -type f -not -name $2 -delete; } #delete all except
fv(){fzf | xargs -r nvim ;} #search and edit
frm(){fzf | xargs /bin/rm ;} #seek and destroy
fx(){fzf | xargs -r0 setsid xdgopen; } #search and open
iv() {
    vimiv $1 &>/dev/null & disown
}

alias cat=ccat
alias xampp='sudo /opt/lampp/manager-linux-x64.run'
alias neofetch='neofetch | lolcat'
alias v=nvim
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias shovelknight='sh ~/GOGGames/ShovelKnightTreasureTrove/start.sh &>/dev/null & disown'
alias vconf='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias soz='source ~/.zshrc'
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias transmission='transmission-gtk &>/dev/null & disown'
alias mgba='mgba-qt &>/dev/null & disown'
alias c='clear'
alias pm='~/pm.sh'
alias i3c='nvim ~/.config/i3/config'
alias polc='nvim ~/.config/polybar/config'
alias weather='curl wttr.in'
alias xm='xmodmap ~/.Xmodmap'
alias csd3972='ssh csd3972@haroupi.csd.uoc.gr'
alias alc='nvim ~/.config/alacritty/alacritty.yml'
alias rofic='nvim ~/.config/rofi/config'
alias stars='nvim ~/.config/starship.toml'

xdgopen() {
    xdg-open $* &>/dev/null & disown
}
alias open=xdgopen

startAndDisown() {
    $1 &>/dev/null & disown
}
alias s=startAndDisown

# Path to your oh-my-zsh installation.
export ZSH="/home/kwstas/.oh-my-zsh"

ZSH_THEME="nebirhos"

plugins=(vi-mode autojump colored-man-pages colorize cp extract zsh-syntax-highlighting)
[[ -s /home/kwstas/.autojump/etc/profile.d/autojump.sh ]] && source /home/kwstas/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
#[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
alias gst='git status'
alias gaa='git add -A'
alias glg='git log --stat'
alias gcmsg='git commit -m'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
alias gcm='git checkout master'
alias gch='git checkout'
alias gcb='git checkout -b'
alias ls='exa --color=always --group-directories-first'
alias la='ls -a'
#alias ls='lsd --color always --group-dirs first'
cdls() {
    cd $1;
    ls -a;
}
alias cd=cdls
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(starship init zsh)"
