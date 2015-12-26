{
  allowUnfree = true;  # for chromium plugins

  packageOverrides = pkgs_: with pkgs_; {
    walts = with pkgs; buildEnv {
      name = "walts";
      paths = [
        # system utils
        xorg.xmodmap  # rebind capslock -> esc

        # cli
        ack
        git
        gnupg
        irssi
        mosh
        tmux
        tree

        # destop
        (chromium.override {
          enablePepperFlash = true;
        })
        inconsolata

        # languages
        python

      ];
    };
  };
}
