all:
	@echo "Getting i3 config"
	@cp -rf ~/.config/i3/config .
	@echo "Getting neovim config"
	@cp -rf ~/.config/nvim/init.vim .
	@echo "Getting polybar config"
	@cp -rf ~/.config/polybar .
	@echo "Getting oh.my.zsh config"
	@cp -rf ~/.zshrc .
