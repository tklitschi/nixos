{pkgs, ...}:
{
    imports = [
        ../modules/tmux.nix
        ../users/root.nix
        #../modules/dns.nix
    ];


    services.netdata.enable = true;

    programs.mosh.enable = true;
    programs.vim.defaultEditor = true;
    boot.plymouth.enable = true;
    time.timeZone = "Europe/Berlin";
}