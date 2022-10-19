{
  home.file."fs-diff.sh" = {
    executable = true;
    target = "/home/mado/.local/bin/fs-diff.sh";

    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      sudo mkdir /mnt/froot
      sudo mount -o discard=async,compress=zstd /dev/mapper/cryptrot1 /mnt/froot

      OLD_TRANSID=$(sudo btrfs subvolume find-new /mnt/froot/root-blank 9999999)
      OLD_TRANSID=''${OLD_TRANSID#transid marker was }

      sudo btrfs subvolume find-new "/mnt/froot/root" "$OLD_TRANSID" |
      sed '$d' |
      cut -f17- -d' ' |
      sort |
      uniq |
      while read path; do
        path="/$path"

        if [ -L "$path" ]; then
          : # The path is a symbolic link, so is probably handled by NixOS already
        elif [ -d "$path" ]; then
          : # The path is a directory, ignore
        else
          echo "$path"
        fi
      done

      sudo umount /mnt/froot
      sudo rmdir /mnt/froot
    '';
  };
}
