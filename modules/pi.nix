{ pkgs, ... }:
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

  home.file.".pi/agent/prompts/scaffold.md".text = ''
  ---
  description: Greenfield app spec skeleton
  argument-hint: "[what to build]"
  ---
  Build $1. Before writing code, confirm this spec with me:
    - **Stack**: framework, language, runtime (e.g. SvelteKit + Svelte 5 + TS)
    - **Persistence**: localStorage / backend / file
    - **Must-have features**: (list the 5–10 that define "done")
    - **Scope**: MVP only / stretch goals
    - **Design reference**: attach a screenshot or name an app to match
  Produce a short plan first; wait for my approval before coding.
  '';

  home.file.".pi/agent/prompts/review.md".text = ''
  ---
  description: Review uncommitted and staged git changes for bugs, security, and quality
  argument-hint: "[commit range]"
  ---
  Review the current git changes.

  1. Run `git status --short` and `git diff` (`git diff --cached` for staged).
  2. Analyze for bugs, security issues, error-handling gaps, and intent mismatches.
  3. List findings with `file:line` and a concrete fix each.
  4. If clean, say so.

  $ARGUMENTS
  '';

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
