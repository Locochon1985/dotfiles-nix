{
  programs.nixvim = {
    plugins.flash = {
      enable = true;
    };

    keymaps = [
      {
        mode = ["n" "x" "o"];
        key = "s";
        action = "function() require(\"flash\").jump() end";
        lua = true;
        options = {
          silent = true;
          desc = "Flash";
        };
      }

      {
        mode = ["n" "x" "o"];
        key = "S";
        action = "function() require(\"flash\").treesitter() end";
        lua = true;
        options = {
          silent = true;
          desc = "Flash Treesitter";
        };
      }
    ];
  };
}
