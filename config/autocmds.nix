{
  config.autoCmd = [
    {
      event = "FileType";
      pattern = [
        "css"
        "html"
        "nix"
      ];
      command = "set tabstop=2 softtabstop=2 shiftwidth=2";
    }
    {
      event = "FileType";
      pattern = [
        "csv"
      ];
      callback = {
        __raw = ''
          function()
              local buf = vim.api.nvim_get_current_buf()
              local ok, lines = pcall(vim.api.nvim_buf_get_lines, buf, 0, -1, false)
              if not ok or not lines or vim.tbl_isempty(lines) then return end

              -- Find first non-empty line as header
              local header_lnum, header_line
              for i = 1, #lines do
                  local line = lines[i]
                  if line:match("%S") then
                      header_lnum = i
                      header_line = line
                      break
                  end
              end
              if not header_line then return end

              -- Detect delimiter by first occurrence
              local delimiters = {",", ";", "\t", "|"}
              local delimiter = ","
              for _, d in ipairs(delimiters) do
                  if header_line:find(d, 1, true) then
                      delimiter = d
                      break
                  end
              end

              -- Call CsvViewToggle
              vim.cmd(string.format("CsvViewToggle delimiter=%s display_mode=border header_lnum=%d", delimiter, header_lnum))
          end
        '';
      };
    }
  ];
}
