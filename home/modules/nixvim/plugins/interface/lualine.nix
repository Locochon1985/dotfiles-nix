{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = ["neo-tree"];
        extensions = ["fzf"];
        theme = "auto";
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        sections = {
          lualine_x = [
            {
              __unkeyed.__raw = ''
                function()
                    local msg = ""
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end
              '';
              icon = "";
              color.fg = "#ffffff";
            }
            "encoding"
            "fileformat"
            "filetype"
          ];
          lualine_z = [''" " .. os.date("%R")''];
        };
      };
    };
  };
}
