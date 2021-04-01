
let
  erlangReleases = builtins.fetchTarball https://github.com/nixerl/nixpkgs-nixerl/archive/v1.0.18-devel.tar.gz;

  pinnedNix =
    builtins.fetchGit {
      name = "nixpkgs-pinned";
      url = "https://github.com/NixOS/nixpkgs.git";
      rev = "acc5f7b18a60bc9b1024e5e1882bf7362e6492e6";
    };


  nixpkgs =
    import pinnedNix {
      overlays = [
        (import erlangReleases)
      ];
    };
in

with nixpkgs;

let
    inherit (stdenv.lib) optionals;
in

mkShell {
  buildInputs = with pkgs; [
    dotnetCorePackages.sdk_5_0
    elixir
    gdb
   ];
  shellHook = ''
      export DOTNET_LOCATION=${dotnetCorePackages.sdk_5_0}/shared/Microsoft.NETCore.App/5.0.0
      export DOTNET_ROOT=${dotnetCorePackages.net_5_0}
    '';
}
