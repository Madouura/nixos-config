HOSTNAME = $(shell hostname)

ifndef HOSTNAME
	$(error Hostname unknown)
endif

.PHONY: update upgrade upgrade-boot

all: upgrade

gc:
	sudo nix-collect-garbage --delete-older-than 7d

switch:
	nixos-rebuild switch --use-remote-sudo --flake .#${HOSTNAME} -L

boot:
	nixos-rebuild boot --use-remote-sudo --flake .#${HOSTNAME} -L

test:
	nixos-rebuild test --use-remote-sudo --flake .#${HOSTNAME} -L

dry:
	nixos-rebuild dry-activate --use-remote-sudo --flake .#${HOSTNAME} -L

update:
	nix flake update
	nix-channel --update
	sudo nix-channel --update
	git commit -am "flake: update" || true
	git push

upgrade:
	make update
	make switch

upgrade-boot:
	make update
	make boot
