{
  description = "meowvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # all plugins that are not present in nixpkgs.vimPlugins need to be added here
    # they get directly fetched from git and build on the fly
  };

  outputs = { self, nixpkgs, flake-utils, nixpkgs-unstable, ... }@inputs:
    {
      # make it easy to use this flake as an overlay
      overlay = final: prev: {
        neovim = self.packages.${prev.system}.default;
      };

      meowvim = { config, lib, ... }: with lib; {
        options.meowvim = {
	  ideavim.enable = mkEnableOption "IntilliJ IDEA integration";
	  vscode.enable = mkEnableOption "VSCode integration";
	};

	config = with config.meowvim; {
	  home.file = {
	    ideavim = mkIf ideavim.enable {
	      target = ".ideavimrc";
	      text = fileContents ./base.vim;
	    };

	    vscode = mkIf vscode.enable {
	      target = ".vscodevimrc";
	      text = fileContents ./base.vim;
	    };
	  };
	};
      };
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          # enable all packages
          config = { allowUnfree = true; };
        };

	unstable = import nixpkgs-unstable { inherit system; };

        # installs a vim plugin from git
        plugin = with pkgs; repo: vimUtils.buildVimPlugin {
          pname = "${lib.strings.sanitizeDerivationName repo}";
          version = "main";
          src = builtins.getAttr repo inputs;
        };

        config = import ./config.nix { inherit pkgs plugin unstable; };
      in
      with config; with pkgs; rec {
        apps.default = flake-utils.lib.mkApp {
          drv = packages.default;
          exePath = "/bin/nvim";
        };

        packages.default = wrapNeovim neovim-unwrapped {
          viAlias = true;
          vimAlias = true;
          withPython3 = true;
          withNodeJs = true;
          withRuby = true;
          extraMakeWrapperArgs = ''--prefix PATH : "${lib.makeBinPath extraPackages}"'';
          configure = {
	    customRC = neovimConfig;
            packages.myVimPackage = with vimPlugins; {
              start = startPlugins;
              opt = optPlugins;
            };
          };
        };
      }
    );
}
