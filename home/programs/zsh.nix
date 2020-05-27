#{
#  programs.zsh = {
#    enable = true;
#    enableCompletion = true;
#    enableAutosuggestions = true;
#
#    
#    oh-my-zsh = {
#      enable = true;
#      plugins = [ "git" ];
#    };
#
#    initExtra = ''
#      eval "$(direnv hook zsh)"
#    '';
#  };
#}


{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: rec {
    libgit2-romkatv = pkgs.libgit2.overrideAttrs (attr: { 
      src = pkgs.fetchgit { 
        url = "https://github.com/romkatv/libgit2.git";
        rev = "cbe87ba50bf278176a560eb5f6b9288257b9674c";
	sha256 = "0vir2amslbc6v7bcpd0rh06rb34b3yssnhf75pldbzqpx6x81xnx";
      };
    });
  };

  nixpkgs.overlays = [
    (import ../../overlays/powerlevel10k)
  ];
  
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
   
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
    };

    # load custom theme
    promptInit = ''
      GITSTATUS_DAEMON=${pkgs.gitstatus}/bin/gitstatusd
      source ${pkgs.zsh-powerlevel10k}/powerlevel10k/powerlevel10k.zsh-theme
      #ZSH_THEME=powerlevel9k
    '';
  };
}