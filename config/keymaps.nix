{
  globals.mapleader = ",";
  keymaps = [
    {
      mode = [
        ""
        "!"
      ];
      key = "<Up>";
      action = "<Nop>";
    }
    {
      mode = [
        ""
        "!"
      ];
      key = "<Down>";
      action = "<Nop>";
    }
    {
      mode = [
        ""
        "!"
      ];
      key = "<Left>";
      action = "<Nop>";
    }
    {
      mode = [
        ""
        "!"
      ];
      key = "<Right>";
      action = "<Nop>";
    }
    {
      mode = [
        "i"
      ];
      key = "jk";
      action = "<Esc>";
    }
    {
      mode = [
        "n"
      ];
      key = "<C-h>";
      action = ":set hls!<CR>";
    }
    {
      mode = [
        "n"
      ];
      key = "<C-q>";
      action = ":w<CR>";
    }
  ];
}
