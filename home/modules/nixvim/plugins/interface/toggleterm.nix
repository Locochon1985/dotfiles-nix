{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts = {
          border = "curved";
          height = 20;
          width = 80;
        };
        open_mapping = "[[<C-a>]]";
      };
    };
  };
}
