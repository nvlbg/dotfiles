LINUX := alacritty i3 tmux vim X zsh

install-linux: $(LINUX:%=install-%)

install-alacritty:
	mkdir -p ~/.config
	rm -rf ~/.config/alacritty
	ln -fs $(PWD)/alacritty ~/.config/alacritty

install-i3:
	mkdir -p ~/.config
	rm -rf ~/.config/i3
	rm -rf ~/.config/i3status
	ln -fs $(PWD)/i3 ~/.config/i3
	ln -fs $(PWD)/i3status ~/.config/i3status

install-tmux:
	ln -fs $(PWD)/tmux/tmux.conf ~/.tmux.conf

install-vim:
	mkdir -p ~/.config
	rm -rf ~/.config/nvim
	ln -fs $(PWD)/vim ~/.config/nvim

install-X:
	ln -fs $(PWD)/x11/Xinitrc ~/.Xinitrc
	ln -fs $(PWD)/x11/Xmodmap ~/.Xmodmap

install-zsh:
	ln -fs $(PWD)/zsh/zshrc ~/.zshrc

