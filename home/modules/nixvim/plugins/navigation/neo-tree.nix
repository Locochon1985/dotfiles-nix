{
  programs.nixvim = {
    # Neo-tree is a Neovim plugin to browse the file system
    # https://nix-community.github.io/nixvim/plugins/neo-tree/index.html?highlight=neo-tree#pluginsneo-treepackage
    plugins.neo-tree = {
      enable = true;

      filesystem = {
        filteredItems.hideDotfiles = false;
      };
    };

    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      {
        key = "<C-n>";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          desc = "NeoTree toggle";
        };
      }
    ];
  };
}
