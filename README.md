# lwdim's nixos configuration flake

## iso image

configurations for the iso image are under /hosts/isoimage

to create the iso image use one of the two commands

```zsh
[user@nixos]$ nix build .#nixosConfigurations.isoimage.config.system.build.isoImage
```
or
```zsh
[user@nixos]$ nix run nixpkgs#nixos-generators -- --format iso --flake /etc/nixos#isoimage -o result
```

## OneDrive

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
