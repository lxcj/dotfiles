{ config, pkgs, ... }:
let
  macchiato = {
    base = "#24273a";
    mantle = "#1e2030";
    surface0 = "#363a4f";
    surface1 = "#494d64";
    surface2 = "#5b6078";
    overlay0 = "#6e738d";
    overlay1 = "#8087a2";
    overlay2 = "#939ab7";
    text = "#cad3f5";
    subtext0 = "#a5adcb";
    rosewater = "#f4dbd6";
    pink = "#f5bde6";
    mauve = "#c6a0f6";
    red = "#ed8796";
    peach = "#f5a97f";
    yellow = "#eed49f";
    green = "#a6da95";
    teal = "#8bd5ca";
    sky = "#91d7e3";
    sapphire = "#7dc4e4";
    blue = "#8aadf4";
    lavender = "#b7bdf8";
  };
in
{
  home.packages = with pkgs; [
      pi-coding-agent
  ];

  home.file.".pi/agent/prompts".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/config/agents/pi/prompts";

  home.file.".pi/agent/skills".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/config/agents/pi/skills";

  home.file.".pi/agent/themes/catppuccin-macchiato.json".text = builtins.toJSON {
    "$schema" = "https://raw.githubusercontent.com/earendil-works/pi/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json";
    name = "catppuccin-macchiato";

    vars = macchiato;

    colors = {
      accent = "mauve";
      border = "surface1";
      borderAccent = "lavender";
      borderMuted = "surface0";
      success = "green";
      error = "red";
      warning = "yellow";
      muted = "overlay1";
      dim = "overlay0";
      text = "";
      thinkingText = "overlay2";

      selectedBg = "surface0";
      userMessageBg = "surface0";
      userMessageText = "";
      customMessageBg = "mantle";
      customMessageText = "";
      customMessageLabel = "blue";
      toolPendingBg = "mantle";
      toolSuccessBg = "#24332c";
      toolErrorBg = "#3a2429";
      toolTitle = "blue";
      toolOutput = "";

      mdHeading = "peach";
      mdLink = "sky";
      mdLinkUrl = "overlay1";
      mdCode = "green";
      mdCodeBlock = "";
      mdCodeBlockBorder = "surface2";
      mdQuote = "subtext0";
      mdQuoteBorder = "surface2";
      mdHr = "surface1";
      mdListBullet = "mauve";

      toolDiffAdded = "green";
      toolDiffRemoved = "red";
      toolDiffContext = "overlay1";

      syntaxComment = "overlay0";
      syntaxKeyword = "mauve";
      syntaxFunction = "blue";
      syntaxVariable = "red";
      syntaxString = "green";
      syntaxNumber = "peach";
      syntaxType = "yellow";
      syntaxOperator = "sky";
      syntaxPunctuation = "overlay2";

      thinkingOff = "surface1";
      thinkingMinimal = "overlay0";
      thinkingLow = "sapphire";
      thinkingMedium = "blue";
      thinkingHigh = "lavender";
      thinkingXhigh = "mauve";
      thinkingMax = "pink";

      bashMode = "peach";
    };

    export.pageBg = "#181926";
    export.cardBg = "#1e2030";
    export.infoBg = "#363a4f";
  };
}
