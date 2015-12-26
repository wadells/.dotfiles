{
  allowUnfree = true;  # for chromium plugins

  packageOverrides = pkgs_: with pkgs_; {
    walts = with pkgs; buildEnv {
      name = "walts";
      paths = [

        # cli
        ack
        git
        gnupg
        irssi
        mosh
        tmux
        tree
        xorg.xmodmap  # rebind capslock -> esc

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
