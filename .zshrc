# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
rmex(){ find $1 -type f -not -name $2 -delete; } #delete all except
fv(){fzf | xargs -r nvim ;} #search and edit
frm(){fzf | xargs /bin/rm ;} #seek and destroy
fx(){fzf | xargs -r0 setsid xdgopen; } #search and open

alias cat=ccat
alias val='v ~/.config/alacritty/alacritty.yml'
alias neofetch='neofetch | lolcat'
alias hy255='cd ~/Desktop/csd/hy255'
alias hy225='cd ~/Desktop/csd/hy225'
alias hy118='cd ~/Desktop/csd/hy118'
alias v=nvim
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias firefox='firefox &>/dev/null & disown'
alias shovelknight='sh ~/GOGGames/ShovelKnightTreasureTrove/start.sh &>/dev/null & disown'
alias vconf='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
alias soz='source ~/.zshrc'
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias transmission='transmission-gtk &>/dev/null & disown'
alias vba='visualboyadvance-m &>/dev/null & disown'
alias mgba='mgba-qt &>/dev/null & disown'
alias c='clear'
alias pm='~/pm.sh'
alias sdn='shutdown now'
alias sus='systemctl suspend'
alias hib='systemctl hibernate'
alias i3c='nvim ~/.config/i3/config'
alias polc='nvim ~/.config/polybar/config'
alias weather='curl wttr.in'
alias xm='xmodmap ~/.Xmodmap'

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

plugins=(git vi-mode autojump colored-man-pages colorize cp extract copydir zsh-syntax-highlighting)
[[ -s /home/kwstas/.autojump/etc/profile.d/autojump.sh ]] && source /home/kwstas/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u


source $ZSH/oh-my-zsh.sh
source $HOME/.profile
alias la='ls -A'
alias ls='lsd --color always --group-dirs first'
#alias ls='exa --color=always --group-directories-first'
     #cd $1;
     #exa -a --color=always;
#}
#alias cd=cdc
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
