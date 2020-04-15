all: i3c nvimc polyc zshrc rofic alacrittyc vifmc dunstc starshipc profilec
	@echo "Getting all configs."

i3c:
	@echo "Getting i3 config."
	@cp ~/.config/i3/config i3/

nvimc:
	@echo "Getting neovim config."
	@cp ~/.config/nvim/init.vim nvim/
	@cp ~/.config/nvim/coc-settings.json nvim/

polyc:
	@echo "Getting polybar config."
	@cp ~/.config/polybar/* polybar/

zshrc:
	@echo "Getting oh.my.zsh config."
	@cp ~/.zshrc .

profilec:
	@echo "Getting profile config."
	@cp ~/.profile .

rofic:
	@echo "Getting rofi config."
	@cp ~/.config/rofi/config rofi/

alacrittyc:
	@echo "Getting alacritty config."
	@cp ~/.config/alacritty/alacritty.yml alacritty/

vifmc:
	@echo "Getting vifm config."
	@cp ~/.config/vifm/vifmrc vifm/
	@cp ~/.config/vifm/scripts/* vifm/scripts

dunstc:
	@echo "Getting dunst config."
	@cp ~/.config/dunst/dunstrc dunst/

starshipc:
	@echo "Getting starship prompt"
	@cp ~/.config/starship.toml .

put: i3p nvimp polyp zshp rofip alacrittyp vifmp dunstp starshipp profilep
	@echo"Put everything in place."

i3p:
	@echo "Putting i3 config ${HOME}/.config/i3."
	@cp -r i3/ ${HOME}/.config/

nvimp:
	@echo "Putting nvim config ${HOME}/.config/nvim."
	@cp -r nvim/ ${HOME}/.config/

polyp:
	@echo "Putting polybar config ${HOME}/.config/polybar."
	@cp -r polybar/ ${HOME}/.config/

zshp:
	@echo "Putting zsh config ${HOME}."
	@cp .zshrc ${HOME}/

profilep:
	@echo "Putting profile config ${HOME}."
	@cp .profile ${HOME}/

rofip:
	@echo "Putting rofi config ${HOME}/.config/rofi."
	@cp -r rofi/ ${HOME}/.config/

alacrittyp:
	@echo "Putting alacritty config ${HOME}/.config/alacritty."
	@cp -r alacritty/ ${HOME}/.config/

vifmp:
	@echo "Putting vifm config ${HOME}/.config/vifm."
	@cp -r vifm/ ${HOME}/.config/

dunstp:
	@echo "Putting dunst config ${HOME}/.config/dunst."
	@cp -r dunst/ ${HOME}/.config/

starshipp:
	@echo "Putting starship config ${HOME}/.config"
	@cp starship.toml ${HOME}/.config/
