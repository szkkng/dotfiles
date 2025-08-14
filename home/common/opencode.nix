{ ... }:
{
  programs.opencode = {
    enable = true;
    settings = {
      autoupdate = false;
      share = "disabled";
      keybinds = {
        leader = "ctrl+o";
        input_newline = "shift+enter";
        messages_page_up = "ctrl+b";
        messages_page_down = "ctrl+f";
      };
      permission = {
        edit = "ask";
        bash = "ask";
        webfetch = "allow";
      };
      agent = {
        build = {
          mode = "primary";
          model = "github-copilot/gpt-5";
          tools = {
            write = true;
            edit = true;
            bash = true;
          };
        };
        plan = {
          mode = "primary";
          model = "github-copilot/gpt-5-mini";
          tools = {
            write = false;
            edit = false;
            bash = false;
          };
        };
        review = {
          description = "Reviews code for best practices and potential issues";
          mode = "subagent";
          model = "github-copilot/gpt-5";
          tools = {
            write = false;
            edit = false;
          };
          prompt = "You are a code reviewer. Focus on security, performance, and maintainability.";
        };
      };
    };
  };
}
