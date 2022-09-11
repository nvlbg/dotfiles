LINUX := alacritty git i3 inputrc rofi ssh systemd tmux vim zsh
OSX := alacritty git inputrc karabiner ssh tmux vim zsh
SUDO := caps2esc cron-linux keyboard

default:
	$(error Use `make linux` or `make osx` or `make sudo`)

linux: $(LINUX:%=install-%)
osx: $(OSX:%=install-%)
sudo: $(SUDO:%=install-%)

install-alacritty:
	mkdir -p ~/.config
	rm -rf ~/.config/alacritty
	ln -fs $(PWD)/alacritty ~/.config/alacritty

# do not forget to start system.d service as well
install-caps2esc:
	ln -fs $(shell pwd)/caps2esc/udevmon.yaml /etc/udevmon.yaml
	ln -fs $(shell pwd)/caps2esc/udevmon.service /etc/systemd/system/udevmon.service
	# systemctl enable --now udevmon

install-cron-linux:
	ln -fs $(shell pwd)/vim/vimwiki-sync.sh /etc/local.d/vimwiki-sync.start || true
	ln -fs $(shell pwd)/vim/vimwiki-sync.sh /etc/local.d/vimwiki-sync.stop || true
	crontab $(shell pwd)/vim/vimwiki-sync.cron || true

install-git:
	ln -fs $(PWD)/git/config ~/.gitconfig.custom
	grep '.gitconfig.custom' ~/.gitconfig >/dev/null || \
		echo '\n[include]\n    path = .gitconfig.custom' >> ~/.gitconfig

install-i3:
	mkdir -p ~/.config
	rm -rf ~/.config/i3
	rm -rf ~/.config/polybar
	ln -fs $(PWD)/i3 ~/.config/i3
	ln -fs $(PWD)/polybar ~/.config/polybar

install-inputrc:
	ln -fs $(PWD)/inputrc/inputrc ~/.inputrc
	ln -fs $(PWD)/inputrc/editrc ~/.editrc

install-karabiner:
	mkdir -p ~/.config
	rm -rf ~/.config/karabiner
	ln -fs $(PWD)/karabiner ~/.config/karabiner

install-keyboard:
	ln -fs $(shell pwd)/keyboard/keyboard /etc/default/keyboard

install-rofi:
	mkdir -p ~/.config
	rm -rf ~/.config/rofi
	ln -fs $(PWD)/rofi ~/.config/rofi

install-ssh:
	ln -fs $(PWD)/ssh/config ~/.ssh/config

install-systemd:
	mkdir -p ~/.config/systemd/user
	ln -fs $(PWD)/systemd/ssh-agent.service ~/.config/systemd/user
	systemctl --user enable ssh-agent.service
	# ln -fs $(PWD)/systemd/keyboard-attached.service ~/.config/systemd/user
	# ln -fs $(PWD)/systemd/keyboard-attached.service /etc/systemd/system/
	# systemctl enable keyboard-attached.service

install-tmux:
	ln -fs $(PWD)/tmux/tmux.conf ~/.tmux.conf

install-vim:
	mkdir -p ~/.config
	rm -rf ~/.config/nvim
	ln -fs $(PWD)/vim ~/.config/nvim

install-zsh:
	ln -fs $(PWD)/zsh/zshrc ~/.zshrc
	ln -fs $(PWD)/zsh/zpreztorc ~/.zpreztorc
