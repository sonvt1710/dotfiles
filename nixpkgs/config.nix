{
  android_sdk.accept_license = true;

  packageOverrides = pkgs: {
    vim = pkgs.vim.overrideAttrs (attrs: rec {
      # Work around quickfix bug in Vim v8.1.1547 (fixed in v8.1.1549).
      version = "8.1.1546";
      src = pkgs.fetchFromGitHub {
        owner = "vim";
        repo = "vim";
        rev = "v${version}";
        sha256 = "01sj4wwcxfqvm5ijh33v4m8kx08p2kabqnqgwc0ym7bc52r6yliw";
      };
      buildInputs = attrs.buildInputs ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
        pkgs.xorg.libX11
        pkgs.xorg.libXext
        pkgs.xorg.libXt
      ];
      configureFlags = attrs.configureFlags ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
        "--with-x"
      ];
    });
  };
}
