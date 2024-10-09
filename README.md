# meowvim

A custom neovim config using this template: [breuerfelix/feovim]([https://github.com/breuerfelix/feovim).

## Usage

If this repo is cloned locally:
```bash
nix run .
```

Run anywhere (if nix is installed):
```bash
nix run "github:soikr/meowvim" .
```

As an overlay:
```nix
# inputs from flakes
{ inputs, ... }: {
  nixpkgs.overlays = [
    inputs.meowvim.overlay
    # or
    (self: super: {
      neovim = inputs.meowvim.packages.${self.system}.default;
    })
  ];
}
```

## Update Plugins

```bash
nix flake update
```

# [Make it your own](https://github.com/breuerfelix/feovim?tab=readme-ov-file#make-it-your-own)
