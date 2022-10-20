USER = $(shell whoami)
HOSTNAME = $(shell hostname)
NIX_FILES = $(shell find . -name '*.nix' -type f)

ifndef USER
	$(error Username unknown)
endif

ifndef HOSTNAME
	$(error Hostname unknown)
endif

home-manager:
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

upgrade:
	make update
	make switch
	make home-manager
