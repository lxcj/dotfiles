{ config, pkgs, lib, ... }:
{
programs.mise = {
  enable = true;
  enableFishIntegration = true;
  globalConfig = {
    settings = {
      ruby.compile = false;
      python.compile = false;
    };
    tools = {
      ruby = "4.0.6";
    };
  };
};
}
