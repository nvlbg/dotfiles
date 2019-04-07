LINUX := alacritty direnv i3 inputrc rofi ssh tmux vim x zsh
OSX := alacritty direnv inputrc karabiner ssh tmux vim zsh
SUDO := cron-linux udevmon

default:
	$(error Use `make linux` or `make osx` or `make sudo`)

linux: $(LINUX:%=install-%)
osx: $(OSX:%=install-%)
sudo: $(SUDO:%=install-%)

install-alacritty:
	mkdir -p ~/.config
	rm -rf ~/.config/alacritty
	ln -fs $(PWD)/alacritty ~/.config/alacritty

install-cron-linux:
	ln -fs $(shell pwd)/vim/vimwiki-sync.sh /etc/local.d/vimwiki-sync.start || true
	ln -fs $(shell pwd)/vim/vimwiki-sync.sh /etc/local.d/vimwiki-sync.stop || true
	crontab $(shell pwd)/vim/vimwiki-sync.cron || true

install-direnv:
	ln -fs $(PWD)/direnv/direnvrc ~/.direnvrc

install-i3:
	mkdir -p ~/.config
	rm -rf ~/.config/i3
	rm -rf ~/.config/i3status
	ln -fs $(PWD)/i3 ~/.config/i3
	ln -fs $(PWD)/i3status ~/.config/i3status

install-inputrc:
	ln -fs $(PWD)/inputrc/inputrc ~/.inputrc

install-karabiner:
	mkdir -p ~/.config
	rm -rf ~/.config/karabiner
	ln -fs $(PWD)/karabiner ~/.config/karabiner

install-rofi:
	mkdir -p ~/.config
	rm -rf ~/.config/rofi
	ln -fs $(PWD)/rofi ~/.config/rofi

install-ssh:
	ln -fs $(PWD)/ssh/config ~/.ssh/config

install-tmux:
	ln -fs $(PWD)/tmux/tmux.conf ~/.tmux.conf

# do not forget to start system.d service as well
install-udevmon:
	ln -fs $(PWD)/udevmon/udevmon.yaml /etc/udevmon.yaml

install-vim:
	mkdir -p ~/.config
	rm -rf ~/.config/nvim
	ln -fs $(PWD)/vim ~/.config/nvim

install-x:
	ln -fs $(PWD)/x11/Xinitrc ~/.xinitrc
	ln -fs $(PWD)/x11/Xmodmap ~/.Xmodmap

install-zsh:
	ln -fs $(PWD)/zsh/zshrc ~/.zshrc
	ln -fs $(PWD)/zsh/zpreztorc ~/.zpreztorc
