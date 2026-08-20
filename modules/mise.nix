{ ... }:
{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig.settings = {
      ruby.compile = false;
      python.compile = false;
    };
  };
}
