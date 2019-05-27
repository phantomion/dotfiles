all: i3 nvim poly zsh

i3:
	@echo "Getting i3 config"
	@cp -rf ~/.config/i3/config .

nvim:
	@echo "Getting neovim config"
	@cp -rf ~/.config/nvim/init.vim .

poly:
	@echo "Getting polybar config"
	@cp -rf ~/.config/polybar .

zsh:
	@echo "Getting oh.my.zsh config"
	@cp -rf ~/.zshrc .
