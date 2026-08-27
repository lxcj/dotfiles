{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
    ];
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -g fish_autosuggestion_enabled 0
      set fish_prompt_pwd_dir_length 20
      set -g hydro_prefix_git " "
      set -g hydro_cmd_duration_threshold 43200000 # set to 12h to avoid displaying duration
 
      # Remove underline from command lines
      set fish_color_command normal
      set fish_color_valid_path
      set fish_color_option normal
    '';
    shellAliases = {
      cat = "bat --plain";
      ls = "ls -1Fv --group-directories-first --color=auto";
      la = "ls -A";
      ll = "ls -l";
      lla = "ls -lA";
      lt = "tree -L 3 -a -I '.git|.jj|node_modules'";
      tmp = "cd $(mktemp -d)"; # cd to a new temp folder
    };
    shellAbbrs = {
      c = "clear";
      f = "fzf";
      g = "git";
      gs = "git status -s";
      ga = "git add";
      gc = "git commit";
      gca = "git commit --all";
      gl = "git log --oneline -n 10";
      glg = "git log --oneline --graph --all --stat";
      gd = "git diff";
      mkdir = "mkdir -p";
      nv = "nvim";
    };
  };
}
