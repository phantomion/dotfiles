all: i3 nvim poly zsh rofi alacritty vifm dunst
	@echo "Getting all configs."

i3:
	@echo "Getting i3 config."
	@cp -rf ~/.config/i3 .

nvim:
	@echo "Getting neovim config."
	@cp -rf ~/.config/nvim/init.vim .

poly:
	@echo "Getting polybar config."
	@cp -rf ~/.config/polybar .

zsh:
	@echo "Getting oh.my.zsh config."
	@cp -rf ~/.zshrc .

rofi:
	@echo "Getting rofi config."
	@cp -rf ~/.config/rofi .

alacritty:
	@echo "Getting alacritty config."
	@cp -rf ~/.config/alacritty .

vifm:
	@echo "Getting vifm config."
	@cp -rf ~/.config/vifm .

dunst:
	@echo "Getting dunst config."
	@cp -rf ~/.config/dunst .
