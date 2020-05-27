{ pkgs, ... }:
{
  users.users.tk = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "audio" "video" "libvirtd" "dialout" "networkmanager" "docker" "mpd" "pulseaudio" "adbusers"];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhIiCWD2SuqOz4D8hi4XvEWxlnYE9TqW74M6lJQ0SCWb0cmi2Fo+mihaK8xUDnmU21Uz25oEInM2WM8OGLphYSxZoydQCkYTKPizpbf42N8ShU5W137+taLrNDdlayCEDlwR0jLcKTmO1bxv2HhZjevmLHA2jq9YlEu1XVo3agv+kLw0PqOwvF6P1x9inVTI673WEgS5RZ9P1Jc64BZN8fhn7ecgGv7Cs/UG22JYDnPJQIc4ZdzHihsoMw8+kR8eM3fJQyMvOuper8RD271vs1p6aVwqASsP/X0vNldoC8jUwgeTO27tZPyeW9fvxvNN1SWLUJhc0tN+v7Orcp0rlh tk@tk-XPS-13-9350"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrma45kRG5jIwu5rk1B/Wi6h0FNCv20yi0YQe1qNdVBiSjAUIzQyJHOL5GNlvQxiluVZCq1mhqg9KRP9v2FZCqMbpQevbZzKpzQLGLFtYuFmesOO4xiqjH0nE+C9Psk37vl5Ye2dZ+xeEjkeNY0IPkw/eAHx40erSwxb06LOQNq0/Oq5UUHlftmp1ijVusC4AREvQQ7lnkvJ0Kr7FpDydlhAnuYDoX17F9vTzBJ8UGwnd8kxcaYAnmAQ7kXxgnUmqhxHpndZMgRPR2Y5LwUIcwXjnptr/tKwOmlGlwNTCzM8kTbz4q7nvEaCFzVYhbL5qRiVZETzNRLQiq9Jg0rodR tk@eddi"
    
    #Test if I use themn, otherwise throw them away in 1 Month
    #"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJnNSFguEdI5En0/wpEZbLfvcu8rhTb2BqcXQnugBNb8 tk@eddi"
    #"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINhEDuKhdN2GwB45d3ZnSDkDf59xGurF1FarrxVRMoA4 tk@zaphod"
    #"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKcXyAbPT+Dftn03ATizzGGMBtkAJvi3ut3BOiOkoXT4 tk@the-guide"
    ];
    packages = with pkgs; [
    ];
  };
}
