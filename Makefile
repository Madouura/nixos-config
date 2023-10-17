USER = $(shell whoami)
HOSTNAME = $(shell hostname)
HWCFG_GEN_DIR = hosts/${HOSTNAME}
NIX_CHANNEL_STABLE = https://channels.nixos.org/nixos-unstable
NIX_CHANNEL_UNSTABLE = https://channels.nixos.org/nixos-unstable
HOME_MANAGER_CHANNEL = https://github.com/nix-community/home-manager/archive/refs/heads/master.tar.gz

ifndef USER
	$(error Username unknown)
endif

ifndef HOSTNAME
	$(error Hostname unknown)
endif

.PHONY: all garbage-collect update-flake update-system-channels update-user-channels generate-hardware-configuration switch boot test dry-activate home-manager upgrade-switch upgrade-boot upgrade-user garbage-collect-user garbage-collect-system

all: upgrade-switch upgrade-user

garbage-collect: garbage-collect-system garbage-collect-user

update-flake:
	nix flake update
	git add flake.nix flake.lock
	git commit -m "flake: update" || true
	git push

update-system-channels:
	if [ "${USER}" == "root" ]; then \
		nix-channel --add ${NIX_CHANNEL_STABLE} nixos; \
		nix-channel --add ${NIX_CHANNEL_UNSTABLE} nixos-unstable; \
		nix-channel --update; \
	else \
		sudo nix-channel --add ${NIX_CHANNEL_STABLE} nixos; \
		sudo nix-channel --add ${NIX_CHANNEL_UNSTABLE} nixos-unstable; \
		sudo nix-channel --update; \
	fi

update-user-channels:
	if [ "${USER}" == "root" ]; then \
		make update-system-channels; \
	else \
		nix-channel --add ${NIX_CHANNEL_STABLE} nixos; \
		nix-channel --add ${NIX_CHANNEL_UNSTABLE} nixos-unstable; \
		nix-channel --add ${HOME_MANAGER_CHANNEL} home-manager; \
		nix-channel --update; \
	fi

generate-hardware-configuration:
	nixos-generate-config --show-hardware-config > ${HWCFG_GEN_DIR}/autogen-hwcfg.nix
	git add ${HWCFG_GEN_DIR}/autogen-hwcfg.nix
	git commit -m "$(subst /,: ,${HWCFG_GEN_DIR}): regenerate autogen-hwcfg.nix" || true
	git push

switch:
	nixos-rebuild switch --use-remote-sudo --flake .#${HOSTNAME} -L

boot:
	nixos-rebuild boot --use-remote-sudo --flake .#${HOSTNAME} -L

test:
	nixos-rebuild test --use-remote-sudo --flake .#${HOSTNAME} -L

dry-activate:
	nixos-rebuild dry-activate --use-remote-sudo --flake .#${HOSTNAME} -L

home-manager:
	home-manager switch --flake .#${USER}@${HOSTNAME}

upgrade-switch:
	make update-flake
	make update-system-channels
	make generate-hardware-configuration
	make switch

upgrade-boot:
	make update-flake
	make update-system-channels
	make generate-hardware-configuration
	make boot

upgrade-user:
	make update-flake
	make update-user-channels
	make home-manager

garbage-collect-system:
	if [ "${USER}" == "root" ]; then \
		make garbage-collect-user; \
	else \
		sudo nix-collect-garbage -d; \
	fi

garbage-collect-user:
	nix-collect-garbage -d

	if [ "${USER}" != "root" ]; then \
		home-manager expire-generations "-1 second"; \
		nix-collect-garbage -d; \
	fi
