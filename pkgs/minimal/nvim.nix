{
  config,
  lib,
  ...
}: {
  programs = {
    nvf = {
      # Text editor (NVIM wrapper)
      enable = true;
      defaultEditor = true;
      settings = {
        vim = {
          viAlias = true; # 'vi' = 'nvim'
          vimAlias = true; # 'vim' = 'nvim'

          theme = {
            enable = true;
            name = "catppuccin";
            style = "auto";
            transparent = true;
          };

          statusline.lualine.enable = true; # Status bar
          tabline.nvimBufferline.enable = true; # Tab bar
          visuals = {
            nvim-scrollbar.enable = true; # Add a scrollbar. Bloat?
            nvim-web-devicons.enable = true; # Add nerdfont icons. Bloat?
            nvim-cursorline.enable = true; # Highlight and underline word under cursor. Bloat?
            highlight-undo.enable = true; # Highlight what's been undo/redo.
            indent-blankline.enable = true; # Better indications for indentation.
          };

          clipboard.enable = true;

          utility = {
            ccc.enable = true; # Should replace ui.colorizer.
            images.image-nvim.enable = true; # Render images in nvim. Might be bloat?
            yazi-nvim = { # Use yazi instead of netrw
              enable = true;
              setupOpts.open_for_directories = true;
            };
          };

          # Tests?
          binds = {
            whichKey.enable = true; # Pop-up with available combos when you press a key (i.e: d->w Delete next word)
            cheatsheet.enable = true; # ':Cheatsheet' list keybinds
          };

          treesitter.context.enable = true; # Show context of current nesting

          languages = {
            enableFormat = true; # Might need to add vim.lsp.formatOnSave? raf enables both but seems uselessly redundant
            enableTreesitter = true; # Syntax highlighting, gotodefinitions, etc. Try to swap for vim.treesitter.enable?
            enableExtraDiagnostics = true;

            nix.enable = true;
            bash.enable = true;
            css.enable = true;
            lua.enable = true;
            python.enable = true;
          };
          lsp = {
            # 'Language Server Protocol', bettersyntax highlighting blabla
            enable = true;
            trouble.enable = true; # Diagnostic troubles. Might be bloat?
            otter-nvim.enable = true; # Display declaration of stuff on hover. Not bloat?
            lightbulb.enable = true; # Quick codeActions with a lightbulb symbol. Might be bloat?
          };
          spellcheck = {
            enable = true;
            programmingWordlist.enable = true; # May cause issue on start. Run :DirtytalkUpdate
          };

          telescope = {
            # Find, git, LSP, etc.
            enable = true;
          };

          # Bloat?
          autocomplete.blink-cmp.enable = true; # Modern auto-completer
          autopairs.nvim-autopairs.enable = true; # Automatically closes brackets, etc.
          dashboard.dashboard-nvim.enable = true; # Dashboard for quick access. To change?
          debugger.nvim-dap.enable = true; # Debug app. Add ui? Bloat?
          terminal.toggleterm = {
            # Integrated terminal. Bloat?
            enable = true;
            lazygit.enable = true; # With lazygit integration? Bloat?
          };
          ui = {
            noice.enable = true; # Better cmd, notifications...' UI. Looks like bloat? May neeb notify?
            illuminate.enable = true; # Highlight multiple instances of same word. Bloat?
            fastaction.enable = true; # Think it's redundant with treesitter, LSP... Bloat?
            breadcrumbs = {
              # Additional data in lua status line. Bloat?
              enable = true;
              navbuddy.enable = true; # Opens tree menu of the file. Seems useful but bloat?!
            };
          };
        };
      };
    };
  };
}
