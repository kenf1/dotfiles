{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    python314Full
    R

    quartoMinimal
    rstudio
  ];
}
