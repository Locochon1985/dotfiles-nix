{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = ''
          function()
            return { timeout_ms = 200, lsp_fallback = true }, on_format
           end
        '';
        notify_on_error = true;
        formatters_by_ft = {
          c = [
            [
              "astyle"
            ]
          ];
          html = [
            [
              "prettierd"
            ]
          ];
          css = [
            [
              "prettierd"
            ]
          ];
          javascript = [
            [
              "prettierd"
            ]
          ];
          typescript = [
            [
              "prettierd"
            ]
          ];
          python = [
            "black"
            "isort"
          ];
          lua = ["stylua"];
          nix = ["alejandra"];
        };

        formatters = {
          black = {
            command = "${lib.getExe pkgs.black}";
          };
          isort = {
            command = "${lib.getExe pkgs.isort}";
          };
          alejandra = {
            command = "${lib.getExe pkgs.alejandra}";
          };
          prettierd = {
            command = "${lib.getExe pkgs.prettierd}";
          };
          stylua = {
            command = "${lib.getExe pkgs.stylua}";
          };
          astyle = {
            command = "${lib.getExe pkgs.astyle}";
          };
        };
      };
    };
  };
}
