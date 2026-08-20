{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        forwardAgent = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
