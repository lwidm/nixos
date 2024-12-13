# lwdim's nixos configuration flake

## Updating nixos

1. Update the flake inputs:

```zsh
sudo nix flake update
```

2. Rebuild the NixOS configuration:

```zsh
sudo nixos-rebuild switch --flake .#
```

3. Reboot if necessary:

```zsh
sudo reboot
```

## iso image

Configurations for the iso image are under /hosts/isoimage

To create the iso image use one of the two commands

```zsh
[user@nixos]$ nix build .#nixosConfigurations.isoimage.config.system.build.isoImage
```

Or

```zsh
[user@nixos]$ nix run nixpkgs#nixos-generators -- --format iso --flake /etc/nixos#isoimage -o result
```

## rclone

- Usage
  First always load from the cloud

  ```zsh
  rclone sync --interactive --progress <remote>: ~/<remote_fodler>
  ```

  After having done the edits upload to the cloud

  ```zsh
  rclone sync --interactive --progress ~/<remote_fodler> <remote>:
  ```

- OneDrive:
  refer to the [online manual](https://rclone.org/onedrive/)

  ```zsh
  mkdir ~/OneDrive
  ```

  Load files from cloud, **!! If you don't do this you might delete everything!!**:

  ```zsh
  rclone sync --interactive --progress onedrive: ~/OneDrive
  ```

- Google drive:
  if not done already: [create cridentials](https://rclone.org/drive/#making-your-own-client-id)
  otherwise get client id and client secret ready
  follow guide in [online manual](https://rclone.org/drive/). Make sure to enable the `shared-with-me` flag after entering the **advance config**.
  ```zsh
  mkdir ~/GoogleDrive
  ```
  Load files from cloud,**!! If you don't do this you might delete everything!!**:
  ```zsh
  rclone sync --interactive --progress  GoogleDrive: ~/GoogleDrive
  ```
- Box:
  follow guide in [online manual](https://rclone.org/box/)
  Finally to mount the drive run the following command:
  ```zsh
  mkdir ~/Box
  ```
  Load files from cloud, **!! If you don't do this you might delete everything!!**:
  ```zsh
  rclone sync --interactive --progress Box: ~/Box
  ```

## OneDrive (Depreciated)

OneDrive uses the following line in `configuration.nix`

```nix
services.onedrive.enable = true;
```

Then as the user, run the following:

```zsh
onedrive
```

You will be given a login URL, open it in your browser, log in to the appropriate Microsoft account to which your OneDrive account is linked to, and after you are logged in, you get an empty screen. This is good, just copy the URL you are redirecte to and paste it back in the terminal.

Then run the following:

```zsh
systemctl --user enable onedrive@onedrive.service
systemctl --user start onedrive@onedrive.service
```

Check that the service started successfully and is running:

```zsh
systemctl --user status onedrive@onedrive.service
```

To view the log, run the following:

```zsh
journalctl --user -t onedrive | less
```

## Steam

### initialization

run

```zsh
protonup
```

### dgpu

to use dedicated graphics (on Laptops with both integrated and dedicated graphics) either start the system with the dgpu specialization from the boot menu ore prepend the game executable with `nvidia-offload <executable>` (this can be done in the steam settings)

## mounting ntfs drives

first enable the ntfs.nix modules in `configuration.nix`

```nix
ntfs.enable = true;
```

then you should be able to mount the drive by running

```zsh
sudo mount -t ntfs-3g /dev/sdxx /mnt/driveName
```

## Wine

- for 64 bit systems, enable 32 bit architechture
  sudo dpkg --add-architecture i386
  (in my case I didn't do this as I don't have the dpkg command and I am too lazy to figure out how to get it)

- Add `wine-config.nix` to the relevant host
  `wine-config.enable = true;`
-
