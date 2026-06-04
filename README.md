# Lexis

> *"Here is Lexis, who knows all the words of all languages, almost with a life of his own, helps to decipher and sculpt the darkest languages."*

A modular [NixVim](https://github.com/nix-community/nixvim) configuration — import what you need, leave the rest.

## Features

| Category | Plugins |
|----------|---------|
| **LSP** | bashls, clangd, cssls, emmet_ls, gopls, html, jsonls, nixd, rust_analyzer, texlab, ts_ls |
| **Completion** | nvim-cmp + LuaSnip (buffer, path, nvim_lsp sources) |
| **Formatting/Linting** | none-ls (gofmt, goimports, nixfmt, statix, golangci_lint, shellharden, shfmt, markdownlint) |
| **Debugging** | nvim-dap, dap-ui, dap-virtual-text, dap-go |
| **Fuzzy Finder** | Telescope (fzf-native) |
| **Git** | Gitsigns, Diffview |
| **Navigation** | Flash.nvim, Neo-tree, Which-key, nvim-ufo (folding) |
| **Editing** | nvim-autopairs, nvim-comment, treesitter-textobjects, indent-blankline |
| **UI** | Oxocarbon colorscheme, Lualine (branch/diff/diag/LSP status), Treesitter, Twilight, Render-markdown |
| **Search** | Grug-far (search & replace with preview), Fidget.nvim (LSP progress) |
| **Visual** | nvim-colorizer (inline color highlighting) |
| **Languages** | VimTeX (LaTeX), vim-nix, yuck-vim |
| **Extras** | Trouble, Todo-comments, Codesnap, Undotree, Wilder, Wakatime |

### Keymaps

| Key | Action |
|-----|--------|
| `<space>` | Leader |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<C-p>` | Git files |
| `<leader>e` | Toggle file tree |
| `s` | Flash jump |
| `S` | Flash treesitter |
| `gd` | Go to definition |
| `gD` | Go to references |
| `K` | Hover |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `[d` / `]d` | Prev/next diagnostic |
| `[c` / `]c` | Prev/next git hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `]f` / `[f` | Next/prev function (treesitter) |
| `<leader>nh` | Clear search highlights |
| `<leader>ut` | Toggle undo tree |
| `<leader>tt` | Toggle twilight mode |
| `<leader>sr` | Search & replace |
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | DAP continue |
| `<leader>do` | Step over |
| `<leader>di` | Step into |
| `<leader>du` | Step out |
| `<leader>dr` | DAP REPL |
| `<leader>dt` | Toggle DAP UI |
| `zR` / `zM` | Open / close all folds |
| `zp` | Peek fold content |
| `<leader>dvv` | Open diff view |
| `<leader>dvc` | Close diff view |
| `<leader>s` | CodeSnap (visual) |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dq` | Terminate debugger |
| `<leader>de` | Evaluate expression (visual) |

---

## Installation

### Quick start (all languages included)

Add Lexis to your flake inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lexis = {
      url = "github:EmanuelPeixoto/Lexis";
      inputs.nixpkgs.follows = "nixpkgs";   # deduplicate nixpkgs
    };
  };

  outputs = { nixpkgs, lexis, ... }: {
    # With home-manager:
    homeConfigurations."your-user" = home-manager.lib.homeManagerConfiguration {
      modules = [
        {
          home.packages = [
            lexis.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
```

Then rebuild and run `nvim`.

### Pick only the languages you need

Add `nixvim` as an input, import the Lexis base config, and enable only the LSP servers you want:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lexis = {
      url = "github:EmanuelPeixoto/Lexis";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, lexis, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      homeConfigurations."your-user" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          {
            home.packages = [
              (nixvim.legacyPackages.${system}.makeNixvimWithModule {
                inherit pkgs;
                module = {
                  imports = [ (import (lexis + "/config")) ];

                  # Disable unwanted servers:
                  plugins.lsp.servers = {
                    bashls.enable = false;
                    clangd.enable = false;
                    cssls.enable = false;
                    emmet_ls.enable = false;
                    html.enable = false;
                    jsonls.enable = false;
                    texlab.enable = false;
                    ts_ls.enable = false;
                  };
                };
              })
            ];
          }
        ];
      };
    };
}
```

### Granular control — import modules individually

For maximum control, import only the specific config files you want:

```nix
{
  home.packages = [
    (nixvim.legacyPackages.${system}.makeNixvimWithModule {
      inherit pkgs;
      module = {
        imports = [
          # Core
          (lexis + "/config/native/imports.nix")   # vim options
          (lexis + "/config/autocmd.nix")          # auto commands
          (lexis + "/config/extraPlugins.nix")     # extra vim plugins
          (lexis + "/config/extraPackages.nix")    # system packages

          # UI
          (lexis + "/config/ui/imports.nix")       # colorscheme, lualine, treesitter, etc.

          # Utils
          (lexis + "/config/utils/imports.nix")    # telescope, gitsigns, flash, etc.

          # LSP — completion and diagnostics
          (lexis + "/config/lsp/cmp.nix")          # autocomplete
          (lexis + "/config/lsp/trouble.nix")      # diagnostic list
          (lexis + "/config/lsp/none-ls.nix")      # formatting & linting

          # LSP — pick only the servers you need:
          (lexis + "/config/lsp/servers/nix.nix")
          (lexis + "/config/lsp/servers/go.nix")
          (lexis + "/config/lsp/servers/rust.nix")
          (lexis + "/config/lsp/servers/typescript.nix")
        ];

        globals.mapleader = " ";
        colorschemes.oxocarbon.enable = true;
      };
    })
  ];
}
```

### Available LSP server modules

Import them individually from `lexis + "/config/lsp/servers/"`:

| File | Server | Language |
|------|--------|----------|
| `bash.nix` | `bashls` | Bash |
| `c.nix` | `clangd` | C/C++ |
| `go.nix` | `gopls` | Go |
| `json.nix` | `jsonls` | JSON |
| `nix.nix` | `nixd` | Nix |
| `rust.nix` | `rust_analyzer` | Rust (+ rustc/cargo) |
| `tex.nix` | `texlab` | LaTeX |
| `typescript.nix` | `ts_ls` | TypeScript |
| `web.nix` | `cssls` + `emmet_ls` + `html` | CSS/HTML/SCSS |

## Standalone usage

```bash
# Build and run directly
nix run github:EmanuelPeixoto/Lexis

# Or clone and build
git clone https://github.com/EmanuelPeixoto/Lexis
cd Lexis
nix run .
```

## Roadmap

- [x] **DAP** — Debug Adapter Protocol with dap-go (~#2)
- [x] **nvim-ufo** — Treesitter + LSP folding (~#4)
- [x] **Lualine** — Statusline with branch, diff, diagnostics, LSP status (~#5)
- [x] **Fidget.nvim** — LSP progress spinner (~#7)
- [x] **nvim-colorizer** — Inline color highlighting (~#12)
- [x] **Grug-far** — Search & replace with preview (~#15)
- [ ] **Migrate `none-ls` to `conform.nvim` + `nvim-lint`**  
  `none-ls` is archived upstream. Replace with async formatting and linting once nixvim modules are available.
