{
  programs.nixvim = {
    plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          separatorStyle = "slant"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin“
          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
  ];
  };
}
