# lwdim's nixos configuration flake

## iso image

configurations for the iso image are under /hosts/isoimage

to create the iso image use one of the two commands

```
[user@nixos]$ nix build .#nixosConfigurations.isoimage.config.system.build.isoImage
```
or
```
[user@nixos]$ nix run nixpkgs#nixos-generators -- --format iso --flake /etc/nixos#isoimage -o result
```
