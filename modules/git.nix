{ ... }:
{
  programs.git = {
    enable = true;
    settings.init.defaultBranch = "main";
    settings.user = {
      name = "lxcj";
      email = "1714997+lxcj@users.noreply.github.com";
    };
    settings.url = {
      "git@github.com:" = {
        insteadOf = "https://github.com/";
      };
    };
  };
}
