{ ... }:

{
  programs.bash = {
    enable = true;
    loginShellInit = ''
      if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec start-hyprland
      fi
    '';
  };
}
