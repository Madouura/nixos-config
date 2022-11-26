.PHONY: upgrade
USER = $(shell whoami)
HOSTNAME = $(shell hostname)

ifndef USER
	$(error Username unknown)
endif

ifndef HOSTNAME
	$(error Hostname unknown)
endif

all: upgrade

home-gc:
	home-manager expire-generations "-1 second"

system-gc:
	sudo nix-collect-garbage -d

gc:
	make home-gc
	make system-gc

hm:
	home-manager switch --flake .#${USER}@${HOSTNAME}

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

upgrade:
	make update
	make switch
	make hm
