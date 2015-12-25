{
  allowUnfree = true;  # for chromium plugins

  packageOverrides = pkgs_: with pkgs_; {
    walts = with pkgs; buildEnv {
      name = "walts";
      paths = [
        (chromium.override {
          enablePepperFlash = true;
        })
        gnupg
        git
        inconsolata
        irssi
        mosh
        ack
        python
        tmux
        tree
      ];
    };
  };
}
