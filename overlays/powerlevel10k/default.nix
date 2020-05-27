self: super:
{
  gitstatus = super.callPackage ./pkgs/gitstatus.nix {};
  zsh-powerlevel10k = super.callPackage ./pkgs/zsh-powerlevel10k.nix {};
}
