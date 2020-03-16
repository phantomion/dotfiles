all: i3c nvim polyc zshrc rofic alacrittyc vifmc dunstc
	@echo "Getting all configs."

i3c:
	@echo "Getting i3 config."
	@cp ~/.config/i3/config i3/

nvim:
	@echo "Getting neovim config."
	@cp ~/.config/nvim/init.vim .

polyc:
	@echo "Getting polybar config."
	@cp ~/.config/polybar/* polybar/

zshrc:
	@echo "Getting oh.my.zsh config."
	@cp ~/.zshrc .

rofic:
	@echo "Getting rofi config."
	@cp ~/.config/rofi/config rofi/

alacrittyc:
	@echo "Getting alacritty config."
	@cp ~/.config/alacritty/alacritty.yml alacritty/

vifmc:
	@echo "Getting vifm config."
	@cp -rf ~/.config/vifm .

dunstc:
	@echo "Getting dunst config."
	@cp ~/.config/dunst/dunstrc dunst/
