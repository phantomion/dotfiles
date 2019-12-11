all: i3 nvim poly zsh rofi alacritty vifm dunst
	@echo "Getting all configs."

i3:
	@echo "Getting i3 config."
	@cp ~/.config/i3/config i3/

nvim:
	@echo "Getting neovim config."
	@cp ~/.config/nvim/init.vim .

poly:
	@echo "Getting polybar config."
	@cp ~/.config/polybar/* polybar/

zsh:
	@echo "Getting oh.my.zsh config."
	@cp ~/.zshrc .

rofi:
	@echo "Getting rofi config."
	@cp ~/.config/rofi/config rofi/

alacritty:
	@echo "Getting alacritty config."
	@cp ~/.config/alacritty/alacritty.yml alacritty/

vifm:
	@echo "Getting vifm config."
	@cp -rf ~/.config/vifm .

dunst:
	@echo "Getting dunst config."
	@cp ~/.config/dunst/dunstrc dunst/
