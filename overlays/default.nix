{pkgs, ...}:
{
    nixpkgs.overlays = [
        (self: super: {
            ate = self.callPackage ./ate.nix {};
            mailspring = self.callPackage ./mailspring.nix {};
            deadd-notification-center = self.callPackage ./deadd-notification-center.nix {};
        })
    ];
    environment.systemPackages = with pkgs; [
        ate
        mailspring
        deadd-notification-center
    ];
}