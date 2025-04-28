{
  plugins = { 
    blink-cmp = {
      enable = true;
      settings = {
        completion = {
          documentation = {
            auto_show = true;
          };
          list = {
            selection = {
              auto_insert = false;
              preselect = true;
            };
          };
        };
        signature = {
          enabled = true;
        };
        keymap = { 
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-S-j>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-S-k>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-e>" = [
            "hide"
          ];
          "<C-y>" = [
            "select_and_accept"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];
        };
      };
    };
  };
}
