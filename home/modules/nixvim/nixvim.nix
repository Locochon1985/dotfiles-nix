{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Plugins
    ./plugins/code/conform.nix
    ./plugins/code/lsp.nix
    ./plugins/code/nvim-cmp.nix
    ./plugins/code/treesitter.nix

    ./plugins/extra/autopairs.nix
    ./plugins/extra/gitsigns.nix

    ./plugins/interface/alpha.nix
    ./plugins/interface/bufferline.nix
    ./plugins/interface/indent-blankline.nix
    ./plugins/interface/lualine.nix
    ./plugins/interface/noice.nix
    ./plugins/interface/toggleterm.nix

    ./plugins/navigation/flash.nix
    ./plugins/navigation/neo-tree.nix
    ./plugins/navigation/telescope.nix
    ./plugins/navigation/which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          # any other, such as 'storm', 'moon', or 'day'.
          style = "dragon";
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      clipboard = {
        providers = {
          wl-copy.enable = true; # For Wayland
          xsel.enable = true; # For X11
        };
        register = "unnamedplus";
      };
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      # list = true;
      # listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      hlsearch = true;
    };

    keymaps = [
      # Clear highlights on search when pressing <Esc> in normal mode
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      {
        mode = "n";
        key = "<leader>oo";
        action = "<cmd>tabnew<CR>";
      }
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>tabc<CR>";
      }
      {
        mode = "n";
        key = ";";
        action = ":";
      }
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<CR>";
      }
      {
        mode = "i";
        key = "jj";
        action = "<Esc>";
      }
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    autoCmd = [
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];

    plugins = {
      notify = {
        enable = true;
      };
      todo-comments = {
        enable = true;
        settings.signs = true;
      };
      barbecue = {
        enable = true;
      };
      dressing = {
        enable = true;
      };
      web-devicons = {
        enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-surround
      friendly-snippets
      supermaven-nvim
    ];

    extraConfigLua = ''
      require("supermaven-nvim").setup({})

      require("notify").setup({
        background_colour = "#000000",
      })
    '';
  };
}
