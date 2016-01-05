{

  allowUnfree = true;  # for chromium plugins
  packageOverrides = pkgs_: with pkgs_; {

    linux-desktop-pkgs = with pkgs; buildEnv {
      name = "linux-desktop-pkgs";
      paths = [
        (chromium.override {
          enablePepperFlash = true;
        })
        inconsolata
      ];
    };

    linux-cli-pkgs = with pkgs; buildEnv {
      name = "linux-cli-pkgs";
      paths = [
        # "standard" system utils
        lsof
        xorg.xmodmap  # rebind capslock -> esc

        # hw introspection/monitoring
        lm_sensors

        # my extra system utils
        htop
        psmisc
        tree

        # cli / dev tools
        ack
        git
        gnupg
        irssi
        mosh
        tmux
      ];
    };

    linux-languages = with pkgs; buildEnv {
      name = "linux-languages";
      paths = [
        python
      ];
    };

  };
}
