{
  # All LSP servers — import only what you need in your custom config:
  #   imports = [ inputs.lexis.nixvimModules.default ./path/to/servers/go.nix ];
  imports = [
    ./bash.nix
    ./c.nix
    ./go.nix
    ./json.nix
    ./nix.nix
    ./rust.nix
    ./tex.nix
    ./typescript.nix
    ./web.nix
  ];
}
