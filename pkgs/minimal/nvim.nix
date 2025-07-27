{ config, lib, ... }:

{
programs = {
    nvf = {
      # Text editor (NVIM wrapper)
      enable = true;
      defaultEditor = true;
      settings = {
        vim = {
          viAlias = true; # 'vi' = 'nvim'
          vimAlias = true; # 'vim' = 'nvim'

          clipboard = {
            enable = true;
          };

          lsp = { # Language Protocol Server (aka syntax highlighting, auto-completion etc)
            enable = true;
          };

          theme = {
            enable = true;
            name = "catppuccin";
            style = "auto";
            transparent = true;
          };
        };
      };
    };
};
